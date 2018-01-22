
---- Beacon State Monitor
---- 生成第三期状态表temp.temp_beacon_state_phase_iii

---- Abnormal Beacons (State code 30)
drop table if exists temp.temp_shop_beacon_num; 
create table temp.temp_shop_beacon_num as 
select distinct t1.tracking_id, t1.shop_id, t2.shop_id as building_id
from  dw_ai.dw_ai_beacon_tracking_event t1, ---- 挑出有beacon信号的订单
      dw_ai.dw_ai_clairvoyant_beacon t2
where t1.rider_id=t2.rider_id  ---- 该订单到店到离店时间内听到的beaconid
and t2.detected_at>t1.arrive_rst_at 
and t2.detected_at<t1.pickup_at 
and t2.rssi>=-85 
and t1.dt<=get_date(-1) and t2.dt<=get_date(-1) 
and t1.dt>=get_date(-30) and t2.dt>=get_date(-30) 
and t1.dt=t2.dt;  

---- 每个beacon在不同商铺出现的频数（即距离） 
drop table if exists temp.temp_beacon_freq; 
create table temp.temp_beacon_freq as 
select building_id, shop_id, count(distinct tracking_id) as c_1 ---- 计算beaconid和shopid对应订单数
from temp.temp_shop_beacon_num ---- 注意shopid为有订单的商户
where shop_id in (select distinct t2.building_id from temp.temp_shop_beacon_num t2)
group by building_id, shop_id; 

---- 后三个表可以保存，表示挑出频数最大不是自己的商户，即异常商户
drop table if exists temp.temp_beacon_shop_match; 
create table temp.temp_beacon_shop_match as 
select t1.shop_id,  t2.building_id, t1.m_c 
from (select shop_id, max(c_1) as m_c from temp.temp_beacon_freq group by shop_id) t1, 
      temp.temp_beacon_freq t2 
where t1.shop_id=t2.shop_id 
and t1.m_c=t2.c_1;

drop table if exists temp.temp_beacon_shop_id_match; 
create table temp.temp_beacon_shop_id_match as 
select distinct t1.shop_id 
from temp.temp_beacon_shop_match t1, temp.temp_beacon_shop_match t2 
where t2.shop_id=t1.shop_id 
and t1.shop_id=t2.building_id;

drop table if exists temp.temp_beacon_shop_not_match; 
create table temp.temp_beacon_shop_not_match as 
select distinct t1.shop_id 
from temp.temp_beacon_shop_match t1 
where not exists  (
      select * from temp.temp_beacon_shop_id_match t2 
      where t1.shop_id=t2.shop_id);
---- State code 30 beacons found

---- Beacons in the shop that have no orders (State code 60)
drop table if exists temp.temp_has_beacon; ---- 过去30天有beacon数据
create table temp.temp_has_beacon as 
select distinct shop_id 
from dw_ai.dw_ai_clairvoyant_beacon 
where dt<=get_date(-1) and dt>=get_date(-30);

drop table if exists temp.temp_has_beacon_has_order; ---- 过去30天有订单且有beacon信号的餐厅
create table temp.temp_has_beacon_has_order as 
select distinct restaurant_id  
from dm.dm_tms_apollo_waybill_wide_detail 
where dt<=get_date(-1) 
and dt>=get_date(-30) 
and restaurant_id in (
      select shop_id from temp.temp_has_beacon); 

drop table if exists temp.temp_has_beacon_no_order; ---- 有beacon信号但没有订单的商户
create table temp.temp_has_beacon_no_order as 
select t1.shop_id 
from temp.temp_has_beacon t1 
where not exists (
      select * from temp.temp_has_beacon_has_order t2 
      where t1.shop_id=t2.restaurant_id); 
---- State code 60 beacons found

---- Initial table with state 40 and others (20)
drop table if exists temp.temp_beacon_state_initial_phase_iii;
create table temp.temp_beacon_state_initial_phase_iii
as
select t01.shop_id,t01.beacon_id, t01.beacon_uuid,
(case when t01.shop_id = '' then 10 when t02.beacon_uuid is null then 40 else 20 end) as state
from (
	select distinct beaocnid as beacon_id, beacon_uuid, shopid as shop_id
	from temp.temp_beacon_manifest 
) t01	---- Beacon Manifest
full outer join (
	select distinct beacon_id, uuid as beacon_uuid
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt = get_date(-1) and get_date(detected_at) > get_date(-30)
) t02
on t01.beacon_id = t02.beacon_id and t01.beacon_uuid = t02.beacon_uuid


---- Pick state 30 shops
drop table if exists temp.temp_beacon_state_add_30;
create table temp.temp_beacon_state_add_30
as
select t01.shop_id,t01.beacon_id, t01.beacon_uuid,
(case when t02.shop_id is not null then 30 else t01.state end) as state
from 
temp.temp_beacon_state_initial_phase_iii t01
full outer join
temp.temp_beacon_shop_not_match t02
on t01.shop_id = t02.shop_id

---- Pick state 60 shops and make final table
drop table if exists temp.temp_beacon_state_phase_iii;
create table temp.temp_beacon_state_phase_iii
as
select t01.shop_id,t01.beacon_id, t01.beacon_uuid,
(case when t02.shop_id is not null then 60 else t01.state end) as state
from 
temp.temp_beacon_state_add_30 t01
full outer join
temp.temp_has_beacon_no_order t02
on t01.shop_id = t02.shop_id

	 


