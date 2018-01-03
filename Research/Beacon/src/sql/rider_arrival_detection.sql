---- The following is the simple arrival depature model
---- Related discussion can be found in the blog "Beacon-Rider-Arrival-Depature-Detection"

---- List the arrival/depature event
select t01.created_at, t01.target_id, t01.rssi, t02.building_id, 
row_number() over (partition by t02.building_id order by t01.created_at) as rn, t01.dt
from (
	select created_at, target_id, parse_json_object(beacon_info, 'beaconRssi') as rssi, 
	parse_json_object(beacon_info, 'beaconMajor') as major, parse_json_object(beacon_info, 'beaconMinor') as minor, dt
	from dw.dw_tms_clairvoyant_tb_beacon 
	where dt = get_date(-1) and created_at > "2017-10-10" and parse_json_object(beacon_info, 'beaconRssi')>-75 
	and parse_json_object(beacon_info, 'beaconUuid') = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0​" and target_id = 10485410
) t01
join(
	select * from
	dw.dw_tms_clairvoyant_tb_beacon_location
	where dt = get_date(-1)
) t02
on t01.major = t02.major and t01.minor = t02.minor
order by t01.created_at

---- Find the suitable riders
select target_id, count(*) from dw.dw_tms_clairvoyant_tb_beacon 
where dt = get_date(-1) and created_at > "2017-10-10" and parse_json_object(beacon_info, 'beaconRssi')>-75 
and parse_json_object(beacon_info, 'beaconUuid') = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0​"
group by target_id



---- The following is the procedure taking orders into consideration
---- Find the delivery orders from beacon shop and beacon riders
 drop table if exists temp.temp_rider_event; 
 create table temp.temp_rider_event as select rider_event.tracking_id, rider_event.platform_merchant_id as shop_id, 
 	rider_event.rider_id, rider_event.accept_at, rider_event.arrive_rst_at, rider_event.pickup_at, rider_event.deliver_at, 
 	rider_event.accept_latitude, rider_event.accept_longitude, rider_event.arrive_rst_latitude, rider_event.arrive_rst_longitude, 
 	rider_event.pickup_latitude, rider_event.pickup_longitude, rider_event.deliver_latitude, rider_event.deliver_longitude, rider_event.dt 
 	from ( select t20.tracking_id, t20.platform_merchant_id, t20.carrier_driver_id as rider_id, t20.ocurred_time as accept_at, 
 		t80.ocurred_time as arrive_rst_at, t30.ocurred_time as pickup_at, t40.ocurred_time as deliver_at, t20.latitude as accept_latitude, 
 		t20.longitude as accept_longitude, t80.latitude as arrive_rst_latitude, t80.longitude as arrive_rst_longitude, 
 		t30.latitude as pickup_latitude, t30.longitude as pickup_longitude, t40.latitude as deliver_latitude, 
 		t40.longitude as deliver_longitude, t20.dt 
 		from ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = '${day}' and get_date(ocurred_time) = '${day}' and shipping_state = 20 ) t20 
 		join ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = '${day}' and get_date(ocurred_time) = '${day}' and shipping_state = 30 ) t30 
 		on t20.tracking_id = t30.tracking_id and t20.carrier_driver_id = t30.carrier_driver_id 
 		join ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = '${day}' and get_date(ocurred_time) = '${day}' and shipping_state = 80 ) t80 
 		on t20.tracking_id = t80.tracking_id and t20.carrier_driver_id = t80.carrier_driver_id 
 		join ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = '${day}' and get_date(ocurred_time) = '${day}' and shipping_state = 40 ) t40 
 		on t20.tracking_id = t40.tracking_id and t20.carrier_driver_id = t40.carrier_driver_id ) rider_event 
 	join( select distinct building_id from dw.dw_tms_clairvoyant_tb_beacon_location where dt = '${day}' ) t04 
 	on rider_event.platform_merchant_id = t04.building_id 
 	join( select distinct target_id from dw.dw_tms_clairvoyant_tb_beacon where dt = '${day}' ) t05 on rider_event.rider_id = t05.target_id;
 
 ---- 根据每个event的时间窗来找beaocn时间戳 
 ---- drop table if exists temp.temp_beacon_rider_event; 
 ---- create table temp.temp_beacon_rider_event as 
 INSERT overwrite TABLE dw_analyst.dw_analyst_beacon_rider_event partition(dt='${day}') 
 select t01.tracking_id, max(t01.shop_id) as shop_id, max(t01.rider_id) as rider_id, max(t01.accept_at) as accept_at, 
 min(t02.created_at) as arrive_rst_at_beacon, max(t01.arrive_rst_at) as arrive_rst_at, max(t01.pickup_at) as pickup_at, 
 max(t02.created_at) as leave_rst_beacon, max(t01.deliver_at) as deliver_at
 from ( select * from temp.temp_rider_event ) t01 join ( select * from dw.dw_tms_clairvoyant_tb_beacon 
 	where dt = '${day}' and parse_json_object(beacon_info, 'beaconRssi') > -80 ) t02 
 on t01.rider_id = t02.target_id 
 join ( select * from dw.dw_tms_clairvoyant_tb_beacon_location 
 	where dt = '${day}' ) t03 
 on parse_json_object(t02.beacon_info, 'beaconMajor') = t03.major and parse_json_object(t02.beacon_info, 'beaconMinor') = t03.minor 
 and t01.shop_id = t03.building_id where t02.created_at > t01.accept_at and t02.created_at < t01.deliver_at group by t01.tracking_id; 

 ---- 查看区别 
 drop table if exists temp.temp_beacon_rider_event_diff;
 create table temp.temp_beacon_rider_event_diff as
 select tracking_id, shop_id, rider_id, 
 (unix_timestamp(arrive_rst_at)-unix_timestamp(arrive_rst_at_beacon))/60 as arrive_earlier, 
 (unix_timestamp(leave_rst_at_beacon)-unix_timestamp(pickup_at))/60 as stay_after_pickup 
 from dw_analyst.dw_analyst_beacon_rider_event
 where dt = get_date(-1)

