---- merchant mobility pattern

drop table if exists temp.temp_merchant_gps_diff;
create table temp.temp_merchant_gps_diff as
select *, LEAD (latitude_gps, 1) OVER (PARTITION by beacon_id ORDER BY phone_time) - latitude_gps as latitude_diff
from dw_ai.dw_ai_merchant_virtualbeacon_info
where dt > get_date(-8) and longitude_gps is not null and longitude_gps > 0.1


---- 找一些GPS跨度大的商户轨迹
---- 后续画图在merchant_info.ipynb里
select t1.* 
from (
	select beacon_id, latitude_gps, longitude_gps, latitude, longitude, phone_time, dt
	from dw_ai.dw_ai_merchant_virtualbeacon_info
	where dt = get_date(-1) and longitude_gps is not null and longitude_gps > 0.1
) t1
join (
	select beacon_id
	from temp.temp_merchant_gps_diff
	where latitude_diff > 0.01 or latitude_diff < -0.01
) t2
on t1.beacon_id = t2.beacon_id
order by t1.beacon_id, t1.phone_time
limit 5000



