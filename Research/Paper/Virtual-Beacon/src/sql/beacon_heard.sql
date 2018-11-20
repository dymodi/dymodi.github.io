---- 应该听到虚拟Beacon的订单数
SELECT (case when t02.manufacturer = 'Apple' then 'iOS' else 'Android' end) as platform,
count(distinct t01.tracking_id) as order_cnt
from 
dw_ai.dw_ai_virtual_beacon_tracking_day t01,
dw_ai.dw_ai_merchant_virtualbeacon_info t02
where t01.dt > get_date(-10) and t01.dt > get_date(-10)
and t01.shop_id = t02.shop_id and t01.dt = t02.dt
group by (case when t02.manufacturer = 'Apple' then 'iOS' else 'Android' end)

---- 实际听到虚拟Beacon的订单数
SELECT (case when t02.manufacturer = 'Apple' then 'iOS' else 'Android' end) as platform,
count(distinct t01.tracking_id) as order_cnt
from 
dw_ai.dw_ai_virtual_beacon_tracking_heard t01,
dw_ai.dw_ai_merchant_virtualbeacon_info t02
where t01.dt > get_date(-10) and t01.dt > get_date(-10)
and t01.shop_id = t02.shop_id and t01.dt = t02.dt
group by (case when t02.manufacturer = 'Apple' then 'iOS' else 'Android' end)
