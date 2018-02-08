---- 基于到店离店时间的骑手行为分析
---- 02/04/18，为第三期Beacon效果汇报准备
---- Yi DING


---- 画PMF
select int((unix_timestamp(arrive_rst_at) - unix_timestamp(arrive_rst_at_beacon))/60) as early_minute, 
count(*) as order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-20)
group by int((unix_timestamp(arrive_rst_at) - unix_timestamp(arrive_rst_at_beacon))/60)
order by early_minute



---- 建立汇总表


INSERT overwrite TABLE dw_analyst.dw_analyst_beacon_abnormal_rider_behavior_summary partition(dt='${day}')
select t01.total_order_cnt, 
t02.early_arrival_10_min_order_cnt, float(t02.early_arrival_10_min_order_cnt/t01.total_order_cnt) as early_arrival_10_min_rate,
t03.early_arrival_30_min_order_cnt, float(t03.early_arrival_30_min_order_cnt/t01.total_order_cnt) as early_arrival_30_min_rate,
t04.late_arrival_10_min_order_cnt, float(t04.late_arrival_10_min_order_cnt/t01.total_order_cnt) as late_arrival_10_min_rate,
t05.late_arrival_30_min_order_cnt, float(t05.late_arrival_30_min_order_cnt/t01.total_order_cnt) as late_arrival_30_min_rate,
t06.late_pickup_10_min_order_cnt, float(t06.late_pickup_10_min_order_cnt/t01.total_order_cnt) as late_pickup_10_min_rate,
t07.late_pickup_30_min_order_cnt, float(t07.late_pickup_30_min_order_cnt/t01.total_order_cnt) as late_pickup_30_min_rate
from (
select max(dt) as dt, count(*) as total_order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt = '${day}'
) t01
join(
select max(dt) as dt, count(*) as early_arrival_10_min_order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt = '${day}'
and unix_timestamp(arrive_rst_at_beacon) - unix_timestamp(arrive_rst_at) > 600
) t02
on t01.dt = t02.dt
join (
select max(dt) as dt, count(*) as early_arrival_30_min_order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt = '${day}'
and unix_timestamp(arrive_rst_at_beacon) - unix_timestamp(arrive_rst_at) > 1800
) t03
on t02.dt = t03.dt
join (
select max(dt) as dt, count(*) as late_arrival_10_min_order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt = '${day}'
and unix_timestamp(arrive_rst_at) - unix_timestamp(leave_rst_at_beacon) > 600
) t04
on t03.dt = t04.dt
join (
select max(dt) as dt, count(*) as late_arrival_30_min_order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt = '${day}'
and unix_timestamp(arrive_rst_at) - unix_timestamp(leave_rst_at_beacon) > 1800
) t05
on t04.dt = t05.dt
join (
select max(dt) as dt, count(*) as late_pickup_10_min_order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt = '${day}'
and unix_timestamp(pickup_at) - unix_timestamp(leave_rst_at_beacon) > 600
) t06
on t05.dt = t06.dt
join (
select max(dt) as dt, count(*) as late_pickup_30_min_order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt = '${day}'
and unix_timestamp(pickup_at) - unix_timestamp(leave_rst_at_beacon) > 1800
) t07
on t06.dt = t07.dt


---- 骑手提前点到店，提前 10/30 分钟以上点击到店
select t01.dt, t01.early_arrival_5_min_order_cnt, t02.total_order_cnt, 
float(t01.early_arrival_5_min_order_cnt/t02.total_order_cnt) as early_arrival_5_min_rate
from (
select dt, count(*) as early_arrival_5_min_order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-10)
and unix_timestamp(arrive_rst_at_beacon) - unix_timestamp(arrive_rst_at) > 300
group by dt
) t01
join (
select dt, count(*) as total_order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-10)
group by dt
) t02
on t01.dt = t02.dt

order by dt

---- 骑手忘点到店，离店10/30分钟后才点击到店

select dt, count(*) as order_cnt 
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-10)
and unix_timestamp(arrive_rst_at) - unix_timestamp(leave_rst_at_beacon) > 600
group by dt
order by dt


---- 骑手忘点取餐，离店10.30分钟后才点击取餐
select dt, count(*) as order_cnt 
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-10)
and unix_timestamp(pickup_at) - unix_timestamp(leave_rst_at_beacon) > 600
group by dt
order by dt