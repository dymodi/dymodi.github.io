---- Some SQLs to discover and solve problems for Ele.Me Beacons phase III
---- Yi Ding
---- 02/19/2018

---- 如果某些Beacon

---- 看miss的里面哪些是骑手手机的问题，在有单的那两个小时内一条Beacon数据都没有的
drop table if exists temp.temp_beacon_order_not_tracked_due_to_cellphone_black_out;
create table temp.temp_beacon_order_not_tracked_due_to_cellphone_black_out as
select t01.* 
from (
	select * from dw_ai.dw_ai_beacon_tracking_missed
	where dt > get_date(-7)
) t01
join (
	select * from dw_analyst.dw_analyst_beacon_data_order_data_compare_day
	where dt > get_date(-7) and data_cnt is null
) t02
on t01.rider_id = t02.taker_id and t01.dt = t02.dt 
and hour(t01.pickup_at) = t02.order_hour;

---- 看miss的里面哪些是骑手取餐过快的 （到店到取餐不到10s）
drop table if exists temp.temp_beacon_order_not_tracked_due_to_quick_pick;
create table temp.temp_beacon_order_not_tracked_due_to_quick_pick as
select * from dw_ai.dw_ai_beacon_tracking_missed
where dt > get_date(-7) 
and (unix_timestamp(pickup_at) - unix_timestamp(taker_arrive_rst_at)) < 10;

---- 看miss的里面有哪些是部署不当的
drop table if exists temp.temp_beacon_order_not_tracked_due_to_deployment; 
create table temp.temp_beacon_order_not_tracked_due_to_deployment as
select t01.* 
from (
	select * from dw_ai.dw_ai_beacon_tracking_missed
	where dt > get_date(-7)
) t01
join (
	select * from dw_analyst.dw_analyst_beacon_state_day
	where dt > get_date(-7) and beacon_state = 50
) t02
on t01.shop_id = t02.shop_id;


---- 在一张表里汇总该听到和实际听到的内容
drop table if exists temp.temp_beacon_tracking_summary;
create table temp.temp_beacon_tracking_summary as
select t01.dt, t01.num_should_heard, t02.num_actual_heard, 
float(t02.num_actual_heard/t01.num_should_heard) as rate,
(t01.num_should_heard-t02.num_actual_heard) as num_not_heard,
t03.num_not_heard_due_to_deploy,
t04.num_not_heard_due_to_quick_pick,
t05.num_not_heard_due_to_cellphone_blackout
from (
	select dt, count(distinct tracking_id) as num_should_heard
	from dw_ai.dw_ai_beacon_tracking_day where dt > get_date(-7)
	group by dt
) t01
join (
	select dt, count(distinct tracking_id) as num_actual_heard
	from dw_ai.dw_ai_beacon_tracking_heard where dt > get_date(-7)
	group by dt
) t02
on t01.dt = t02.dt
join (
	select dt, count(distinct tracking_id) as num_not_heard_due_to_deploy
	from temp.temp_beacon_order_not_tracked_due_to_deployment
	group by dt
) t03
on t02.dt = t03.dt
join (
	select dt, count(distinct tracking_id) as num_not_heard_due_to_quick_pick
	from temp.temp_beacon_order_not_tracked_due_to_quick_pick
	group by dt
) t04
on t03.dt = t04.dt
join (
	select dt, count(distinct tracking_id) as num_not_heard_due_to_cellphone_blackout
	from temp.temp_beacon_order_not_tracked_due_to_cellphone_black_out
	group by dt
) t05
on t04.dt = t05.dt;



---- 听到多个Beacon的骑手及其设备信息	
select dw_ai.dw_ai_clairvoyant_beacon 



---- 看有没有多个骑手都把某两个店标为异常，按骑手个数来区分
drop table if exists temp.temp_beacon_POI_by_rider_cnt;
create table temp.temp_beacon_POI_by_rider_cnt as
select shop_id_1, shop_id_2, max(distance) as distance, count(distinct rider_id) as rider_cnt
from dw_analyst.dw_analyst_beacon_exception_shop_day
where dt > '2018-01-20' and dt < '2018-03-05'
group by shop_id_1, shop_id_2;

