---- This sql is for RADD paper

---- Find time shift
drop table if exists temp.temp_beacon_order_time_shift;
create table temp.temp_beacon_order_time_shift as
select t01.rider_id, t10.tracking_id, 
t10.ocurred_time as accept_at,
---- t80.ocurred_time as arrive_at,
---- t30.ocurred_time as pickup_at,
---- t40.ocurred_time as deliver_at,
t01.rssi,
t01.detected_at
from (
select * from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-8)
) t01
join (
select * from dw.dw_tms_tb_tracking_event
where dt = get_date(-1) and get_date(ocurred_time) > get_date(-8)
and shipping_state = 20
) t10
on t01.dt = t10.dt and t01.dt = get_date(t10.ocurred_time)
and t01.rider_id = t10.carrier_driver_id
and t01.shop_id = t10.platform_merchant_id
join (
select * from dw.dw_tms_tb_tracking_event
where dt = get_date(-1) and get_date(ocurred_time) > get_date(-8)
and shipping_state = 80
) t80
on t01.dt = t80.dt and t01.dt = get_date(t80.ocurred_time)
and t01.rider_id = t80.carrier_driver_id
and t01.shop_id = t80.platform_merchant_id
and t10.tracking_id = t80.tracking_id
join (
select * from dw.dw_tms_tb_tracking_event
where dt = get_date(-1) and get_date(ocurred_time) > get_date(-8)
and shipping_state = 30
) t30
on t01.dt = t30.dt and t01.dt = get_date(t30.ocurred_time)
and t01.rider_id = t30.carrier_driver_id
and t01.shop_id = t30.platform_merchant_id
and t80.tracking_id = t30.tracking_id
join (
select * from dw.dw_tms_tb_tracking_event
where dt = get_date(-1) and get_date(ocurred_time) > get_date(-8)
and shipping_state = 40
) t40
on t01.dt = get_date(t40.ocurred_time)
and t01.rider_id = t40.carrier_driver_id
and t01.shop_id = t40.platform_merchant_id
and t30.tracking_id = t40.tracking_id
where t01.detected_at > t10.ocurred_time and t01.detected_at < t40.ocurred_time
