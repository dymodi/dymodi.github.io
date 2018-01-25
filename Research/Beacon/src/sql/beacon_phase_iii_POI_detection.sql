---- 对比基于Beacon的定位和基于GPS的定位
select t01.rider_id, t01.beacon_id, t01.shop_id, t01.detected_at as beacon_detected_at,
t01.latitude as shop_latitude, t01.longitude as shop_longitude,
t02.latitude as rider_latitude, t02.longitude as rider_longtiude,
get_point_distance(t01.latitude, t01.longitude, t02.latitude, t02.longitude) as distance, 
t02.record_time as talaris_record_time ,t01.dt as dt
from 
(
	select rider_id, beacon_id, shop_id, detected_at, latitude, longitude,
	row_number() over (partition by rider_id order by detected_at) as rn,
	dt
	from dw_ai.dw_ai_clairvoyant_beacon 
	where dt > get_date(-3) and rssi > -80
) t01
left join
(
	select taker_id, record_time, latitude, longitude, 
	row_number() over (partition by taker_id order by record_time) as rn,
	dt
	from dw.dw_log_talaris_taker_location_day_inc 
	where dt > get_date(-3) and parse_json_object(detail,'location_type') <> 10
) t02
on t01.rider_id = t02.taker_id and t01.dt = t02.dt
where unix_timestamp(t01.detected_at) - unix_timestamp(t02.record_time) > -10
and unix_timestamp(t01.detected_at) < unix_timestamp(t02.record_time)
and get_point_distance(t01.latitude, t01.longitude, t02.latitude, t02.longitude) > 0.5

