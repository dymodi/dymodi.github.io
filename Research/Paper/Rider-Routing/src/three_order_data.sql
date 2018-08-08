---------------------------------------------------------------------------------------------------------------
---- 生成连续三单的状态 Titan 任务开始
---- 基于自制表
drop table if exists temp.temp_yiding_three_order_state_raw;
create table temp.temp_yiding_three_order_state_raw as
select t01.* 
	from (
	select carrier_driver_id as rider_id,
	shipping_state as state_1, ocurred_time as ocurred_time_1, tracking_id as tracking_id_1,
	(LEAD (shipping_state, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_2,
	(LEAD (ocurred_time, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_2,
	(LEAD (tracking_id, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_2,
	(LEAD (shipping_state, 2) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_3,
	(LEAD (ocurred_time, 2) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_3,
	(LEAD (tracking_id, 2) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_3,
	(LEAD (shipping_state, 3) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_4,
	(LEAD (ocurred_time, 3) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_4,
	(LEAD (tracking_id, 3) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_4,
	(LEAD (shipping_state, 4) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_5,
	(LEAD (ocurred_time, 4) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_5,
	(LEAD (tracking_id, 4) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_5,
	(LEAD (shipping_state, 5) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_6,
	(LEAD (ocurred_time, 5) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_6,
	(LEAD (tracking_id, 5) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_6,
	(LEAD (shipping_state, 6) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_7,
	(LEAD (ocurred_time, 6) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_7,
	(LEAD (tracking_id, 6) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_7,
	(LEAD (shipping_state, 7) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_8,
	(LEAD (ocurred_time, 7) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_8,
	(LEAD (tracking_id, 7) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_8,
	(LEAD (shipping_state, 8) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_9,
	(LEAD (ocurred_time, 8) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_9,
	(LEAD (tracking_id, 8) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_9,
	(LEAD (shipping_state, 9) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_10,
	(LEAD (ocurred_time, 9) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_10,
	(LEAD (tracking_id, 9) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_10,
	(LEAD (shipping_state, 10) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_11,
	(LEAD (ocurred_time, 10) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_11,
	(LEAD (tracking_id, 10) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_11,
	(LEAD (shipping_state, 11) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as state_12,
	(LEAD (ocurred_time, 11) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as ocurred_time_12,
	(LEAD (tracking_id, 11) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as tracking_id_12
	from dw_analyst.dw_analyst_yiding_tracking_event_with_tag
	where dt = '${day}' and get_date(ocurred_time) = '${day}'
) t01
where t01.state_2 is not null;


---- 按一定规则进行筛选
drop table if exists temp.temp_yiding_three_order_state_raw_with_rn;
create table temp.temp_yiding_three_order_state_raw_with_rn as
select * ,
row_number() over (order by ocurred_time_1) as rn
from temp.temp_yiding_three_order_state_raw
where state_1 = 20 and state_2 = 20 and state_3 = 20 ---- 先接单，再行动
and state_12 = 40;

---- column to row
drop table if exists temp.temp_yiding_three_order_state_agged;
create table temp.temp_yiding_three_order_state_agged as
select rider_id, rn, tracking_id_1 tracking_id, state_1 shipping_state, ocurred_time_1 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_2 tracking_id, state_2 shipping_state, ocurred_time_2 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_3 tracking_id, state_3 shipping_state, ocurred_time_3 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_4 tracking_id, state_4 shipping_state, ocurred_time_4 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_5 tracking_id, state_5 shipping_state, ocurred_time_5 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_6 tracking_id, state_6 shipping_state, ocurred_time_6 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_7 tracking_id, state_7 shipping_state, ocurred_time_7 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_8 tracking_id, state_8 shipping_state, ocurred_time_8 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_9 tracking_id, state_9 shipping_state, ocurred_time_9 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_10 tracking_id, state_10 shipping_state, ocurred_time_10 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_11 tracking_id, state_11 shipping_state, ocurred_time_11 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn
union all
select rider_id, rn, tracking_id_12 tracking_id, state_12 shipping_state, ocurred_time_12 ocurred_time
from temp.temp_yiding_three_order_state_raw_with_rn;

---- 筛选
---- 统计单数，到点数等情况
drop table if exists temp.temp_yiding_three_order_state_agged_stat;
create table temp.temp_yiding_three_order_state_agged_stat as
select max(rider_id) as rider_id, rn, 
count(distinct tracking_id) as distinct_order_cnt, 
count(if(shipping_state = 20, 1, NULL)) as cnt_20,
count(if(shipping_state = 80, 1, NULL)) as cnt_80,
count(if(shipping_state = 30, 1, NULL)) as cnt_30,
count(if(shipping_state = 40, 1, NULL)) as cnt_40
from temp.temp_yiding_three_order_state_agged
group by rn;

---- 筛选
drop table if exists temp.temp_yiding_three_order_state_initial_filtered_id;
create table temp.temp_yiding_three_order_state_initial_filtered_id as
select rider_id, rn from temp.temp_yiding_three_order_state_agged_stat 
where distinct_order_cnt = 3 and cnt_20 = 3 and cnt_80 = 3 and cnt_30 = 3 and cnt_40 = 3;


---- 联表取数据 行数据
drop table if exists temp.temp_yiding_three_order_filtered;
create table temp.temp_yiding_three_order_filtered as
select t01.* 
from (
	select * from temp.temp_yiding_three_order_state_raw_with_rn
) t01
join (
	select * from temp.temp_yiding_three_order_state_initial_filtered_id
) t02
on t01.rider_id = t02.rider_id and t01.rn = t02.rn;

---- 联表取数据 列数据
drop table if exists temp.temp_yiding_three_order_agg_filtered;
create table temp.temp_yiding_three_order_agg_filtered as
select t01.* 
from (
	select * from temp.temp_yiding_three_order_state_agged
) t01
join (
	select * from temp.temp_yiding_three_order_state_initial_filtered_id
) t02
on t01.rider_id = t02.rider_id and t01.rn = t02.rn;

---- 按列输出的最终表
drop table if exists temp.temp_yiding_three_order_agg_final;
create table temp.temp_yiding_three_order_agg_final as
select t01.*, t02.latitude, t02.longitude,  t03.shop_latitude, t03.shop_longitude,
t02.platform_merchant_id as shop_id, t02.grid_id
from (
	select *
	from temp.temp_yiding_three_order_agg_filtered
) t01
join (
	select * 
	from dw_analyst.dw_analyst_yiding_tracking_event_with_tag
	where dt = '${day}' and get_date(ocurred_time) = '${day}'
) t02
on t01.rider_id = t02.carrier_driver_id and t01.tracking_id = t02.tracking_id
and t01.shipping_state = t02.shipping_state
join (
	select tracking_id, shop_latitude, shop_longitude
	from pub.dmd_tms_waybill_tracking_wide_day 
	where dt = '${day}'
) t03
on t01.tracking_id = t03.tracking_id;

---- 联表，加出餐时间，接单时间
drop table if exists temp.temp_yiding_three_order_filtered_with_cooking_time;
create table temp.temp_yiding_three_order_filtered_with_cooking_time as
select t01.*, t02.confirm_at as confirm_at_1, t02.predict_cooking_time as predict_cooking_time_1,
t03.confirm_at as confirm_at_2, t03.predict_cooking_time as predict_cooking_time_2,
t04.confirm_at as confirm_at_3, t04.predict_cooking_time as predict_cooking_time_3
from (
	select * from temp.temp_yiding_three_order_filtered
) t01
join (
	select confirm_at, predict_cooking_time, tracking_id 
	from dm.dm_tms_apollo_waybill_wide_detail
	where dt = '${day}'
) t02
on t01.tracking_id_1 = t02.tracking_id
join (
	select confirm_at, predict_cooking_time, tracking_id 
	from dm.dm_tms_apollo_waybill_wide_detail
	where dt = '${day}'
) t03
on t01.tracking_id_2 = t03.tracking_id
join (
	select confirm_at, predict_cooking_time, tracking_id 
	from dm.dm_tms_apollo_waybill_wide_detail
	where dt = '${day}'
) t04
on t01.tracking_id_3 = t04.tracking_id;

---------------------------------------------------------------------------------------------------------------
