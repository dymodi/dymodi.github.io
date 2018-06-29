
---- 为了和出租车数据比较，抽一份平台的代码出来



select tracking_id, shop_id, rider_id, rider_accept_order_time as accept_at,
rider_arrive_restaurant_time as arrive_rst_at, 
rider_pickup_time as pickup_at,
rider_delivery_time as deliver_at, dt
from pub.dmd_tms_waybill_tracking_wide_day
where dt = get_date(-1) 
and (is_platform_timeout_compensate_order = '是' or is_tms_timeout_compensate_order = '是')



---- 超时原因
select * from pub.dmd_tms_waybill_tracking_wide_day
where dt = get_date(-1) 
and (is_platform_timeout_compensate_order = '是' or is_tms_timeout_compensate_order = '是')


---- 统计每天有多少单经过两个或更多人
select get_date(created_at) as create_date, count(distinct tracking_id) as exchange_order_cnt
from dw.dw_tms_lpd_knight_tb_exchange_order_record
where dt > get_date(-10) and get_date(created_at) > get_date(-10)
group by get_date(created_at)
order by create_date

---- 统计每天总共有多少单来看看比例
select get_date(created_at) as created_date, count(distinct tracking_id) as all_order_cnt
from dw.dw_tms_tb_tracking_event
where dt > get_date(-10) and get_date(created_at) > get_date(-10)
and shipping_state = 40
group by get_date(created_at)
order by created_date


---- 看哪些骑手的数据多？
select target_id, count(distinct created_at) as data_cnt
from dw.dw_tms_clairvoyant_tb_beacon
where dt = get_date(-1)
group by target_id
order by data_cnt desc
---- Results:
---- 06-13,111186242, 864014, 10777260, 106683498, 10799794

---- 把需要的数据抽出来
select id, created_at, updated_at, target_type, target_id,
parse_json_object(beacon_info,'accelerometer') as accelerometer, 
parse_json_object(beacon_info,'beaconRssi') as rssi,
parse_json_object(beacon_info,'detectedAt ') as detected_at, dt
from dw.dw_tms_clairvoyant_tb_beacon
where dt = get_date(-1) and target_id = 111186242
order by detected_at
limit 10000


select * from dw.dw_tms_tb_tracking_event 
where dt = '2018-03-11' and tracking_id = '3000023295271083370'



---- 算一个每小时的单perfect rider的到店监测率
---- 先得到一个30天Beacon的清单
drop table if exists temp.temp_beacon_shops_heard_beacon_in_30_days;
create table temp.temp_beacon_shops_heard_beacon_in_30_days as
	select distinct shop_id
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-30)


---- 先得到一个14天Beacon的清单
drop table if exists temp.temp_beacon_shops_heard_beacon_in_14_days;
create table temp.temp_beacon_shops_heard_beacon_in_14_days as
	select distinct shop_id
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-14)

---- 得到一个30天骑手的清单
drop table if exists temp.temp_beacon_riders_heard_beacon_in_30_days;
create table temp.temp_beacon_riders_heard_beacon_in_30_days as
	select distinct rider_id
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-30)

---- 算一个每小时的单perfect rider的到店监测率
---- 相当于重新给个分母
drop table temp.temp_beacon_perfect_one_hour_rider;
create table temp.temp_beacon_perfect_one_hour_rider as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt > get_date(-7)
) t01
join (
	select * 
	from temp.temp_beacon_shops_heard_beacon_in_14_days
) t02
on t01.shop_id = t02.shop_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-7)
) t03
on t01.dt = t03.dt and t01.rider_id = t03.rider_id
and hour(t01.pickup_at) = hour(t03.detected_at)


---- 算一个每小时的单perfect shop的到店监测率
---- 相当于重新给个分母
drop table temp.temp_beacon_perfect_one_hour_shop;
create table temp.temp_beacon_perfect_one_hour_shop as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt > get_date(-7)
) t01
join (
	select * 
	from temp.temp_beacon_riders_heard_beacon_in_30_days
) t02
on t01.rider_id = t02.rider_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-7)
) t03
on t01.dt = t03.dt and t01.shop_id = t03.shop_id
and hour(t01.pickup_at) = hour(t03.detected_at)

