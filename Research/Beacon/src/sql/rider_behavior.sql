---- 基于到店离店时间的骑手行为分析


---- 骑手提前点到店，提前 10/30 分钟以上点击到店
select dt, count(*) as order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-10)
and  unix_timestamp(arrive_rst_at_beacon) - unix_timestamp(arrive_rst_at) > 1800
group by dt
order by dt

---- 骑手忘点到店（离店10/30分钟后才点击到店）
select dt, count(*) as order_cnt 
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-10)
and unix_timestamp(arrive_rst_at) - unix_timestamp(leave_rst_at_beacon) > 600
group by dt
order by dt


---- 骑手忘点取餐（离店10.30分钟后才点击到店）
select dt, count(*) as order_cnt 
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-10)
and unix_timestamp(pickup_at) - unix_timestamp(leave_rst_at_beacon) > 600
group by dt
order by dt