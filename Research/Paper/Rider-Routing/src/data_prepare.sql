---- 用于Rider-Routing文章的SQL代码

---- 分析超时原因
select * from pub.dmd_tms_waybill_tracking_wide_day
where dt = get_date(-1) 
and (is_platform_timeout_compensate_order = '是' or is_tms_timeout_compensate_order = '是')



---- 画骑手的轨迹图
---- 拿到到店位置
select carrier_driver_id as rider_id, platform_merchant_id as shop_id,
tracking_id, latitude, longitude, ocurred_time, shipping_state
from dw.dw_tms_tb_tracking_event
where dt = get_date(-1) and get_date(ocurred_time) = get_date(-1)
and carrier_driver_id = 10820633 and shipping_state = 80
order by carrier_driver_id, ocurred_time



---------------------------------------------------------------------------------------------------------------
---- 生成连续三单的状态 Titan 任务开始
---- 基于自制表
drop table if exists temp.temp_yiding_three_order_state_raw_test072718;
create table temp.temp_yiding_three_order_state_raw_test072718 as
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
	where dt = get_date(-1) and get_date(ocurred_time) = get_date(-1)
) t01
where t01.state_2 is not null;


---- 按一定规则进行筛选
drop table if exists temp.temp_yiding_three_order_state_raw_with_rn;
create table temp.temp_yiding_three_order_state_raw_with_rn as
select * ,
row_number() over (order by ocurred_time_1) as rn
from temp.temp_yiding_three_order_state_raw_test072718
where state_1 = 20 and state_2 = 20 and state_3 = 20 ---- 先接单，再行动
and state_12 = 40	---- 

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
drop table temp.temp_yiding_three_order_agg_filtered;
create table temp.temp_yiding_three_order_agg_filtered as
select t01.* 
from (
	select * from temp.temp_yiding_three_order_state_agged
) t01
join (
	select * from temp.temp_yiding_three_order_state_initial_filtered_id
) t02
on t01.rider_id = t02.rider_id and t01.rn = t02.rn;



---------------------------------------------------------------------------------------------------------------

---- 还是要从tracking_event表来筛
drop table if exists temp.temp_yiding_tracking_event;
create table temp.temp_yiding_tracking_event as
select tracking_id, carrier_driver_id as rider_id, shipping_state, 
ocurred_time
from dw.dw_tms_tb_tracking_event
where dt = get_date(-1) and get_date(ocurred_time) = get_date(-1) and
(shipping_state = 20 or shipping_state = 80 or shipping_state = 30 or shipping_state = 40)
order by rider_id, ocurred_time


---- 每单数据拉成一行
drop table if exists temp.temp_yiding_order_data_event;
create table temp.temp_yiding_order_data_event as
select t01.tracking_id,  t01.carrier_driver_id as rider_id,
t01.ocurred_time as accept_at,
t02.ocurred_time as arrive_rst_at,
t03.ocurred_time as pickup_at,
t04.ocurred_time as deliver_at
from (
	select * 
	from dw.dw_tms_tb_tracking_event
	where dt = get_date(-1) and get_date(ocurred_time) > get_date(-2)
	and shipping_state = 20
) t01
join (
	select * 
	from dw.dw_tms_tb_tracking_event
	where dt = get_date(-1) and get_date(ocurred_time) > get_date(-2)
	and shipping_state = 80
) t02
on t01.tracking_id = t02.tracking_id and t01.carrier_id = t02.carrier_id
and t01.carrier_driver_id = t02.carrier_driver_id
join (
	select * 
	from dw.dw_tms_tb_tracking_event
	where dt = get_date(-1) and get_date(ocurred_time) > get_date(-2)
	and shipping_state = 30
) t03
on t02.tracking_id = t03.tracking_id and t02.carrier_id = t03.carrier_id
and t02.carrier_driver_id = t03.carrier_driver_id
join (
	select * 
	from dw.dw_tms_tb_tracking_event
	where dt = get_date(-1) and get_date(ocurred_time) > get_date(-2)
	and shipping_state = 40
) t04
on t03.tracking_id = t04.tracking_id and t03.carrier_id = t04.carrier_id
and t03.carrier_driver_id = t04.carrier_driver_id;