---- 画老板要求的PDF
drop table if exists temp.temp_beacon_perfect_rider_shop_pdf;
create table temp.temp_beacon_perfect_rider_shop_pdf as 
select t01.order_cnt as perfect_order_cnt, t02.order_cnt as should_order_cnt, 
float(t01.order_cnt/t02.order_cnt) as percent
from (
	select shop_id, count(distinct tracking_id) as order_cnt
	from dw_ai.dw_ai_beacon_tracking_event
	where dt > get_date(-7)
	group by shop_id
) t01
right join(
	select shop_id, count(distinct tracking_id) as order_cnt
	from dw_ai.dw_ai_beacon_perfect_rider_tracking_day
	where dt > get_date(-7)
	group by shop_id
)t02
on t01.shop_id = t02.shop_id;


select round(percent,2) as bucket, count(1) as cnt
from temp.temp_beacon_perfect_rider_shop_pdf
group by round(percent,2)
order by bucket


---- 画老板要求的PDF
drop table if exists temp.temp_beacon_perfect_rider_rider_pdf;
create table temp.temp_beacon_perfect_rider_rider_pdf as 
select t01.order_cnt as perfect_order_cnt, t02.order_cnt as should_order_cnt, 
float(t01.order_cnt/t02.order_cnt) as percent
from (
	select rider_id, count(distinct tracking_id) as order_cnt
	from dw_ai.dw_ai_beacon_tracking_event
	where dt > get_date(-7)
	group by rider_id
) t01
right join(
	select rider_id, count(distinct tracking_id) as order_cnt
	from dw_ai.dw_ai_beacon_perfect_rider_tracking_day
	where dt > get_date(-7)
	group by rider_id
)t02
on t01.rider_id = t02.rider_id;

select round(percent,2) as bucket, count(1) as cnt
from temp.temp_beacon_perfect_rider_rider_pdf
group by round(percent,2)
order by bucket








---- 看那些没有到店监测的单
select * 
from （
	select * 
	from dw_ai.dw_ai_beacon_tracking_day
	where dt = get_date(-1)
）t01
full outer join (
	select * 
	from dw_ai.dw_ai_beacon_tracking_event 
	where dt = get_date(-1)
) t02


---- 骑手到店监测，缩小考察范围
---- Find the delivery orders from beacon shop and beacon riders
 drop table if exists temp.temp_rider_event_jdz_0311; 
 create table temp.temp_rider_event_jdz_0311 as 
 	select rider_event.tracking_id, 
 	rider_event.platform_merchant_id as shop_id, 
 	rider_event.rider_id, 
 	rider_event.accept_at, 
 	rider_event.arrive_rst_at, 
 	rider_event.pickup_at, 
 	rider_event.deliver_at, 
 	rider_event.accept_latitude, 
 	rider_event.accept_longitude, 
 	rider_event.arrive_rst_latitude, 
 	rider_event.arrive_rst_longitude, 
 	rider_event.pickup_latitude, 
 	rider_event.pickup_longitude, 
 	rider_event.deliver_latitude, 
 	rider_event.deliver_longitude, 
 	rider_event.dt 
 	from (
 	 select t20.tracking_id, 
 	 	t20.platform_merchant_id, 
 	 	t20.carrier_driver_id as rider_id, 
 	 	t20.ocurred_time as accept_at, 
 		t80.ocurred_time as arrive_rst_at, 
 		t30.ocurred_time as pickup_at, 
 		t40.ocurred_time as deliver_at, 
 		t20.latitude as accept_latitude, 
 		t20.longitude as accept_longitude, 
 		t80.latitude as arrive_rst_latitude, 
 		t80.longitude as arrive_rst_longitude, 
 		t30.latitude as pickup_latitude, 
 		t30.longitude as pickup_longitude, 
 		t40.latitude as deliver_latitude, 
 		t40.longitude as deliver_longitude, 
 		t20.dt 
 		from ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = '2018-03-11' 
 				and get_date(ocurred_time) = '2018-03-11' 
 				and shipping_state = 20 ) t20 
 		join ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = '2018-03-11' 
 				and get_date(ocurred_time) = '2018-03-11' 
 				and shipping_state = 30 ) t30 
 		on t20.tracking_id = t30.tracking_id 
 			and t20.carrier_driver_id = t30.carrier_driver_id 
 		join ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = '2018-03-11' 
 				and get_date(ocurred_time) = '2018-03-11' 
 				and shipping_state = 80 ) t80 
 		on t20.tracking_id = t80.tracking_id 
 			and t20.carrier_driver_id = t80.carrier_driver_id 
 		join ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = '2018-03-11' 
 				and get_date(ocurred_time) = '2018-03-11' 
 				and shipping_state = 40 ) t40 
 		on t20.tracking_id = t40.tracking_id 
 		and t20.carrier_driver_id = t40.carrier_driver_id 
 		) rider_event 
 	join( select distinct shop_id from dw_ai.dw_ai_clairvoyant_beacon where dt = '2018-03-11' ) t04 
 	on rider_event.platform_merchant_id = t04.shop_id 
 	join( select distinct rider_id from dw_ai.dw_ai_clairvoyant_beacon where dt = '2018-03-11' ) t05 
 	on rider_event.rider_id = t05.rider_id;



