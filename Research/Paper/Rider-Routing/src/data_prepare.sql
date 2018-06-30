---- 用于Rider-Routing文章的SQL代码

---- 分析超时原因
select * from pub.dmd_tms_waybill_tracking_wide_day
where dt = get_date(-1) 
and (is_platform_timeout_compensate_order = '是' or is_tms_timeout_compensate_order = '是')

---- 按Batch排列骑手的数据
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
	where dt = get_date(-1) and get_date(ocurred_time) > get_date(-3)
	and shipping_state = 20
) t01
join (
	select * 
	from dw.dw_tms_tb_tracking_event
	where dt = get_date(-1) and get_date(ocurred_time) > get_date(-3)
	and shipping_state = 80
) t02
on t01.tracking_id = t02.tracking_id and t01.carrier_id = t02.carrier_id
and t01.carrier_driver_id = t02.carrier_driver_id
join (
	select * 
	from dw.dw_tms_tb_tracking_event
	where dt = get_date(-1) and get_date(ocurred_time) > get_date(-3)
	and shipping_state = 30
) t03
on t02.tracking_id = t03.tracking_id and t02.carrier_id = t03.carrier_id
and t02.carrier_driver_id = t03.carrier_driver_id
join (
	select * 
	from dw.dw_tms_tb_tracking_event
	where dt = get_date(-1) and get_date(ocurred_time) > get_date(-3)
	and shipping_state = 40
) t04
on t03.tracking_id = t04.tracking_id and t03.carrier_id = t04.carrier_id
and t03.carrier_driver_id = t04.carrier_driver_id;


# 通过联表， 把所有同一骑手一天内三单的组合都拿出来，然后再筛
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

# 把中间参杂了四单五单的情况刨除
select accept_at_1 as batch_start_at,
(case when deliver_at_1 > deliver_at_2 and deliver_at_1 > deliver_at_3 then deliver_at_1 
	when deliver_at_2 > deliver_at_3 and deliver_at_2 > deliver_at_1 then deliver_at_2
	else deliver_at_3 end ) as batch_end_at, *
from temp.temp_yiding_three_order_batch_raw
where tracking_id_1 is not null and tracking_id_3 is not null
and get_date(accept_at_1) = get_date(accept_at_2) and get_date(accept_at_2) = get_date(accept_at_3)
and pickup_at_1 < deliver_at_2 and pickup_at_1 < deliver_at_3
and pickup_at_2 < deliver_at_3 and pickup_at_2 < deliver_at_1
and pickup_at_3 < deliver_at_1 and pickup_at_3 < deliver_at_2




