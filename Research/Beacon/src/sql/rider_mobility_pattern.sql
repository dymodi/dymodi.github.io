---- Rider's Mobility Pattern

---- Rider's bahavior table 80, 30, 40
select tracking_id, platform_merchant_id, platform_merchant_name, shipping_state, created_at, carrier_driver_id, dt
from dw.dw_tms_tb_tracking_event 
where dt = get_date(-1) and carrier_driver_id= 10125035 
and created_at > get_date(-2) and (shipping_state = 40 or shipping_state = 80 or shipping_state = 30)
order by created_at

---- Rider's bahavior table
select t01.tracking_id, t01.platform_merchant_id, t01.shipping_state, t01.created_at, t01.from_shipping_state, t01.carrier_driver_id,
t02.carrier_driver_id as carrier_driver_id_2, t02.shipping_state as shipping_state_2, t02.created_at as created_at_02
from ( 
select * 
from dw.dw_tms_tb_tracking_event where dt = get_date(-1) and carrier_driver_id <> "" and shipping_state <> 0 and shipping_state <> 10
) t01
join (
select * 
from dw.dw_tms_tb_tracking_event where dt = get_date(-1) and carrier_driver_id <> "" and shipping_state <> 0 and shipping_state <> 10
) t02
on t01.tracking_id = t02.tracking_id 
where t01.carrier_driver_id <> t02.carrier_driver_id
order by t01.created_at




---- Select all tracking event that are successfully delivered by the rider
drop table if exists temp.temp_beacon_rider_event_with_state_40;
create table temp.temp_beacon_rider_event_with_state_40 as
select * from (
	select * 
	from dw.dw_tms_tb_tracking_event where dt = get_date(-1) and created_at > get_date(-1))  t_001 
join (
	select tracking_id as tracking_id_02, carrier_driver_id as carrier_driver_id_02 
	from dw.dw_tms_tb_tracking_event where dt = get_date(-1) and created_at > get_date(-1) and shipping_state = 40) t_002 
on t_001.tracking_id = t_002.tracking_id_02 and t_001.carrier_driver_id = t_002.carrier_driver_id_02
join (
	select distinct target_id from dw.dw_tms_clairvoyant_tb_beacon 
	where dt = get_date(-1) and created_at > get_date(-2) 
	and parse_json_object(beacon_info, 'beaconUuid') = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0​' 
	and (parse_json_object(beacon_info, 'beaconMajor') = 16160 or parse_json_object(beacon_info, 'beaconMajor') = 16161)
) t_beacon
on t_001.carrier_driver_id = t_beacon.target_id;

---- Get Riders R to R data from Event table
drop table if exists temp.temp_beacon_rst_rst_edge_feature_day;
create table temp.temp_beacon_rst_rst_edge_feature_day as
select 
t01.target_id, t01.from_shop_at, t01.to_shop_at,t01.from_shop, t01.to_shop,t01.rider_lat, t01.rider_lon, t02.shop_latitude as from_lat, t02.shop_longitude as from_lon,
t03.shop_latitude as to_lat, t03.shop_longitude as to_lon, 
(case when t04.floor_number is null then 0 when t04.floor_number = 'B1' then -1 when t04.floor_number = 'B2' then -2 else t04.floor_number end) as from_floor, 
(case when t05.floor_number is null then 0 when t05.floor_number = 'B1' then -1 when t05.floor_number = 'B2' then -2 else t05.floor_number end) as to_floor, 
get_point_distance(t02.shop_latitude, t02.shop_longitude, t03.shop_latitude, t03.shop_longitude) as distance_delta,
t06.weather, hour(t01.created_at) as hour,
(unix_timestamp(t01.to_shop_at) - unix_timestamp(t01.from_shop_at)) as time_delta,
t01.dt
from
(select carrier_driver_id as target_id, created_at, latitude as rider_lat, longitude as rider_lon, 
	case when LAG (shipping_state, 1) OVER (PARTITION by carrier_driver_id ORDER BY created_at) = 30 and shipping_state = 80 then LAG (platform_merchant_id, 1) OVER (PARTITION by carrier_driver_id ORDER BY created_at) end as from_shop,
	case when LAG (shipping_state, 1) OVER (PARTITION by carrier_driver_id ORDER BY created_at) = 30 and shipping_state = 80 then platform_merchant_id end as to_shop,
	case when LAG (shipping_state, 1) OVER (PARTITION by carrier_driver_id ORDER BY created_at) = 30 and shipping_state = 80 then LAG (created_at, 1) OVER (PARTITION by carrier_driver_id ORDER BY created_at) end as from_shop_at,
	case when LAG (shipping_state, 1) OVER (PARTITION by carrier_driver_id ORDER BY created_at) = 30 and shipping_state = 80 then created_at end as to_shop_at,
	dt
from temp.temp_beacon_rider_event_with_state_40 
where dt = get_date(-1)
and created_at > get_date(-2) and (shipping_state = 40 or shipping_state = 80 or shipping_state = 30)
) t01
join
(select * from dm.dm_prd_shop_wide where dt = get_date(-1)
) t02 
on t01.from_shop = t02.shop_id
join
(select * from dm.dm_prd_shop_wide where dt = get_date(-1)
) t03
on t01.to_shop = t03.shop_id
left join (
	select distinct building_id, floor_number from dw.dw_tms_clairvoyant_tb_beacon_location where dt = get_date(-1)
) t04
on t01.from_shop = t04.building_id
left join (
	select distinct building_id, floor_number from dw.dw_tms_clairvoyant_tb_beacon_location where dt = get_date(-1)
) t05
on t01.to_shop = t05.building_id
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
	) t06
	on get_date(t01.created_at) = get_date(t06.date_full)
where from_shop <> to_shop and get_date(from_shop_at) = get_date(to_shop_at)