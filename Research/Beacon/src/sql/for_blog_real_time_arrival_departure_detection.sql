---- For blog "Real-Time Arrival Departure Detection"
---- Yi Ding
---- 02/04/18

---- Number of beacons heard histgram
drop table if exists temp.temp_beacons_heard_30_days_with_timestamp;
create table temp.temp_beacons_heard_30_days_with_timestamp as
select t01.*
from (
	select * ,unix_timestamp(detected_at) as unix_timestamp, 
	int(unix_timestamp(detected_at)/120) as time_slot
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt >= get_date(-3)
) t01;

drop table if exists temp.temp_beacons_heard_30_days_within_120s;
create table temp.temp_beacons_heard_30_days_within_120s as
select t01.*
from (
	select rider_id, time_slot, count(distinct shop_id) as shop_cnt
	from temp.temp_beacons_heard_30_days_with_timestamp
	group by rider_id, time_slot
) t01;

drop table if exists temp.temp_beacons_heard_30_days_hist;
create table temp.temp_beacons_heard_30_days_hist as
select shop_cnt, count(1) as data_cnt
from temp.temp_beacons_heard_30_days_within_120s
group by shop_cnt;


---- Find a target rider for single shop detection
---- Make rider_beacon_data_order_cnt table
select * 
from (
	select rider_id, count(distinct shop_id) as shop_cnt, max(dt) as dt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt = get_date(-2)
	group by rider_id
) t01
join (
	select carrier_driver_id, count(distinct tracking_id) as order_cnt
	from dw.dw_tms_tb_tracking_event
	where dt = get_date(-1) and get_date(ocurred_time) = get_date(-2)
	group by carrier_driver_id
) t02
on t01.rider_id = t02.carrier_driver_id
join (
	select rider_id, count(1) as data_cnt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt = get_date(-2)
	group by rider_id
) t03
on t01.rider_id = t03.rider_id
order by t01.shop_cnt, t02.order_cnt

---- Download beacon data
select t01.* 
from (
	select * ,unix_timestamp(detected_at) as unix_timestamp
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > '2018-04-01' and rider_id = 10532902
) t01
join (
	select beacon_id from dw_analyst.dw_analyst_beacon_state_day
	where dt = '2018-04-01' and beacon_state = 20
) t02
on t01.beacon_id = t02.beacon_id
order by t01.detected_at
limit 30000

---- Download order data
select * from dw.dw_tms_tb_tracking_event
where dt = get_date(-1) and get_date(ocurred_time) > '2018-04-01'
and carrier_driver_id = 10532902
order by ocurred_time
limit 10000


---- Find a target rider
select rider_id, count(*) as data_cnt 
from dw_ai.dw_ai_clairvoyant_beacon
where dt = '2018-02-04'
group by rider_id
order by data_cnt desc
---- Actually, I found that riders found only considering data_cnt fails to show good performance in ground truth
---- Hence, I turned to found the riders whose behavior is more disciplined
select rider_id, count(*) order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-10)
and unix_timestamp(arrive_rst_at) = unix_timestamp(arrive_rst_at_beacon)
group by rider_id
order by order_cnt desc
---- From the above code we know 102081898 is best
---- then we try to get a suitable time slot
select t01.rider_id, t01.dt, t01.arrive_hour, t02.detect_hour, t01.order_cnt, t02.data_cnt
from(
select rider_id, dt, hour(arrive_rst_at) as arrive_hour, count(*) order_cnt
from dw_ai.dw_ai_beacon_tracking_event
where dt > get_date(-10) and rider_id = 102081898
and unix_timestamp(arrive_rst_at) = unix_timestamp(arrive_rst_at_beacon)
group by rider_id, dt, hour(arrive_rst_at)
) t01
join(
select rider_id, dt, hour(detected_at) as detect_hour, count(*) as data_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-10) and rider_id = 102081898
group by rider_id, dt, hour(detected_at)
) t02
on t01.rider_id = t02.rider_id and t01.dt = t02.dt and t01.arrive_hour = t02.detect_hour
--- From the above code we know that 2018-02-18 12:00:00 102081898 is a better choice

---- Extract the specific rider's beacon data in the specific day
select * , unix_timestamp(detected_at) as unix_timestamp
from dw_ai.dw_ai_clairvoyant_beacon
where dt = '2018-02-18' and rider_id = 102081898
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
where dt = '2018-02-20' and get_date(ocurred_time) = '2018-02-18'
and carrier_driver_id =102081898


---- Get distribution of RSSI
select rssi, count(*)
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-30)
group by rssi
order by rssi