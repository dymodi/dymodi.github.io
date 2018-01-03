# Basic Statistics
select get_date(created_at) as created_date, 
count (distinct id) as data_num,
count (distinct target_id) as rider_num,
count (distinct parse_json_object(beacon_info, 'beaconMinor')) as shop_num,
round((count (distinct id)/count (distinct target_id)),0)  as num_per_rider,
round((count (distinct id)/count (distinct parse_json_object(beacon_info, 'beaconMinor'))),0) as num_rider_per_shop,
round((count (distinct id)/count (distinct target_id)/count (distinct parse_json_object(beacon_info, 'beaconMinor'))),1) 
as num_per_rider_per_shop
from dw.dw_tms_clairvoyant_tb_beacon 
where dt = '2017-11-05' and created_at > '2017-10-30' 
and parse_json_object(beacon_info, 'beaconUuid') = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
and parse_json_object(beacon_info, 'beaconMajor') = 16160
group by get_date(created_at)
order by created_date


# Find bandwidth peak per minute
select max(t01.created_date),max(t01.data_cnt) as max_data_per_hour, max(t02.data_cnt) as max_data_per_minute, max(t03.data_cnt) as max_data_per_second
from 
(
select hour(created_at) as abs_hour, count(*) as data_cnt, max(get_date(created_at)), max(dt) as dt, get_date(max(created_at)) as created_date
from dw.dw_tms_clairvoyant_tb_beacon
where dt = '2017-11-05' and created_at > '2017-11-05' and created_at < '2017-11-06'
and parse_json_object(beacon_info, 'beaconUuid') = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
and parse_json_object(beacon_info, 'beaconMajor') = 16160
group by hour(created_at)
) t01 
join
(
select (hour(created_at)*60+minute(created_at)) as abs_minute, count(*) as data_cnt, max(get_date(created_at)), max(dt) as dt
from dw.dw_tms_clairvoyant_tb_beacon
where dt = '2017-11-05' and created_at > '2017-11-05' and created_at < '2017-11-06'
and parse_json_object(beacon_info, 'beaconUuid') = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
and parse_json_object(beacon_info, 'beaconMajor') = 16160
group by (hour(created_at)*60+minute(created_at))
) t02
join
(
select (hour(created_at)*3600+minute(created_at)*60+second(created_at)) as abs_second, count(*) as data_cnt, max(get_date(created_at)), 
max(dt) as dt
from dw.dw_tms_clairvoyant_tb_beacon
where dt = '2017-11-05' and created_at > '2017-11-05' and created_at < '2017-11-06'
and parse_json_object(beacon_info, 'beaconUuid') = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
and parse_json_object(beacon_info, 'beaconMajor') = 16160
group by (hour(created_at)*3600+minute(created_at)*60+second(created_at))
) t03
on t01.dt = t02.dt and t01.dt = t03.dt



# Find Extra Effort for talaris
select dt, count(*) as data_cnt, count(distinct taker_id) as rider_num,  round((count(*)/count(distinct taker_id)),0) as num_per_rider
from dw.dw_log_talaris_taker_location_day_inc
where dt > get_date(-8) and type = "TALARIS_TEAM" and parse_json_object(detail, 'location_type')=10
and get_date(record_time) = dt
group by dt
order by dt


# Find bandwidth peak for talaris
select t01.created_date, max(t01.data_cnt) as max_data_per_second
from
(
select record_time, count(*) as data_cnt, max(get_date(record_time)) as created_date
from dw.dw_log_talaris_taker_location_day_inc
where dt > get_date(-8) and type = "TALARIS_TEAM" and parse_json_object(detail, 'location_type')=10
group by record_time
)
t01
group by t01.created_date


select grid_id,grid_name,count(distinct retailer_id),count(distinct tracking_id) 
from dm.dm_tms_apollo_waybill_wide_detail 
where dt='2017-11-06' and tms_source_id=1 and tms_city_id=1 
group by grid_id,grid_name 
order by 3 desc;



---- Beacon deployment monitoring
INSERT overwrite TABLE dw_ai.dw_ai_beacon_grid_day partition(dt='${day}')
select grid_id, beacon_num_expected, beacon_num_deployed
from dw_ai.dw_ai_beacon_grid_day where dt = '${day-1d}';