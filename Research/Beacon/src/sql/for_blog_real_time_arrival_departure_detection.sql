---- For blog "Real-Time Arrival Departure Detection"
---- Yi Ding
---- 02/04/18


---- Find a target rider
select rider_id, count(*) as data_cnt 
from dw_ai.dw_ai_clairvoyant_beacon
where dt = '2018-02-04'
group by rider_id
order by data_cnt desc

---- Find rider '100556090'

---- Extract the specific rider's beacon data in the specific day
select * , unix_timestamp(detected_at) as unix_timestamp
from dw_ai.dw_ai_clairvoyant_beacon
where dt = '2018-02-04' and rider_id = 100556090
order by detected_at
limit 50000

---- Extract the specific rider's beacon data at specific shop in the specific day
select * ,unix_timestamp(detected_at) as unix_timestamp
from dw_ai.dw_ai_clairvoyant_beacon
where dt = '2018-02-04' and rider_id = 100556090 and shop_id = 147525716
order by detected_at
limit 30000

---- Save data to local for further analysis with Python

---- Get two shops that have most orders in the past 30 days
select shop_id, count(*) as order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-30)
group by shop_id
order by order_cnt desc


---- Get rssi value when rider label himself as pickup
---- select t01.rider_id, t02.rssi, t01.pickup_at, t02.detected_at
select t02.rssi, count(*)
from (
select * from 
dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-30)
) t01
join ( 
select * from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-30)
) t02
on t01.dt = t02.dt and t01.rider_id = t02.rider_id and t01.shop_id = t02.shop_id
where unix_timestamp(t01.pickup_at) - unix_timestamp(t02.detected_at) < 2
and unix_timestamp(t01.pickup_at) - unix_timestamp(t02.detected_at) > -2
and t01.shop_id = 157943226
group by t02.rssi
order by t02.rssi


---- Get the ground-truth of the rider's in shop detection
select * from dw.dw_tms_tb_tracking_event
where dt = '2018-02-20' and get_date(ocurred_time) = '2018-02-04'
and carrier_driver_id =100556090