---------------------------------------------------------------------------------------------------------------
---- 三单情况
---- 通过联表， 把所有同一骑手一天内三单的组合都拿出来，然后再筛
drop table if exists temp.temp_yiding_three_order_batch_raw;
create table temp.temp_yiding_three_order_batch_raw as
select rider_id,
(LAG (tracking_id, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as tracking_id_1,
(LAG (accept_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as accept_at_1,
(LAG (arrive_rst_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as arrive_rst_at_1,
(LAG (pickup_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as pickup_at_1,
(LAG (deliver_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as deliver_at_1,
tracking_id as tracking_id_2,
accept_at as accept_at_2,
arrive_rst_at as arrive_rst_at_2,
pickup_at as pickup_at_2,
deliver_at as deliver_at_2,
(LEAD (tracking_id, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as tracking_id_3,
(LEAD (accept_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as accept_at_3,
(LEAD (arrive_rst_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as arrive_rst_at_3,
(LEAD (pickup_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as pickup_at_3,
(LEAD (deliver_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as deliver_at_3
from temp.temp_yiding_order_data_event;

---- 需要筛的条件：
---- 1 

---- 把中间参杂了四单五单的情况刨除
---- 保证三单的取和送分开，同时去掉空值
drop table if exists temp.temp_yiding_three_order_remove_null;
create table temp.temp_yiding_three_order_remove_null as
select accept_at_1 as batch_start_at,
(case when deliver_at_1 > deliver_at_2 and deliver_at_1 > deliver_at_3 then deliver_at_1 
	when deliver_at_2 > deliver_at_3 and deliver_at_2 > deliver_at_1 then deliver_at_2
	else deliver_at_3 end ) as batch_end_at, *
from temp.temp_yiding_three_order_batch_raw
where tracking_id_1 is not null and tracking_id_3 is not null
and get_date(accept_at_1) = get_date(accept_at_2) and get_date(accept_at_2) = get_date(accept_at_3)
and pickup_at_1 < deliver_at_2 and pickup_at_1 < deliver_at_3
and pickup_at_2 < deliver_at_3 and pickup_at_2 < deliver_at_1
and pickup_at_3 < deliver_at_1 and pickup_at_3 < deliver_at_2;

---- 嵌入前后单的batch开始和结束的时间，用于下一步卡
drop table if exists temp.temp_yiding_three_order_add_last_batch;
create table temp.temp_yiding_three_order_add_last_batch as
select (LAG (batch_start_at, 1) OVER (PARTITION by rider_id ORDER BY batch_start_at, accept_at_1)) as last_batch_start,
(LAG (batch_end_at, 1) OVER (PARTITION by rider_id ORDER BY batch_start_at, accept_at_1)) as last_batch_end,
(LEAD (batch_start_at, 1) OVER (PARTITION by rider_id ORDER BY batch_start_at, accept_at_1)) as next_batch_start,
(LEAD (batch_end_at, 1) OVER (PARTITION by rider_id ORDER BY batch_start_at, accept_at_1)) as next_batch_end,
*
from temp.temp_yiding_three_order_remove_null;

---- 卡Batch开始和结束的时间，去掉四五单的情况
select * from temp.temp_yiding_three_order_add_last_batch
where last_batch_start is not null and next_batch_start is not null
and batch_start_at > last_batch_end
and batch_end_at < next_batch_start

---- 卡Batch内部到店和送达的顺序，把取送分开


---------------------------------------------------------------------------------------------------------------
---- 四单情况
---- 通过联表， 把所有同一骑手一天内三单的组合都拿出来，然后再筛
drop table if exists temp.temp_yiding_four_order_batch_raw;
create table temp.temp_yiding_four_order_batch_raw as
select rider_id,
(LAG (tracking_id, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as tracking_id_1,
(LAG (accept_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as accept_at_1,
(LAG (arrive_rst_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as arrive_rst_at_1,
(LAG (pickup_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as pickup_at_1,
(LAG (deliver_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as deliver_at_1,
tracking_id as tracking_id_2,
accept_at as accept_at_2,
arrive_rst_at as arrive_rst_at_2,
pickup_at as pickup_at_2,
deliver_at as deliver_at_2,
(LEAD (tracking_id, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as tracking_id_3,
(LEAD (accept_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as accept_at_3,
(LEAD (arrive_rst_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as arrive_rst_at_3,
(LEAD (pickup_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as pickup_at_3,
(LEAD (deliver_at, 1) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as deliver_at_3,
(LEAD (tracking_id, 2) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as tracking_id_4,
(LEAD (accept_at, 2) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as accept_at_4,
(LEAD (arrive_rst_at, 2) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as arrive_rst_at_4,
(LEAD (pickup_at, 2) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as pickup_at_4,
(LEAD (deliver_at, 2) OVER (PARTITION by rider_id ORDER BY accept_at, arrive_rst_at)) as deliver_at_4
from temp.temp_yiding_order_data_event;



