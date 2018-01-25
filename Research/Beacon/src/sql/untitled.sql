

CREATE TABLE temp.temp_unstable_beacons (shop_id BIGINT);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (1011764);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (141854616);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (142457902);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (143932463);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (150031333);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (150156452);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (151708436);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (153399787);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (153399787);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (1541247);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (155136759);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (155291702);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (159474289);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (160933819);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (2037624);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (464815);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (539980);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (783444);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (934418);
INSERT INTO temp.temp_unstable_beacons (shop_id) VALUES (942394);



drop table if exists temp.temp_beacon_phase_iii_data_order_compare_5_days; 
create table temp.temp_beacon_phase_iii_data_order_compare_5_days as 
select (case when beacon_data.target_id is not null 
        then beacon_data.target_id else order_data.taker_id end) as taker_id, order_data.shop_id,
    beacon_data.hour as data_hour, beacon_data.data_cnt, order_data.hour as order_hour, 
    order_data.order_cnt, order_data.dt as order_dt, beacon_data.dt as data_dt
from (
	select rider_id as target_id, hour(detected_at) as hour, count(1) as data_cnt, max(dt) as dt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-5) and get_date(detected_at) > get_date(-5)
	group by rider_id,hour(detected_at)
) beacon_data
full outer join (
	select t01.taker_id, t01.ocurred_hour as hour, t01.restaurant_id as shop_id, 
	count(*) as order_cnt, max(t01.dt) as dt
	from (
		select carrier_driver_id as taker_id, platform_merchant_id as restaurant_id,
		hour(ocurred_time) as ocurred_hour, dt
		from dw.dw_tms_tb_tracking_event 
		where dt > get_date(-5) and get_date(ocurred_time) > get_date(-5)
		and shipping_state = 80
	) t01
	join (
		select rider_id as target_id, hour(detected_at) as hour, shop_id, max(dt) as max_dt
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt > get_date(-5) and get_date(detected_at) > get_date(-5)
		group by rider_id, shop_id, hour(detected_at) 
	) t03
	on t01.taker_id = t03.target_id and t01.restaurant_id = t03.shop_id 
	and t01.ocurred_hour = t03.hour and t01.dt = t03.max_dt
	group by t01.taker_id, t01.ocurred_hour, t01.restaurant_id
) order_data
on beacon_data.target_id = order_data.taker_id and beacon_data.hour = order_data.hour 
and beacon_data.dt = order_data.dt







select t01.shop_id from 
temp.temp_beacon_state_phase_iii t01,
temp.temp_beacon_state_phase_iii_1_day t02
where t01.shop_id = t02.shop_id 
and t01.state = 20 and t02.state = 40


select shop_id, dt, (count(*)) as 
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-10)


---- Check unstable beacon beacon data
drop table if exists temp.temp_beacon_unstable_beacon_data; 
create table temp.temp_beacon_unstable_beacon_data as
select t01.shop_id, t02.dt, t02.beacon_data_cnt
from (
	select *
	from temp.temp_unstable_beacons
) t01
join (
	select shop_id, dt, count(*) as beacon_data_cnt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-10)
	group by shop_id, dt
) t02
on t01.shop_id = t02.shop_id;

---- Check unstable beacon order data
drop table if exists temp.temp_beacon_unstable_order_data; 
create table temp.temp_beacon_unstable_order_data as
select t01.shop_id, t03.dt, t03.order_data_cnt
from (
	select *
	from temp.temp_unstable_beacons
) t01
join (
	select restaurant_id, dt, count(*) as order_data_cnt
	from dm.dm_tms_apollo_waybill_wide_detail
	where dt > get_date(-10)
	group by restaurant_id, dt
) t03
on t01.shop_id = t03.restaurant_id;


---- Join two tables to compare beacon data and order data
select (case when t02.shop_id is not null then t02.shop_id else t01.shop_id end) as shop_id,
	(case when t02.dt is not null then t02.dt else t01.dt end) as dt,
	 t01.beacon_data_cnt, t02.order_data_cnt from
(
	select * from temp.temp_beacon_unstable_beacon_data
) t01
full outer join
(
	select * from temp.temp_beacon_unstable_order_data
) t02
on t01.shop_id = t02.shop_id and t01.dt = t02.dt
order by shop_id, dt




---- 看每天Beacon数量
	select dt, count(distinct beacon_id) as deployed_beacon_num
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-15)
	group by dt



---- 查24个不稳定beacon的信号情况和订单情况
select * from
(
	select * from temp.temp_beacon_state_phase_iii
	where state = 
) t01
join (
	select * from dw_ai.dw_ai_clairvoyant_beacon
) t02
on  t01



---- 挑出失效 Beacon 所在商户名，让供应商去查
select t02.shop_id, t02.shop_name from 
(
	select * from temp.temp_beacon_state_phase_iii
	where state = 40
) t01
join (
	select * from dm.dm_prd_shop_wide
	where dt =get_date(-1)
) t02
on t01.shop_id = t02.shop_id
	



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