---- 骑手到店听到Beacon的比例

select * from (
select * from (
	select * 
	from dm.dm_tms_apollo_waybill_wide_detail
	where dt = get_date(-2) 
	and taker_id in (select distinct rider_id from dw_ai.dw_ai_clairvoyant_beacon where dt = get_date(-2))
) t01
where t01.restaurant_id in (select distinct shop_id from dw_ai.dw_ai_clairvoyant_beacon where dt = get_date(-2))
) t03
where t03.tracking_id in (select tracking_id from temp.temp_beacon_tracking_event_jdz_0312)  



---- 把所有单的id取出来
drop table if exists temp.temp_beacon_orders_should_heard_0311;
create table temp.temp_beacon_orders_should_heard_0311 as
select *
from (
 select * from dm.dm_tms_apollo_waybill_wide_detail
 where dt = '2018-03-11'
 and taker_id in (select distinct rider_id from dw_ai.dw_ai_clairvoyant_beacon where dt = '2018-03-11')
) t01
where t01.restaurant_id in (select distinct shop_id from dw_ai.dw_ai_clairvoyant_beacon where dt = '2018-03-11')


--- 把没听到的单拉出来看看
select * 
from (
	select * from temp.temp_beacon_orders_should_heard_0311
) t01
full outer join (
	select * from dw_ai.dw_ai_beacon_tracking_event where dt = '2018-03-11'
) t02
on t01.tracking_id = t02.tracking_id
where t01.tracking_id is not null and t02.tracking_id is null


---- 具体看某个骑手在某个店有没有beacon
select * from dw_ai.dw_ai_clairvoyant_beacon 
where dt = '2018-03-11' and rider_id = 111229210 and shop_id = 157643154


---- tracking_event 表的总单数
select count(*) from dw_ai.dw_ai_beacon_tracking_event where dt = get_date(-1)

select * 
from (
	select  rider_id 
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt = get_date(-1)
) t01
join 


---- 统计重跑之前POI的数据量
select dt, count(*)
from dw_analyst.dw_analyst_beacon_exception_shop_day
where dt > get_date(-30)
group by dt
order by dt


---- 拉最近两天同时听到Beacon较多的骑手
select rider_id, detected_at, count(*) as data_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
group by rider_id, detected_at
order by data_cnt desc



INSERT overwrite TABLE dw_analyst.dw_analyst_beacon_location_jintie partition(dt='${day}')
select shop_id_platform, shop_id_pi, shop_name, beacon_uuid, beacon_major, beacon_minor, latitude, longitude, floor
from temp.beaocn_location_jintie;


