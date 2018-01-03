---- Indoor Walking Speed Estimation
---- Yi DING @ELE.ME
---- 09/22/17

---- This is the result from Qiao's table from clairvoyant, it's not accurate
select round(t01.beacon_speed,1) as bucket, count(*) as count
from (
	select (distance*1000/period) as beacon_speed, (gps_distance*1000/gps_period) as gps_speed
	from dw.dw_beacon_distance
	where dt = get_date(-1)
)t01
group by round(t01.beacon_speed,1)
limit 100

---- Here we compute the distance and time delta from raw data table
---- Select data that power is strong enough
drop table if exists temp.temp_beacon_high_power_order;
create table temp.temp_beacon_high_power_order as
select created_at, target_id, 
	parse_json_object(beacon_info, 'beaconRssi') as rssi,
	parse_json_object(beacon_info, 'beaconUuid') as uuid,
	parse_json_object(beacon_info, 'beaconMajor') as major,
	parse_json_object(beacon_info, 'beaconMinor') as minor,
	dt
from dw.dw_tms_clairvoyant_tb_beacon
where dt = get_date(-1) and created_at > get_date(-2) 
and parse_json_object(beacon_info, 'beaconRssi') > -70 
and parse_json_object(beacon_info, 'beaconUuid') = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0​';

---- Get the latitude/longitude from beacon location table
drop table if exists temp.temp_beacon_high_power_rn;
create table temp.temp_beacon_high_power_rn as
select t03.created_at, t03.major, t03.minor, t03.target_id, t03.latitude, t03.longitude, t03.building_id,
row_number() over (partition by t03.target_id order by t03.created_at) as rn, t03.dt 
from (
	select t01.created_at, t02.major, t02.minor, t01.target_id, t02.latitude, t02.longitude, t02.building_id,t01.dt
	from (
		select * from temp.temp_beacon_high_power_order
	) t01
	join (
		select * from dw.dw_tms_clairvoyant_tb_beacon_location
		where dt = get_date(-1)
		and building_id <> 156771721
		and building_id <> 155834939
		and building_id <> 150137425
		and building_id <> 841116
		and building_id <> 152342460
		and building_id <> 150883511
		and building_id <> 155843604
		and building_id <> 156113028
		and building_id <> 1872851
		and building_id <> 150106771
		and building_id <> 152197345
		and building_id <> 577024
		and building_id <> 150152021
		and building_id <> 1097992
		and building_id <> 150146400
		and building_id <> 156692019
		and building_id <> 956058
		and building_id <> 156278875
		and building_id <> 151006689
		and building_id <> 319962
		and building_id <> 896883
		and building_id <> 1293479
		and building_id <> 456897
		and building_id <> 155769402
		and building_id <> 147884394
		and building_id <> 1464078
		and building_id <> 152202819
		and building_id <> 1959338
		and building_id <> 1879109
		and building_id <> 44156
		and building_id <> 156870775
		and building_id <> 156062104
		and building_id <> 2110176
		and building_id <> 1395836
		and building_id <> 1027855

	) t02
	on t01.uuid=t02.uuid and t01.major = t02.major and t01.minor=t02.minor
) t03;

---- Calculate the distance and time delta using LAG
drop table if exists temp.temp_beacon_distance_time_delta;
create table temp.temp_beacon_distance_time_delta as
select created_at, major, minor, target_id, latitude, longitude, building_id,
LAG (building_id, 1) OVER (PARTITION by target_id ORDER BY rn) as last_building_id,
get_point_distance(latitude, longitude, LAG (latitude, 1) 
	OVER (PARTITION by target_id ORDER BY rn), LAG (longitude, 1) OVER (PARTITION by target_id ORDER BY rn)) as distance_delta,
(unix_timestamp(created_at) - unix_timestamp(LAG (created_at , 1) OVER (PARTITION by target_id ORDER BY rn))) as time_delta, rn, dt
from temp.temp_beacon_high_power_rn;

