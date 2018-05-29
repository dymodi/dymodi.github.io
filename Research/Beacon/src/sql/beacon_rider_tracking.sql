---- 不考虑RSSI阈值和清楚重复单
---- 看下骑手到店监测的比例

---- Find the delivery orders from beacon shop and beacon riders
 drop table if exists temp.temp_rider_event_jdz_0312; 
 create table temp.temp_rider_event_jdz_0312 as 
 	select rider_event.tracking_id, 
 	rider_event.platform_merchant_id as shop_id, 
 	rider_event.rider_id, 
 	rider_event.accept_at, 
 	rider_event.arrive_rst_at, 
 	rider_event.pickup_at, 
 	rider_event.deliver_at, 
 	rider_event.accept_latitude, 
 	rider_event.accept_longitude, 
 	rider_event.arrive_rst_latitude, 
 	rider_event.arrive_rst_longitude, 
 	rider_event.pickup_latitude, 
 	rider_event.pickup_longitude, 
 	rider_event.deliver_latitude, 
 	rider_event.deliver_longitude, 
 	rider_event.dt 
 	from (
 	 select t20.tracking_id, 
 	 	t20.platform_merchant_id, 
 	 	t20.carrier_driver_id as rider_id, 
 	 	t20.ocurred_time as accept_at, 
 		t80.ocurred_time as arrive_rst_at, 
 		t30.ocurred_time as pickup_at, 
 		t40.ocurred_time as deliver_at, 
 		t20.latitude as accept_latitude, 
 		t20.longitude as accept_longitude, 
 		t80.latitude as arrive_rst_latitude, 
 		t80.longitude as arrive_rst_longitude, 
 		t30.latitude as pickup_latitude, 
 		t30.longitude as pickup_longitude, 
 		t40.latitude as deliver_latitude, 
 		t40.longitude as deliver_longitude, 
 		t20.dt 
 		from ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = get_date(-2) 
 				and get_date(ocurred_time) = get_date(-2) 
 				and shipping_state = 20 ) t20 
 		join ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = get_date(-2) 
 				and get_date(ocurred_time) = get_date(-2) 
 				and shipping_state = 30 ) t30 
 		on t20.tracking_id = t30.tracking_id 
 			and t20.carrier_driver_id = t30.carrier_driver_id 
 		join ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = get_date(-2) 
 				and get_date(ocurred_time) = get_date(-2) 
 				and shipping_state = 80 ) t80 
 		on t20.tracking_id = t80.tracking_id 
 			and t20.carrier_driver_id = t80.carrier_driver_id 
 		join ( select * from dw.dw_tms_tb_tracking_event 
 			where dt = get_date(-2) 
 				and get_date(ocurred_time) = get_date(-2) 
 				and shipping_state = 40 ) t40 
 		on t20.tracking_id = t40.tracking_id 
 		and t20.carrier_driver_id = t40.carrier_driver_id 
 		) rider_event 
 	join( select distinct shop_id from dw_ai.dw_ai_clairvoyant_beacon where dt = get_date(-2) ) t04 
 	on rider_event.platform_merchant_id = t04.shop_id 
 	join( select distinct rider_id from dw_ai.dw_ai_clairvoyant_beacon where dt = get_date(-2) ) t05 
 	on rider_event.rider_id = t05.rider_id;
 
 ---- 根据每个event的时间窗来找beaocn时间戳 
 ---- drop table if exists temp.temp_beacon_rider_event; 
 ---- create table temp.temp_beacon_rider_event as 
 drop table if exists temp.temp_beacon_rider_event_jdz_0312; 
 create table temp.temp_beacon_rider_event_jdz_0312 as 
 select 
 	t01.tracking_id, 
 	max(t01.shop_id) as shop_id, 
 	max(t01.rider_id) as rider_id, 
 	max(t01.accept_at) as accept_at, 
 	min(t02.detected_at) as arrive_rst_at_beacon, 
 	max(t01.arrive_rst_at) as arrive_rst_at, 
 	max(t01.pickup_at) as pickup_at, 
 	max(t02.detected_at) as leave_rst_at_beacon, 
 	max(t01.deliver_at) as deliver_at, 
 	max(t01.arrive_rst_longitude) as arrive_rst_longitude, 
 	max(t01.arrive_rst_latitude) as arrive_rst_latitude, 
 	max(t01.pickup_longitude) as pickup_longitude, 
 	max(t01.pickup_latitude) as pickup_latitude 
 from temp.temp_rider_event_jdz t01 
 join ( select * from dw_ai.dw_ai_clairvoyant_beacon where dt = get_date(-2)) t02 
 on t01.rider_id = t02.rider_id 
 	and t01.shop_id=t02.shop_id 
 where t02.detected_at > t01.accept_at 
 	and t02.detected_at < t01.deliver_at 
 group by t01.tracking_id;

 ---- INSERT overwrite TABLE dw_ai.dw_ai_beacon_tracking_event partition(dt=get_date(-2)) 
 Drop table if exists temp.temp_beacon_tracking_event_jdz_0312;
 Create table temp.temp_beacon_tracking_event_jdz_0312 as 
 select t1.tracking_id as tracking_id, 
 	t1.shop_id as shop_id, 
 	t1.rider_id as rider_id, 
 	t1.accept_at as accept_at, 
 	t1.arrive_rst_at_beacon as arrive_rst_at_beacon, 
 	t1.arrive_rst_at as arrive_rst_at, 
 	t1.pickup_at as pickup_at, 
 	t1.leave_rst_at_beacon as leave_rst_at_beacon, 
 	t1.deliver_at as deliver_at,  
 	get_point_distance(t2.shop_latitude,t2.shop_longitude, 
 		t1.arrive_rst_latitude, t1.arrive_rst_longitude) as arrive_dist_gps, 
 	get_point_distance(t2.shop_latitude,t2.shop_longitude, 
 		t1.pickup_latitude, t1.pickup_longitude) as pickup_dist_gps 
 from temp.temp_beacon_rider_event_jdz t1, dm.dm_prd_shop_wide t2 
 where t2.dt=get_date(-2)
 	and t1.shop_id=cast(t2.shop_id as string); 