INSERT overwrite TABLE dw_analyst.dw_analyst_beacon_location_jintie partition(dt='${day}')
select shop_id_platform, shop_id_pi, shop_name, beacon_uuid, beacon_major, beacon_minor, latitude, longitude, floor
from dw_analyst.dw_analyst_beacon_location_jintie where dt = '${day-1d}';



---- 生成骑手黑名单
drop table if exists temp.temp_beacon_rider_black_list;
create table temp.temp_beacon_rider_black_list as
select distinct t012.rider_id
from (
select rider_id, detected_at, count(*) as data_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-10) and get_date(detected_at) > get_date(-10)
group by rider_id, detected_at
) t011
join (
select *
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-10) and get_date(detected_at) > get_date(-10)
) t012
on t011.rider_id = t012.rider_id and t011.detected_at = t012.detected_at
where t011.data_cnt < 20 and t011.data_cnt > 10;


select rider_id, detected_at, count(*) as data_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
group by rider_id, detected_at
order by data_cnt desc




---- 检查某个骑手有没有同时听到多个Beacon的情况
select rider_id, detected_at, count(*) as data_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where rider_id = 935012
and dt > '2018-02-13' and get_date(detected_at) > '2018-02-13'
group by rider_id, detected_at
order by data_cnt desc


---- 修正POI数据，把同一秒听到太多Beacon的骑手数据去掉
select t012.*, t011.data_cnt
from (
select rider_id, detected_at, count(*) as data_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
group by rider_id, detected_at
) t011
join (
select *
from dw_ai.dw_ai_clairvoyant_beacon
where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
and rssi > -80
) t012
on t011.rider_id = t012.rider_id and t011.detected_at = t012.detected_at
where t012.rssi > -80 and t011.data_cnt < 20



---- 
select t01.shop_id, t01.beacon_id, t01.beacon_state, t02.updated_at, t01.dt
from (
	select * from dw_analyst.dw_analyst_beacon_state_day
	where dt = get_date(-1) and beacon_state = 40
) t01
join (
	select beaocnid as beacon_id, updated_at, shopid as shop_id
	from dw.dw_tms_lpd_infra_beacon_beacon_info
	where dt = get_date(-1)
) t02
on t01.beacon_id = t02.beacon_id and t01.shop_id = t02.shop_id


---- 取差异Beacon
select t1.beacon_id from 
dw_analyst.dw_analyst_beacon_state_day t1,
dw_analyst.dw_analyst_beacon_state_day t2
where t1.dt = '2018-02-02' and t2.dt = '2018-02-03'
and t1.beacon_id = t2.beacon_id
and t1.beacon_state <> 40
and t2.beacon_state = 40


---- 确定相邻两天的无数据beacon的重合情况
drop table if exists temp.temp_beacon_overlap_40;
create table temp.temp_beacon_overlap_40 as
select t01.beacon_id, t01.shop_id
from (
select * from dw_analyst.dw_analyst_beacon_state_day 
where dt = '2018-01-31' and beacon_state = 40
) t01
join (
select * from temp.temp_beacon_state_phase_iii_1_day
where beacon_state = 40
) t02
on t01.beacon_id = t02.beacon_id;

---- 找到非一期部署的Beacon
drop table if exists temp.temp_beacon_overlap_40_not_1st;
create table temp.temp_beacon_overlap_40_not_1st as
select t01.beacon_id as beacon_id, t01.shop_id as shop_id,
t03.beacon_id as beacon_202_id from 
(select * from temp.temp_beacon_overlap_40) t01
full outer join (
select * from dw_ai.dw_ai_phase_iii_beacon_location_202
where dt = get_date(-1)
) t03
on t01.beacon_id = t03.beacon_id
where t03.beacon_id is null and t01.beacon_id is not null

---- 找这些Beacon shop的订单情况
select t02.dt, t01.shop_id, count(*), max(t03.updated_at)
from
(select * from temp.temp_beacon_overlap_40_not_1st) t01
join 
(
	select restaurant_id, dt
	from dm.dm_tms_apollo_waybill_wide_detail 
	where dt > get_date(-3)
) t02
on t01.shop_id = t02.restaurant_id
join (
	select beaocnid as beacon_id, updated_at, shopid
	from dw.dw_tms_lpd_infra_beacon_beacon_info
	where dt = get_date(-1)
) t03
on t01.shop_id = t03.shopid
group by t02.dt, t01.shop_id

