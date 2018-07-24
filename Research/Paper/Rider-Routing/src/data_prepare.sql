---- 用于Rider-Routing文章的SQL代码

---- 分析超时原因
select * from pub.dmd_tms_waybill_tracking_wide_day
where dt = get_date(-1) 
and (is_platform_timeout_compensate_order = '是' or is_tms_timeout_compensate_order = '是')


--------------------------------------------------------------------------------------------





---- 画骑手的轨迹图
---- 拿到到店位置
select carrier_driver_id as rider_id, platform_merchant_id as shop_id,
tracking_id, latitude, longitude, ocurred_time, shipping_state
from dw.dw_tms_tb_tracking_event
where dt = get_date(-1) and get_date(ocurred_time) = get_date(-1)
and carrier_driver_id = 10820633 and shipping_state = 80
order by carrier_driver_id, ocurred_time


---- 先建立骑手和商户的对应关系
---- 这段不用了，因为tracking_event 表里就有团队和网格
drop table if exists temp.temp_yiding_rider_shop_mapping;
create table temp.temp_yiding_rider_shop_mapping as
select t01.rider_id, t02.team_id, t03.grid_id, t04.shop_id
from (
	select distinct courier_id as rider_id
	from dm.dm_tms_courier_base
	where dt = '${day}' 
	and courier_name not like '%test%配送员%'
	and courier_carrier = 5
) t01
join (
	select staff_id as rider_id, department_id as team_id
	from dw.dw_tms_edutuandui_meepo_ehr_staff_department_mapping
	where dt = '${day}'  and position_id=2
) t02
on t01.rider_id = t02.rider_id
join (
	select grid_id, team_id
	from dw.dw_tms_hummerteam_grid_team_mapping
	where dt = '${day}' 
	and is_active = 1
) t03
on t02.team_id = t03.team_id
join(
	select shop_id, delivery_grid_id as grid_id
	from dm.dm_prd_shop_wide
	where dt = '${day}' 
) t04
on t03.grid_id = t04.grid_id;


--------------------------------------------------------------------------------------------
---- run_hive(dw_analyst.dw_analyst_yiding_tracking_event_with_tag) 任务
---- 区分去程单和回程单
---- 基本逻辑：来自于骑手对应的商户的单为去程单，来自其他商户的单为返程单
---- 给tracking_event表里的order打上是否普通单的标记
---- 先弄一份普通单的tracki_id
---- 按眭益彬的建议重新筛选回程单
drop table if exists temp.temp_yiding_tracking_order_normal;
create table temp.temp_yiding_tracking_order_normal as
select distinct t01.tracking_id
from (
	select * from dw.dw_tms_tb_tracking_event
	where dt = '${day}' and get_date(ocurred_time) = '${day}'
	and shipping_state = 10
) t01
join (
	select grid_id, team_id
	from dw.dw_tms_hummerteam_grid_team_mapping
	where dt = '${day}'
	and is_active = 1
) t02
on t01.station_id = t02.team_id
join (
	select * 
	from dw.dw_tms_tb_shipping_order_carrier
	where dt = '${day}'
) t03
on t01.tracking_id = t03.tracking_id and t02.grid_id = t03.grid_id;

---- 然后联tracking_event的表打上是否普通单的标记
---- drop table if exists temp.temp_yiding_tracking_order_with_tag;
---- create table temp.temp_yiding_tracking_order_with_tag as
---- carrier_id = 5 表示平台的运力线
INSERT overwrite TABLE dw_analyst.dw_analyst_yiding_tracking_event_with_tag PARTITION(dt='${day}')
select t01.id, t01.tracking_id, t01.platform_merchant_id, t01.shipping_state, ,t01.ocurred_time,
t01.latitude, t01.longitude, t01.carrier_driver_id, t01.station_id, t01.grid_id, t01.knight_id,
(case when t02.tracking_id is null then 0 else 1 end) as is_normal
from (
	select * from dw.dw_tms_tb_tracking_event
	where dt = '${day}' and get_date(ocurred_time) = '${day}'
	and carrier_driver_id is not null and carrier_driver_id <> ''	
	and carrier_driver_name not like '%test%配送员%'
	and carrier_id = 5
) t01
full outer join (
	select * from temp.temp_yiding_tracking_order_normal
) t02
on t01.tracking_id = t02.tracking_id;
---- run_hive(temp_yiding_rider_shop_mapping) 任务结束
--------------------------------------------------------------------------------------------