---- 打上店名进行分析
select t01.distance, t01.rider_cnt, t01.shop_id_1, t02.shop_name as shop_name_1, 
t02.shop_latitude as shop_latitude_1, t02.shop_longitude as shop_longitude_1,
t01.shop_id_2, t03.shop_name as shop_name_2, 
t03.shop_latitude as shop_latitude_2, t03.shop_longitude as shop_longitude_2
from (
select *
from temp.temp_beacon_POI_by_rider_cnt
) t01
join (
select shop_id, shop_name, shop_latitude, shop_longitude
from dm.dm_prd_shop_wide
where dt = get_date(-1)
) t02
on t01.shop_id_1 = t02.shop_id
join (
select shop_id, shop_name, shop_latitude, shop_longitude
from dm.dm_prd_shop_wide
where dt = get_date(-1)
) t03
on t01.shop_id_2 = t03.shop_id
order by t01.rider_cnt desc




---- 按骑手按秒汇总，打上data_cnt
drop table if exists temp.temp_num_distinct_beacon_heared_at_same_time_30days;
create table temp.temp_num_distinct_beacon_heared_at_same_time_30days as
select rider_id, detected_at, count(distinct beacon_id) as beacon_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-30) and get_date(detected_at) > get_date(-30)
and parse_json_object(device_info, 'platform') = 2
group by rider_id, detected_at;

---- 按骑手汇总，打上max_data_cnt
drop table if exists temp.temp_max_num_distinct_beacon_heared_at_same_time_30days;
create table temp.temp_max_num_distinct_beacon_heared_at_same_time_30days as
select rider_id, max(beacon_cnt) as max_beacon_cnt
from temp.temp_num_distinct_beacon_heared_at_same_time_30days
group by rider_id;


---- 看max_data_cnt的分布
select max_beacon_cnt, count(*) as data_cnt
from temp.temp_max_num_distinct_beacon_heared_at_same_time_30days
group by max_beacon_cnt
order by max_beacon_cnt


---- 找到一份骑手的白名单，那些过去一个月只听到1个Beacon的骑手，用他们和POI的表取交集，
drop table if exists temp.temp_beacon_white_rider_list;
create table temp.temp_beacon_white_rider_list as
select rider_id
from temp.temp_max_num_distinct_beacon_heared_at_same_time_30days
where max_beacon_cnt = 1;

---- 和某天的POI数据取交集
drop table if exists temp.temp_beacon_white_POI_day;
create table temp.temp_beacon_white_POI_day as
select t01.* 
from (
	select * from dw_analyst.dw_analyst_beacon_exception_shop_day
	where dt > '2018-01-31' and dt < '2018-02-10'
) t01
join (
	select * from temp.temp_beacon_white_rider_list
) t02
on t01.rider_id = t02.rider_id;

---- 和某天的POI数据取交集
drop table if exists temp.temp_all_beacon_white_POI_day;
create table temp.temp_all_beacon_white_POI_day as
select t01.* 
from (
	select * from dw_ai.dw_ai_clairvoyant_beacon
	where dt > '2018-01-31' and dt < '2018-02-10'
) t01
join (
	select * from temp.temp_beacon_white_rider_list
) t02
on t01.rider_id = t02.rider_id;


---- 从白数据中取数据进行分析
select * from temp.temp_beacon_white_POI_day
order by distance desc

---- 打上店名进行分析
select t01.distance, t01.rider_id, t01.shop_id_1, t02.shop_name as shop_name_1, 
t02.shop_latitude as shop_latitude_1, t02.shop_longitude as shop_longitude_1,
t01.shop_id_2, t03.shop_name as shop_name_2, 
t03.shop_latitude as shop_latitude_2, t03.shop_longitude as shop_longitude_2
from (
select *
from temp.temp_beacon_white_POI_day
) t01
join (
select shop_id, shop_name, shop_latitude, shop_longitude
from dm.dm_prd_shop_wide
where dt = get_date(-1)
) t02
on t01.shop_id_1 = t02.shop_id
join (
select shop_id, shop_name, shop_latitude, shop_longitude
from dm.dm_prd_shop_wide
where dt = get_date(-1)
) t03
on t01.shop_id_2 = t03.shop_id
order by t01.distance desc




