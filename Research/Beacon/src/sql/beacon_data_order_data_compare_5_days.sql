---- Compare rider beacon data and order data to solve "order without data" problem

---- drop table if exists temp.temp_beacon_phase_iii_data_order_compare; 
---- create table temp.temp_beacon_phase_iii_data_order_compare as 
INSERT overwrite TABLE dw_analyst.dw_analyst_beacon_data_order_data_compare_day partition(dt='${day}')
select (case when beacon_data.target_id is not null 
        then beacon_data.target_id else order_data.taker_id end) as taker_id, order_data.shop_id,
    beacon_data.hour as data_hour, beacon_data.data_cnt, order_data.hour as order_hour, 
    order_data.order_cnt, order_data.dt as order_dt, beacon_data.dt as data_dt
from (
	select rider_id as target_id, dt, hour(detected_at) as hour, count(*) as data_cnt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-1) and get_date(detected_at) > get_date(-1)
	group by rider_id, dt,hour(detected_at)
) beacon_data
full outer join (
	select t01.taker_id, t01.dt as dt, t01.ocurred_hour as hour, t01.restaurant_id as shop_id, 
	count(*) as order_cnt
	from (
		select carrier_driver_id as taker_id, platform_merchant_id as restaurant_id,
		hour(ocurred_time) as ocurred_hour, dt
		from dw.dw_tms_tb_tracking_event 
		where dt > get_date(-1) and get_date(ocurred_time) > get_date(-1)
		and shipping_state = 80
	) t01
	join (
		select rider_id as target_id, dt, shop_id, hour(detected_at) as hour
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt > get_date(-1) and get_date(detected_at) > get_date(-1)
		group by rider_id, dt, shop_id, hour(detected_at) 
	) t03
	on t01.taker_id = t03.target_id and t01.restaurant_id = t03.shop_id 
	and t01.ocurred_hour = t03.hour and t01.dt = t03.dt
	group by t01.taker_id, t01.dt, t01.ocurred_hour, t01.restaurant_id
) order_data
on beacon_data.target_id = order_data.taker_id and beacon_data.hour = order_data.hour 
and beacon_data.dt = order_data.dt