---- 下面是一些额外的操作
---- 拿到单多的骑手id
drop table if exists temp.temp_yiding_rider_with_more_order;
create table temp.temp_yiding_rider_with_more_order as
select * from (
select carrier_driver_id, count(*) as order_cnt
from dw_analyst.dw_analyst_yiding_tracking_event_with_tag
where dt = get_date(-1)
group by carrier_driver_id
) t01
where t01.order_cnt > 50 and t01.order_cnt < 200;

---- 圈定一个骑手名单
drop table if exists temp.temp_yiding_download_rider;
create table temp.temp_yiding_download_rider as
select * from temp.temp_yiding_rider_with_more_order
order by order_cnt desc
limit 20;

---- 把要下载的内容放到一张表里，tracking_event
drop table if exists temp.temp_yiding_download_tracking_event_with_tag;
create table temp.temp_yiding_download_tracking_event_with_tag as
select t01.*
from (
	select * 
	from dw_analyst.dw_analyst_yiding_tracking_event_with_tag
	where dt = get_date(-1)
) t01
join (
	select * from temp.temp_yiding_download_rider
) t02
on t01.carrier_driver_id = t02.carrier_driver_id;


---- 把要下载的内容放到一张表里，rider_trace
drop table if exists temp.temp_yiding_download_rider_trace;
create table temp.temp_yiding_download_rider_trace as
select t01.*
from (
	select * from dw.dw_log_talaris_taker_location_day_inc
	where dt = get_date(-1)  and get_date(record_time) = get_date(-1)
) t01
join (
	select * from temp.temp_yiding_download_rider
) t02
on t01.taker_id= t02.carrier_driver_id;

--------------------------------------------------------------------------------------------
---- 一些数据统计
select t01.dt, t01.total_cnt, t02.normal_cnt
from (
	select dt, count(distinct tracking_id) as total_cnt
	from dw_analyst.dw_analyst_yiding_tracking_event_with_tag
	where dt > get_date(-7) and shipping_state = 40
	group by dt
) t01
join (
	select dt, count(distinct tracking_id) as normal_cnt
	from dw_analyst.dw_analyst_yiding_tracking_event_with_tag
	where dt > get_date(-7) and shipping_state = 40 and is_normal = 1 
	group by dt
) t02
on t01.dt = t02.dt
order by dt

--------------------------------------------------------------------------------------------
---- 行程计算
INSERT overwrite TABLE dw_analyst.dw_analyst_yiding_tracking_trip_with_tag PARTITION(dt='${day}')
select t01.* 
from (
	select carrier_driver_id as rider_id, 
	(LAG (shipping_state, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as from_shipping_state,
	shipping_state as to_shipping_state,
	time_diff((LAG (ocurred_time, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)), ocurred_time) as time_seconds,
	get_point_distance((LAG (latitude, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)), 
		(LAG (longitude, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)), latitude, longitude) as distance_km,
	(LAG (platform_merchant_id, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as from_shop,
	platform_merchant_id as to_shop,
	(LAG (ocurred_time, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as from_time,
	ocurred_time as to_time,
	(LAG (latitude, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as from_latitude,
	(LAG (longitude, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as from_longitude,
	latitude as to_latitude, longitude as to_longitude,
	(LAG (tracking_id, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as from_tracking_id,
	tracking_id as to_tracking_id,
	(LAG (is_normal, 1) OVER (PARTITION by carrier_driver_id ORDER BY ocurred_time)) as from_is_normal,
	is_normal as to_isnormal
	from dw_analyst.dw_analyst_yiding_tracking_event_with_tag
	where dt = '${day}'
) t01
where t01.from_latitude is not null;



--------------------------------------------------------------------------------------------



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



