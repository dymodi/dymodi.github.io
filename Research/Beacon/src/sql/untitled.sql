
---- 对比骑手的Beacon数据和订单数据，用来发现有单却没Beacon数据的骑手时间段
---- for phase iii data tables


drop table if exists temp.temp_beacon_phase_iii_data_order_compare; 
create table temp.temp_beacon_phase_iii_data_order_compare as 
select (case when beacon_data.target_id is not null 
        then beacon_data.target_id else order_data.taker_id end) as taker_id, 
    beacon_data.hour as data_hour, beacon_data.data_cnt, order_data.hour as order_hour, 
    order_data.order_cnt, order_data.dt
from (
	select rider_id as target_id, hour(detected_at) as hour, count(1) as data_cnt, max(dt) as dt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt=get_date(-1) and get_date(detected_at)=get_date(-1)
	group by rider_id,hour(detected_at)
) beacon_data
full outer join (
	select t01.taker_id, hour(t01.ocurred_time) as hour, count(1) as order_cnt, max(t03.dt) as dt
	from (
		select carrier_driver_id as taker_id, platform_merchant_id as restaurant_id,
		ocurred_time
		from dw.dw_tms_tb_tracking_event 
		where dt = get_date(-1) and get_date(ocurred_time) = get_date(-1)
		and shipping_state = 80
	) t01
	join (
		select rider_id as target_id, hour(detected_at) as hour, count(1) as data_cnt, 
		shop_id, max(dt) as dt
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt = get_date(-1) and get_date(detected_at) = get_date(-1)
		group by rider_id, shop_id, hour(detected_at) 
	) t03
	on t01.taker_id = t03.target_id and t01.restaurant_id = t03.shop_id
	group by t01.taker_id, hour(t01.ocurred_time)
) order_data
on beacon_data.target_id = order_data.taker_id and beacon_data.hour = order_data.hour
order by taker_id, order_hour














----- 以下用于解决骑手APP听不到Beacon的问题

select distinct (case when beacon_data.target_id is not null 
        then beacon_data.target_id else order_data.taker_id end) as taker_id, 
    beacon_data.hour as data_hour, beacon_data.data_cnt, order_data.hour as order_hour, 
    order_data.order_cnt, device_data.device_info, order_data.dt
from (
 select target_id,hour(created_at) as hour, count(1) as data_cnt, 
        max(device_info) as device_info, max(dt) as dt
 from dw.dw_tms_clairvoyant_tb_beacon 
 where dt=get_date(-1) and get_date(created_at)=get_date(-1)
 and parse_json_object(device_info, 'appVersion') = "3.2.3"
 group by target_id,hour(created_at)
) beacon_data
full outer join (
 select t01.taker_id, hour(t01.ocurred_time) as hour, count(1) as order_cnt, max(t03.dt) as dt
 from (
 select carrier_driver_id as taker_id, platform_merchant_id as restaurant_id,
 ocurred_time
 from dw.dw_tms_tb_tracking_event 
 where dt = get_date(-1) and get_date(ocurred_time) = get_date(-1)
 and shipping_state = 80
 ) t01
 join(
 select distinct building_id 
        from dw.dw_tms_clairvoyant_tb_beacon_location where dt=get_date(-1) 
 ) t02
 on t01.restaurant_id = t02.building_id 
 join (
 select target_id,hour(created_at) as hour, count(1) as data_cnt, max(dt) as dt
 from dw.dw_tms_clairvoyant_tb_beacon 
 where dt = get_date(-1) and get_date(created_at) = get_date(-1)
 group by target_id,hour(created_at) 
 ) t03
 on t01.taker_id = t03.target_id
 group by t01.taker_id, hour(t01.ocurred_time)
) order_data
on beacon_data.target_id = order_data.taker_id and beacon_data.hour = order_data.hour
join ( 
 select distinct target_id, device_info
 from dw.dw_tms_clairvoyant_tb_beacon 
 where dt=get_date(-1) and get_date(created_at) = get_date(-1)
 and parse_json_object(device_info, 'appVersion') = "3.2.3"
 ) device_data
on order_data.taker_id = device_data.target_id
where beacon_data.data_cnt is null and order_data.order_cnt is not null
order by taker_id, order_hour



select * 
from dw.dw_tms_tb_tracking_event t01,
dw.dw_tms_clairvoyant_tb_beacon_location t02
where t01.dt = get_date(-1) and get_date(t01.ocurred_time) = get_date(-1) 
and t02.dt = get_date(-1) 
and t01.platform_merchant_id = t02.building_id
and carrier_driver_id = 100068088


# 给定商户ID查beacon信号
select t01.target_id, t01.created_at, t01.beacon_info, t01.device_info
from
dw.dw_tms_clairvoyant_tb_beacon t01,
dw.dw_tms_clairvoyant_tb_beacon_location t02
where t02.major = parse_json_object(t01.beacon_info, 'beaconMajor')
and t02.minor = parse_json_object(t01.beacon_info, 'beaconMinor')
and t02.building_id = 918209
and t01.dt = get_date(-1) and get_date(t01.created_at) = get_date(-1)
and t02.dt = get_date(-1) 
and t01.created_at > '2017-12-18 17:00:00'
and t01.created_at < '2017-12-18 18:00:00'
and parse_json_object(t01.beacon_info, 'beaconRssi') <> 0

​


​