---- 只取Android骑手的数据，跑一遍POI的算法，找一些商户，看看实际位置是否一致
from dw_ai.dw_ai_clairvoyant_beacon


drop table if exists temp.temp_beacon_at_the_same_time_detail_phase_iii;
create table temp.temp_beacon_at_the_same_time_detail_phase_iii as
	select t01.rider_id, 
	get_point_distance(t01.latitude, t01.longitude, t02.latitude, t02.longitude) as distance,
	t01.beacon_id as beacon_1,t01.detected_at as time_1, t01.rssi as rssi_1, t01.shop_id as shop_id_1, t01.latitude as latitude_1, t01.longitude as longitude_1,
	t02.beacon_id as beacon_2, t02.detected_at as time_2, t02.rssi as rssi_2, t02.shop_id as shop_id_2, t02.latitude as latitude_2, t02.longitude as longitude_2,
	t01.dt as dt
	from (
		select t012.*, t011.data_cnt
		from (
		select rider_id, detected_at, count(*) as data_cnt
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
		and parse_json_object(device_info, 'platform') = 2
		group by rider_id, detected_at
		) t011
	join (
		select *
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
		and parse_json_object(device_info, 'platform') = 2
		) t012
	on t011.rider_id = t012.rider_id and t011.detected_at = t012.detected_at
	where t012.rssi > -80 and t011.data_cnt < 10
	) t01
	join (
		select t014.*, t013.data_cnt
		from (
		select rider_id, detected_at, count(*) as data_cnt
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
		and parse_json_object(device_info, 'platform') = 2
		group by rider_id, detected_at
		) t013
	join (
		select *
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
		and parse_json_object(device_info, 'platform') = 2
		) t014
	on t013.rider_id = t014.rider_id and t013.detected_at = t014.detected_at
	where t014.rssi > -80 and t013.data_cnt < 10
	) t02
	on t01.rider_id = t02.rider_id and t01.dt = t02.dt
	where unix_timestamp(t01.detected_at) - unix_timestamp(t02.detected_at) > -2
	and t01.shop_id < t02.shop_id
	and unix_timestamp(t01.detected_at) < unix_timestamp(t02.detected_at);










---- 拉最近两天同时听到Beacon较多的骑手
select rider_id, detected_at, max(parse_json_object(device_info, 'phoneMode')) as phoneMode, count(*) as data_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
group by rider_id, detected_at
order by data_cnt desc


---- 查有没有大范围的骑手同时听到多个Beacon的情况
drop table if exists temp.temp_beacon_num_beacon_heared_at_same_second_android;
create table temp.temp_beacon_num_beacon_heared_at_same_second_android as
select t01.dt, t01.rider_id, t01.detected_at, t01.data_cnt
from (
select dt, rider_id, detected_at, count(*) as data_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-3)
group by dt, rider_id, detected_at
) t01
join (
select *
from dw.dw_tms_knight_general_tb_knight_device_day
where dt > get_date(-3) and device_type = 2
) t02
on t01.dt = t02.dt and t01.rider_id = t02.knight_id;


---- 看看过去几天超过10，30，50的分布
select t01.dt, t01.num_greater_10, t02.num_greater_30, t03.num_greater_50
from (
select dt, count(*) as num_greater_10
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 10
group by dt
) t01
join (
select dt, count(*) as num_greater_30
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 30
group by dt
) t02
on t01.dt = t02.dt
join (
select dt, count(*) as num_greater_50
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 50
group by dt
) t03
on t02.dt = t03.dt
order by dt

---- 看看过去几天超过10，30，50的分布
---- distinct 骑手
select t01.dt, t01.num_greater_10, t02.num_greater_30, t03.num_greater_50
from (
select dt, count(distinct rider_id) as num_greater_10
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 10
group by dt
) t01
join (
select dt, count(distinct rider_id) as num_greater_30
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 30
group by dt
) t02
on t01.dt = t02.dt
join (
select dt, count(distinct rider_id) as num_greater_50
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 50
group by dt
) t03
on t02.dt = t03.dt
order by dt