---- 查看有没有之前有数据，后来没数据的Beacon
select (
	case when t0127.beacon_id is not null then t0127.beacon_id 
	when t0128.beacon_id is not null then t0128.beacon_id 
	when t0129.beacon_id is not null then t0129.beacon_id 
	else t0130.beacon_id end) as beacon_id,
t0127.data_cnt as 0127_cnt, t0128.data_cnt as 0128_cnt, t0129.data_cnt as 0129_cnt, t0130.data_cnt as 0130_cnt from 
(select beacon_id, count(*) as data_cnt from dw_ai.dw_ai_clairvoyant_beacon where dt = '2018-01-27' group by beacon_id) t0127
full outer join
(select beacon_id, count(*) as data_cnt from dw_ai.dw_ai_clairvoyant_beacon where dt = '2018-01-28' group by beacon_id) t0128
on t0127.beacon_id = t0128.beacon_id
full outer join
(select beacon_id, count(*) as data_cnt from dw_ai.dw_ai_clairvoyant_beacon where dt = '2018-01-29' group by beacon_id) t0129
on t0128.beacon_id = t0129.beacon_id
full outer join 
(select beacon_id, count(*) as data_cnt from dw_ai.dw_ai_clairvoyant_beacon where dt = '2018-01-30' group by beacon_id) t0130
on t0129.beacon_id = t0130.beacon_id



select * from dw.dw_tms_lpd_infra_beacon_beacon_info 
where dt = get_date(-1) and beaocnid = 'RSIB011700064574E02'



select beacon_id from dw_ai.dw_ai_phase_iii_beacon_location_202 where dt =get_date(-1)



select beacon_id, dt, count(*) as data_cnt 
from dw_ai.dw_ai_clairvoyant_beacon 
where dt > get_date(-10) and beacon_id = 'RSIB011700063687BF3'
group by beacon_id, dt




---- 查看 state=40 的Beacon所在的商户，及其订单情况，
select t03.restaurant_id, t03.dt, t03.order_cnt from
(
	select * from temp.temp_beacon_state_phase_iii_1_day
	where beacon_state = 40
) t01
join (
	select * from dw_analyst.dw_analyst_beacon_state_day
	where dt = '2018-01-29'
	and beacon_state = 40
) t02
on t01.beacon_id = t02.beacon_id
join (
	select restaurant_id, dt, count(*) as order_cnt 
	from dm.dm_tms_apollo_waybill_wide_detail
	where dt = '2018-01-30'
	group by restaurant_id, dt
) t03
on t01.shop_id = t03.restaurant_id

---- 部署之后每天跟踪Beacon状态情况
select dt, beacon_state, count(*)
from dw_analyst.dw_analyst_beacon_state_day
where dt > get_date(-7)
group by dt, beacon_state
​order by dt, beacon_state

---- 部署之后每天跟踪Beacon状态情况
select dt, beacon_state, count(*)
from dw_analyst.dw_analyst_beacon_state_day
where dt > get_date(-10)
group by dt, beacon_state
​order by beacon_state, dt

---- 部署之后每天跟踪总体进度情况
select dt, count(*) as data_cnt, count(distinct beacon_id) as beacon_num_deployed, 
count(distinct rider_id) as rider_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-10)
group by dt
order by dt

---- 部署之后每天关注各个站团情况
select grid_id, count(distinct t01.shop_id) as beacon_num_deployed, 
max(t03.beacon_num_expected) as beacon_num_expected
from 
	dw_ai.dw_ai_clairvoyant_beacon t01,	
	dw_ai.dw_ai_beacon_shop_list t02,
	dw_ai.dw_ai_beacon_grid_day t03
where t01.dt = get_date(-1)  and t02.dt = get_date(-1) and t03.dt = get_date(-1)
and t01.shop_id = t02.shop_id and t02.grid_id = t03.grid_id
group by t02.grid_id


