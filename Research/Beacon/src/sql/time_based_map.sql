---- Time basd map
---- Yi DING
---- 10/16/17


---- Here we compute the distance and time delta from raw data table
---- Select data that power is strong enough
drop table if exists temp.temp_beacon_high_power_order_time_map;
create table temp.temp_beacon_high_power_order_time_map as
select created_at, target_id, 
	parse_json_object(beacon_info, 'beaconRssi') as rssi,
	parse_json_object(beacon_info, 'beaconUuid') as uuid,
	parse_json_object(beacon_info, 'beaconMajor') as major,
	parse_json_object(beacon_info, 'beaconMinor') as minor,
	dt
from dw.dw_tms_clairvoyant_tb_beacon
where dt = get_date(-1) and parse_json_object(beacon_info, 'beaconRssi') > -75;

---- Get the latitude/longitude from beacon location table
drop table if exists temp.temp_beacon_high_power_rn_time_map;
create table temp.temp_beacon_high_power_rn_time_map as
select t03.created_at, t03.major, t03.minor, t03.target_id, t03.latitude, t03.longitude, t03.building_id, t03.floor,
row_number() over (partition by t03.target_id order by t03.created_at) as rn, t03.dt 
from (
	select t01.created_at, t02.major, t02.minor, t01.target_id, t02.latitude, t02.longitude, t02.building_id, 
	(case 
		when t02.floor_number = 'B1' then -1
		when t02.floor_number = 'B2' then -2
		else t02.floor_number end
		)
	as floor, t01.dt
	from (
		select * from temp.temp_beacon_high_power_order_time_map
	) t01
	join (
		select * from dw.dw_tms_clairvoyant_tb_beacon_location
		where dt = get_date(-1)
	) t02
	on t01.uuid=t02.uuid and t01.major = t02.major and t01.minor=t02.minor
) t03;


---- Calculate the distance and time delta using LAG
drop table if exists temp.temp_beacon_distance_time_delta_time_map;
create table temp.temp_beacon_distance_time_delta_time_map as
select created_at, target_id, 
LAG (building_id, 1) OVER (PARTITION by target_id ORDER BY rn) as last_building_id,
LAG (latitude, 1) OVER (PARTITION by target_id ORDER BY rn) as last_latitude,
LAG (longitude, 1) OVER (PARTITION by target_id ORDER BY rn) as last_longitude,
LAG (floor, 1) OVER (PARTITION by target_id ORDER BY rn) as last_floor,
building_id, latitude, longitude, floor,
get_point_distance(latitude, longitude, LAG (latitude, 1) 
	OVER (PARTITION by target_id ORDER BY rn), LAG (longitude, 1) OVER (PARTITION by target_id ORDER BY rn)) as distance_delta,
(unix_timestamp(created_at) - unix_timestamp(LAG (created_at , 1) OVER (PARTITION by target_id ORDER BY rn))) as time_delta, rn, dt
from temp.temp_beacon_high_power_rn_time_map;

---- Join to get weather
drop table if exists temp.temp_beacon_time_map_shop_shop_edge_data;
create table temp.temp_beacon_time_map_shop_shop_edge_data as
	select t01.created_at, t01.target_id, t01.last_building_id, t01.last_latitude, t01.last_longitude, t01.last_floor, 
	t01.building_id, t01.latitude, t01.longitude, t01.floor, t01.distance_delta, hour(t01.created_at) as hour, t02.weather, 
	t01.time_delta
	from (
		select * from temp.temp_beacon_distance_time_delta_time_map
		where distance_delta is not null and distance_delta > 0.001 and last_building_id <> building_id and target_id <> 0
	) t01
	join(
		select `date` as date_full, 
		(case 
			when tianqi = '大雨' then 1
			when tianqi = '中雨' then 2
			when tianqi = '小雨' then 3
			when tianqi = '阵雨' then 4
			when tianqi = '阴' then 5
			when tianqi = '多云' then 6
			when tianqi = '晴' then  7
			when tianqi = null then null
			else 0 end) as weather
		from dw.dw_ext_weather24 
		where dt = get_date(-1) and get_date(`date`) = get_date(-1) and hour = 9 and cityname = '上海市' and areaname = '上海' and tianqi is not null
		limit 1
	) t02
	on get_date(t01.created_at) = get_date(t02.date_full);


---- Get batch information for all beacon riders
drop table if exists temp.temp_beacon_rider_batch;
create table temp.temp_beacon_rider_batch as
select t01.target_id, t02.tracking_id, t02.arrived_at, t02.delivered_at
from (
	select distinct target_id
	from temp.temp_beacon_high_power_order_time_map
	where target_id <> 0
) t01
join (
	select t03.tracking_id, t03.carrier_driver_id, t03.arrived_at, t04.delivered_at
	from (
		select distinct tracking_id, carrier_driver_id, ocurred_time as arrived_at, ocurred_time
		from dw.dw_tms_tb_tracking_event
		where dt = get_date(-1) and ocurred_time is not null and carrier_driver_id is not null
		and ocurred_time > get_date(-2) and carrier_driver_id <>'' and shipping_state = 80
		) t03
	join (
		select distinct tracking_id, carrier_driver_id, ocurred_time as delivered_at, ocurred_time
		from dw.dw_tms_tb_tracking_event
		where dt = get_date(-1) and ocurred_time is not null and carrier_driver_id is not null
		and ocurred_time > get_date(-2) and carrier_driver_id <>'' and shipping_state = 40
		) t04 
	on t03.tracking_id = t04.tracking_id and t03.carrier_driver_id = t04.carrier_driver_id
) t02
on t01.target_id = t02.carrier_driver_id;