---- Calculate speed from distance and time delta
drop table if exists temp.temp_beacon_speed;
create table temp.temp_beacon_speed as
select created_at, major, minor, target_id, latitude, longitude, building_id, last_building_id, distance_delta, time_delta, 
(case when time_delta = 0 and distance_delta > 0 then 10000000 else distance_delta*1000/time_delta end) as speed, rn, dt
from temp.temp_beacon_distance_time_delta
where (case when time_delta = 0 and distance_delta > 0 then 10000000 else distance_delta*1000/time_delta end) is not null
and time_delta < 60;

---- Create histogram
select round(speed,1) as bucket, count(*) as count
from temp.temp_beacon_speed
group by round(speed,1)
order by bucket

---- Sort the speed table in the speed descent order
select * from temp.temp_beacon_speed where speed < 1000000 order by speed desc limit 100

---- Pick the wrong ONE from TWO
select 
count(case when building_id = 152328508 or last_building_id = 152328508 then rn end) as num_1,
count(case when building_id = 1395836 or last_building_id = 1395836 then rn end) as num_2
from temp.temp_beacon_speed 
where speed > 10 and speed < 1000000 

---------------------------------------------------------------------------------------------------------------
---- Check whether need to update latitude/longitude in beacon_location data
select t01.shop_id as shop_id, t01.shop_latitude as shop_wide_latitude, t01.shop_longitude as shop_wide_longitude,
t02.latitude as beacon_latitude, t02.longitude as beacon_longitude, (t01.shop_latitude-t02.latitude) as diff_latitude,
(t01.shop_longitude-t02.longitude) as diff_longitude
from 
(select shop_id, shop_latitude, shop_longitude
from dm.dm_prd_shop_wide
where dt = get_date(-1)
) t01
join
(select building_id, latitude, longitude
from dw.dw_tms_clairvoyant_tb_beacon_location
where dt = get_date(-1) and (major = 16160 or major = 16161)
) t02
on t01.shop_id = t02.building_id



---------------------------------------------------------------------------------------------------------------
---- Here we use the data from dw_ai.dw_aly_t_model_4_3_feature_v5 to calculate generic rider mobility pattern
drop table if exists temp.temp_beacon_generic_speed;
create table temp.temp_beacon_generic_speed as
select label as order_time, order_distance, ((order_distance*1000)/label) as order_speed
​from dw_ai.dw_aly_t_model_4_3_feature_v5 where dt = get_date(-1);


---- Create histogram
select round(order_speed,1) as bucket, count(*) as count
from temp.temp_beacon_generic_speed
group by round(order_speed,1)
order by bucket


---------------------------------------------------------------------------------------------------------------
---- Here we use the Jintie Data
---- Upload Jintie shop lat/lon
INSERT overwrite TABLE dw_analyst.dw_analyst_beacon_location_jintie partition(dt='${day}')
select shop_id_platform, shop_id_pi, shop_name, beacon_uuid, beacon_major, beacon_minor, latitude, longitude, floor
from dw_analyst.dw_analyst_beacon_location_jintie where dt = '${day-1d}';

---- Load from temp table
INSERT overwrite TABLE dw_analyst.dw_analyst_beacon_location_jintie partition(dt='2017-10-31')
select * from temp_analyst.beacon_location_jintie;



drop table if exists temp.temp_beacon_high_power_order_jintie;
create table temp.temp_beacon_high_power_order_jintie as
select created_at, user_id as target_id, beacon_rssi as rssi, beacon_uuid as uuid, beacon_major as major,beacon_minor as minor, dt
from dw.dw_tms_interstellar_ins_beacon_data_hour
where dt = get_date(-1) and hour = 12 and created_at > get_date(-1)
and beacon_rssi > -75 and beacon_uuid = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0​';



docker build -t docker-hack.ele.me/yi.ding02:test /Users/eleme-yi/Documents/PhD/Projects/EleMe/Hackathon/docker