---- 部署之后关注原始表的 rssi 情况
select rssi, count(*) as data_cnt from dw_ai.dw_ai_clairvoyant_beacon
where dt = get_date(-1)
group by rssi
order by rssi

CREATE TABLE temp.temp_unstable_beacons (shop_id BIGINT);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (1011764);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (141854616);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (142457902);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (143932463);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (150031333);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (150156452);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (151708436);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (153399787);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (153399787);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (1541247);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (155136759);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (155291702);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (159474289);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (160933819);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (2037624);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (464815);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (539980);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (783444);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (934418);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (942394);



drop table if exists temp.temp_beacon_phase_iii_data_order_compare_5_days; 
create table temp.temp_beacon_phase_iii_data_order_compare_5_days as 
select (case when beacon_data.target_id is not null 
        then beacon_data.target_id else order_data.taker_id end) as taker_id, order_data.shop_id,
    beacon_data.hour as data_hour, beacon_data.data_cnt, order_data.hour as order_hour, 
    order_data.order_cnt, order_data.dt as order_dt, beacon_data.dt as data_dt
from (
	select rider_id as target_id, hour(detected_at) as hour, count(1) as data_cnt, max(dt) as dt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-5) and get_date(detected_at) > get_date(-5)
	group by rider_id,hour(detected_at)
) beacon_data
full outer join (
	select t01.taker_id, t01.ocurred_hour as hour, t01.restaurant_id as shop_id, 
	count(*) as order_cnt, max(t01.dt) as dt
	from (
		select carrier_driver_id as taker_id, platform_merchant_id as restaurant_id,
		hour(ocurred_time) as ocurred_hour, dt
		from dw.dw_tms_tb_tracking_event 
		where dt > get_date(-5) and get_date(ocurred_time) > get_date(-5)
		and shipping_state = 80
	) t01
	join (
		select rider_id as target_id, hour(detected_at) as hour, shop_id, max(dt) as max_dt
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt > get_date(-5) and get_date(detected_at) > get_date(-5)
		group by rider_id, shop_id, hour(detected_at) 
	) t03
	on t01.taker_id = t03.target_id and t01.restaurant_id = t03.shop_id 
	and t01.ocurred_hour = t03.hour and t01.dt = t03.max_dt
	group by t01.taker_id, t01.ocurred_hour, t01.restaurant_id
) order_data
on beacon_data.target_id = order_data.taker_id and beacon_data.hour = order_data.hour 
and beacon_data.dt = order_data.dt







select t01.shop_id from 
temp.temp_beacon_state_phase_iii t01,
temp.temp_beacon_state_phase_iii_1_day t02
where t01.shop_id = t02.shop_id 
and t01.state = 20 and t02.state = 40


select shop_id, dt, (count(*)) as 
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-10)


---- Check unstable beacon beacon data
drop table if exists temp.temp_beacon_unstable_beacon_data; 
create table temp.temp_beacon_unstable_beacon_data as
select t01.shop_id, t02.dt, t02.beacon_data_cnt
from (
	select *
	from temp.temp_unstable_beacons
) t01
join (
	select shop_id, dt, count(*) as beacon_data_cnt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-10)
	group by shop_id, dt
) t02
on t01.shop_id = t02.shop_id;

---- Check unstable beacon order data
drop table if exists temp.temp_beacon_unstable_order_data; 
create table temp.temp_beacon_unstable_order_data as
select t01.shop_id, t03.dt, t03.order_data_cnt
from (
	select *
	from temp.temp_unstable_beacons
) t01
join (
	select restaurant_id, dt, count(*) as order_data_cnt
	from dm.dm_tms_apollo_waybill_wide_detail
	where dt > get_date(-10)
	group by restaurant_id, dt
) t03
on t01.shop_id = t03.restaurant_id;


---- Join two tables to compare beacon data and order data
select (case when t02.shop_id is not null then t02.shop_id else t01.shop_id end) as shop_id,
	(case when t02.dt is not null then t02.dt else t01.dt end) as dt,
	 t01.beacon_data_cnt, t02.order_data_cnt from