---- Create histogram
select round(arrive_earlier,0) as arrive_earlier_bucket, count(*) as arrive_earlier_count
from temp.temp_beacon_rider_event_diff
group by round(arrive_earlier,0)
order by arrive_earlier_bucket

---- Create histogram
select round(stay_after_pickup,0) as stay_after_pickup_bucket, count(*) as stay_after_pickup_count
from temp.temp_beacon_rider_event_diff
group by round(stay_after_pickup,0)
order by stay_after_pickup_bucket





---- Change RSSI threshold to see the difference
drop table if exists temp.temp_beacon_rider_event; 
create table temp.temp_beacon_rider_event as
select t01.tracking_id, max(t01.shop_id) as shop_id, max(t01.rider_id) as rider_id, max(t01.accept_at) as accept_at, 
 min(t02.created_at) as arrive_rst_at_beacon, max(t01.arrive_rst_at) as arrive_rst_at, max(t01.pickup_at) as pickup_at, 
 max(t02.created_at) as leave_rst_beacon, max(t01.deliver_at) as deliver_at, max(t02.dt) as dt
 from ( select * from temp.temp_rider_event ) t01 join ( select * from dw.dw_tms_clairvoyant_tb_beacon 
 	where dt = get_date(-1) and parse_json_object(beacon_info, 'beaconRssi') > -85 ) t02 
 on t01.rider_id = t02.target_id 
 join ( select * from dw.dw_tms_clairvoyant_tb_beacon_location 
 	where dt = get_date(-1) ) t03 
 on parse_json_object(t02.beacon_info, 'beaconMajor') = t03.major and parse_json_object(t02.beacon_info, 'beaconMinor') = t03.minor 
 and t01.shop_id = t03.building_id where t02.created_at > t01.accept_at and t02.created_at < t01.deliver_at group by t01.tracking_id; 

#beacon听到的订单数
select shop_id , count(distinct tracking_id) as num 
from temp.temp_beacon_rider_event 
where dt = get_date(-1) group by shop_id

-----------------------------------------------
#物流宽表订单数
select t1.restaurant_id, count(distinct t1.tracking_id) as num 
from dm.dm_tms_apollo_waybill_wide_detail t1, temp.temp_beacon_rider_event t2 
where t1.dt = get_date(-1) 
 and t2.dt = get_date(-1) 
 and t1.restaurant_id=cast(t2.shop_id as string) 
 and t1.taker_id in (
  select courier_id from dw.dw_beacon_courier_summary_day where dt=get_date(-1) 
 ) 
 and carrier_id=5 
 group by t1.restaurant_id



---- Find typical early labeling riders
select * 
from dw_analyst.dw_analyst_beacon_rider_event
where dt > get_date(-30)
and (unix_timestamp(arrive_rst_at)-unix_timestamp(arrive_rst_at_beacon))/60 > 30