---- Get a sequence of rider's behavior
drop table if exists temp.temp_beacon_rider_event_sequence;
create table temp.temp_beacon_rider_event_sequence as
select t01.target_id, t02.platform_merchant_id as shop_id, 
t02.tracking_id, t02.ocurred_time as occurred_at, 
(case when t02.shipping_state = 80 then 'arrive' 
	when t02.shipping_state = 30 then 'pick' 
	when t02.shipping_state = 40 then 'deliver' 
	else 'null' end) as event, 
t03.shop_latitude as shop_latitude, t03.shop_longitude as shop_longitude,
t02.latitude as rider_latitude, t02.longitude as rider_longitude,
t04.user_latitude as customer_latitude, t04.user_longitude as customer_longitude,
row_number() over (partition by t01.target_id order by t02.ocurred_time) as rn

from (
	select distinct target_id
	from temp.temp_beacon_high_power_order_time_map
	where target_id <> 0
) t01
join (
	select distinct tracking_id, carrier_driver_id, ocurred_time, shipping_state, 
	platform_merchant_id, latitude, longitude
	from dw.dw_tms_tb_tracking_event
	where dt = get_date(-1) and ocurred_time is not null and carrier_driver_id is not null
	and ocurred_time > get_date(-2) and carrier_driver_id <>'' 
	and (shipping_state = 40 or shipping_state = 80 or shipping_state = 30)
) t02
on t01.target_id = t02.carrier_driver_id
join (
	select shop_id, shop_latitude, shop_longitude
	from dm.dm_prd_shop_wide
	where dt = get_date(-1)
) t03
on t02.platform_merchant_id = t03.shop_id
join (
	select tracking_id, user_latitude, user_longitude
	from dm.dm_tms_apollo_waybill_wide_detail
	where dt = get_date(-1)
) t04
on t02.tracking_id = t04.tracking_id


---- Create a temp table in creating rider sequence between shops
drop table if exists temp.temp_beacon_rider_event_sequence_without_deliver;
create table temp.temp_beacon_rider_event_sequence_without_deliver as
select * from temp.temp_beacon_rider_event_sequence
where event <> 'deliver'

---- Get rider's feature between shops from rider_event_sequence table
drop table if exists temp.temp_beacon_rider_eta_between_shops;
create table temp.temp_beacon_rider_eta_between_shops as
select (unix_timestamp(t02.occurred_at)-unix_timestamp(t01.occurred_at)) as label, 
t01.target_id as target_id, 
t01.shop_id as from_shop_id, t01.occurred_at as from_shop_at,
t01.shop_latitude as from_shop_latitude, t01.shop_longitude as from_shop_longitude,
t01.rider_latitude as from_rider_latitude, t01.rider_longitude as from_rider_longitide,
t02.shop_id as to_shop_id, t02.occurred_at as tp_shop_at,
t02.shop_latitude as to_shop_latitude, t02.shop_longitude as to_shop_longitude,
t02.rider_latitude as to_rider_latitude, t02.rider_longitude as to_rider_longitide
from (
	select target_id, shop_id, occurred_at, event, rider_latitude, rider_longitude, rn,
	shop_latitude, shop_longitude
	from temp.temp_beacon_rider_event_sequence_without_deliver
) t01
join (
	select target_id, shop_id, occurred_at, event, rider_latitude, rider_longitude, rn,
	shop_latitude, shop_longitude
	from temp.temp_beacon_rider_event_sequence_without_deliver
) t02
on t01.target_id = t02.target_id and t01.rn + 1 = t02.rn
where t01.shop_id <> t02.shop_id



---- Similarly we can get the rider's behavior staying at the shop based on sequence table
drop table if exists temp.temp_beacon_rider_eta_stay_shops;
create table temp.temp_beacon_rider_eta_stay_shops as
select t01.target_id as target_id, 
t01.shop_id as from_shop_id, t01.occurred_at as from_shop_at, 
t02.shop_id as to_shop_id, t02.occurred_at as tp_shop_at
from (
	select target_id, shop_id, occurred_at, event, rider_latitude, rider_longitude, rn
	from temp.temp_beacon_rider_event_sequence_without_deliver
) t01
join (
	select target_id, shop_id, occurred_at, event, rider_latitude, rider_longitude, rn
	from temp.temp_beacon_rider_event_sequence_without_deliver
) t02
on t01.target_id = t02.target_id and t01.rn + 1 = t02.rn
where t01.shop_id = t02.shop_id