(
	select * from temp.temp_beacon_unstable_beacon_data
) t01
full outer join
(
	select * from temp.temp_beacon_unstable_order_data
) t02
on t01.shop_id = t02.shop_id and t01.dt = t02.dt
order by shop_id, dt




---- 看每天Beacon数量
	select dt, count(distinct beacon_id) as deployed_beacon_num
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-15)
	group by dt



---- 查24个不稳定beacon的信号情况和订单情况
select * from
(
	select * from temp.temp_beacon_state_phase_iii
	where state = 
) t01
join (
	select * from dw_ai.dw_ai_clairvoyant_beacon
) t02
on  t01



---- 挑出失效 Beacon 所在商户名，让供应商去查
select t02.shop_id, t02.shop_name from 
(
	select * from temp.temp_beacon_state_phase_iii
	where state = 40
) t01
join (
	select * from dm.dm_prd_shop_wide
	where dt =get_date(-1)
) t02
on t01.shop_id = t02.shop_id
	



----- 以下用于解决骑手APP听不到Beacon的问题
select distinct (case when beacon_data.target_id is not null 
        then beacon_data.target_id else order_data.taker_id end) as taker_id, 
    beacon_data.hour as data_hour, beacon_data.data_cnt, order_data.hour as order_hour, 
    order_data.order_cnt, device_data.device_info, order_data.dt
from (
 select target_id,hour(created_at) as hour, count(1) as data_cnt, 
        max(device_info) as device_info, max(dt) as dt
 from dw.dw_tms_clairvoyant_tb_beacon 
 where dt=get_date(-1) and get_date(created_at)=get_date(-1)
 and parse_json_object(device_info, 'appVersion') = "3.2.3"
 group by target_id,hour(created_at)
) beacon_data
full outer join (
 select t01.taker_id, hour(t01.ocurred_time) as hour, count(1) as order_cnt, max(t03.dt) as dt
 from (
 select carrier_driver_id as taker_id, platform_merchant_id as restaurant_id,
 ocurred_time
 from dw.dw_tms_tb_tracking_event 
 where dt = get_date(-1) and get_date(ocurred_time) = get_date(-1)
 and shipping_state = 80
 ) t01
 join(
 select distinct building_id 
        from dw.dw_tms_clairvoyant_tb_beacon_location where dt=get_date(-1) 
 ) t02
 on t01.restaurant_id = t02.building_id 
 join (
 select target_id,hour(created_at) as hour, count(1) as data_cnt, max(dt) as dt
 from dw.dw_tms_clairvoyant_tb_beacon 
 where dt = get_date(-1) and get_date(created_at) = get_date(-1)
 group by target_id,hour(created_at) 
 ) t03
 on t01.taker_id = t03.target_id
 group by t01.taker_id, hour(t01.ocurred_time)
) order_data
on beacon_data.target_id = order_data.taker_id and beacon_data.hour = order_data.hour
join ( 
 select distinct target_id, device_info
 from dw.dw_tms_clairvoyant_tb_beacon 
 where dt=get_date(-1) and get_date(created_at) = get_date(-1)
 and parse_json_object(device_info, 'appVersion') = "3.2.3"
 ) device_data
on order_data.taker_id = device_data.target_id
where beacon_data.data_cnt is null and order_data.order_cnt is not null
order by taker_id, order_hour



select * 
from dw.dw_tms_tb_tracking_event t01,
dw.dw_tms_clairvoyant_tb_beacon_location t02
where t01.dt = get_date(-1) and get_date(t01.ocurred_time) = get_date(-1) 
and t02.dt = get_date(-1) 
and t01.platform_merchant_id = t02.building_id
and carrier_driver_id = 100068088


