---- 骑手基于Beacon的定位和基于GPS的定位比较

---- 建临时表，联骑手的GPS位置和Beacon位置
drop table if exists temp.temp_beacon_rider_all_pos;
create table temp.temp_beacon_rider_all_pos as
select t01.taker_id, t01.record_time, t01.latitude as gps_latitude, t01.longitude as gps_longitude,
parse_json_object(t01.detail, 'location_type') as location_type, t01.rn,
t02.detected_at as beacon_detected_at, t02.latitude as beacon_latitude, t02.longitude as beacon_longitude, t02.shop_id
from (
	select taker_id, record_time, latitude, longitude, detail,
	row_number() over (partition by taker_id order by record_time) as rn, dt
	from dw.dw_log_talaris_taker_location_day_inc
	where dt = get_date(-1)
) t01
join(
	select rider_id, detected_at, latitude, longitude, shop_id, dt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt = get_date(-1) and rssi > -80
) t02
on t01.taker_id = t02.rider_id and t01.dt = t02.dt
and hour(t01.record_time) = hour(t02.detected_at)
where parse_json_object(t01.detail, 'location_type') <> 10
and abs(unix_timestamp(t01.record_time) - unix_timestamp(t02.detected_at)) < 10


---- 比较骑手漂移的距离
drop table if exists temp.temp_beacon_rider_beacon_gsp_compare;
create table temp.temp_beacon_rider_beacon_gsp_compare as
select taker_id, get_point_distance(gps_latitude, gps_longitude, beacon_latitude, beacon_longitude) as distance,
record_time, gps_latitude, gps_longitude,beacon_detected_at, beacon_latitude, beacon_longitude, shop_id
from temp.temp_beacon_rider_all_pos


---- 给定骑手id和时间，反查千里眼轨迹
select * 
from dw.dw_log_talaris_taker_location_day_inc
where taker_id = 733326 
and record_time > '2018-02-05 15:00:00' and record_time < '2018-02-05 16:00:00'
and dt = '2018-02-05'