# 给定商户ID查beacon信号
select t01.target_id, t01.created_at, t01.beacon_info, t01.device_info
from
dw.dw_tms_clairvoyant_tb_beacon t01,
dw.dw_tms_clairvoyant_tb_beacon_location t02
where t02.major = parse_json_object(t01.beacon_info, 'beaconMajor')
and t02.minor = parse_json_object(t01.beacon_info, 'beaconMinor')
and t02.building_id = 918209
and t01.dt = get_date(-1) and get_date(t01.created_at) = get_date(-1)
and t02.dt = get_date(-1) 
and t01.created_at > '2017-12-18 17:00:00'
and t01.created_at < '2017-12-18 18:00:00'
and parse_json_object(t01.beacon_info, 'beaconRssi') <> 0

​



drop table if exists temp.temp_shop_beacon_num; 
create table temp.temp_shop_beacon_num as 
select distinct t1.tracking_id, t1.shop_id, t2.shop_id as building_id
from  dw_ai.dw_ai_beacon_tracking_event t1,        dw_ai.dw_ai_clairvoyant_beacon t2
where t1.rider_id=t2.rider_id   and t2.detected_at>t1.arrive_rst_at 
and t2.detected_at<t1.pickup_at 
and t2.rssi>=-85 
and t1.dt<=get_date(-1) and t2.dt<=get_date(-1) 
and t1.dt>=get_date(-30) and t2.dt>=get_date(-30) 
and t1.dt=t2.dt;  

 drop table if exists temp.temp_beacon_freq; 
create table temp.temp_beacon_freq as 
select building_id, shop_id, count(distinct tracking_id) as c_1  from temp.temp_shop_beacon_num  where shop_id in (select distinct t2.building_id from temp.temp_shop_beacon_num t2)
group by building_id, shop_id; 

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
 
 drop table if exists temp.temp_has_beacon;  create table temp.temp_has_beacon as 
select distinct shop_id 
from dw_ai.dw_ai_clairvoyant_beacon 
where dt<=get_date(-1) and dt>=get_date(-30);

drop table if exists temp.temp_has_beacon_has_order;  create table temp.temp_has_beacon_has_order as 
select distinct restaurant_id  
from dm.dm_tms_apollo_waybill_wide_detail 
where dt<=get_date(-1) 
and dt>=get_date(-30) 
and restaurant_id in (
      select shop_id from temp.temp_has_beacon); 

drop table if exists temp.temp_has_beacon_no_order;  create table temp.temp_has_beacon_no_order as 
select t1.shop_id 
from temp.temp_has_beacon t1 
where not exists (
      select * from temp.temp_has_beacon_has_order t2 
      where t1.shop_id=t2.restaurant_id); 
 

drop table if exists temp.temp_beacon_state_initial_phase_iii_1_day;
create table temp.temp_beacon_state_initial_phase_iii_1_day
as
select t01.shop_id,t01.beacon_id, t01.beacon_uuid,
(case when t01.shop_id = '' then 10 when t02.beacon_uuid is null then 40 else 20 end) as state
from (
	select distinct beacon_id, beacon_uuid, shopid as shop_id
	from temp.temp_beacon_manifest_jiyun 
       ) t01	 full outer join (
	select distinct beacon_id, uuid as beacon_uuid
	from dw_ai.dw_ai_clairvoyant_beacon
	       where dt > get_date(-1) and get_date(detected_at) > get_date(-1)
) t02
on t01.beacon_id = t02.beacon_id and t01.beacon_uuid = t02.beacon_uuid;


drop table if exists temp.temp_beacon_state_add_30_1_day;
create table temp.temp_beacon_state_add_30_1_day
as
select t01.shop_id,t01.beacon_id, t01.beacon_uuid,
(case when t02.shop_id is not null then 30 else t01.state end) as state
from 
temp.temp_beacon_state_initial_phase_iii t01
full outer join
temp.temp_beacon_shop_not_match t02
on t01.shop_id = t02.shop_id;

 drop table if exists temp.temp_beacon_state_phase_iii_1_day;
create table temp.temp_beacon_state_phase_iii_1_day
as
select t01.shop_id,t01.beacon_id, t01.beacon_uuid,
(case when t02.shop_id is not null then 60 else t01.state end) as state
from 
temp.temp_beacon_state_add_30 t01
full outer join
temp.temp_has_beacon_no_order t02
on t01.shop_id = t02.shop_id;

​