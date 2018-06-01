---- 骑手基于Beacon的定位和基于GPS的定位比较

---- dw_analyst.dw_analyst_beacon_rider_drifting
---- 建表详情可见titan相关

---- 找一个合适的商户来画图
---- 去掉黑名单里的骑手
select t01.beacon_shop_id, count(*) as drifting_data_cnt 
from (
	select *
	from dw_analyst.dw_analyst_beacon_rider_drifting
	where dt > get_date(-10)
) t01
full outer join (
	select rider_id from temp.temp_beacon_rider_black_list
) t02
on t01.taker_id = t02.rider_id
where t02.rider_id is null
group by t01.beacon_shop_id
order by drifting_data_cnt desc
---- 得到 shop_id = 1778360 不错

---- 不去黑名单里的骑手
select beacon_shop_id, count(*) as drifting_data_cnt 
from dw_analyst.dw_analyst_beacon_rider_drifting
where dt > get_date(-10)
group by beacon_shop_id
order by drifting_data_cnt desc

---- 给定商户取漂移数据
select t01.* 
from (
	select *
	from dw_analyst.dw_analyst_beacon_rider_drifting
	where dt > get_date(-10)
	and beacon_shop_id = 1778360 and distance > 0.03
) t01
full outer join (
	select rider_id from temp.temp_beacon_rider_black_list
) t02
on t01.taker_id = t02.rider_id
where t02.rider_id is null







---- 骑手漂移直方图
select int(distance) as distance, count(*) as data_cnt
from dw_analyst.dw_analyst_beacon_rider_drifting
where dt > get_date(-30) and int(distance) >= 0
group by int(distance)
order by int(distance)

---- 统计口径之骑手数？
select count(distinct taker_id) as taker_cnt
from dw_analyst.dw_analyst_beacon_rider_drifting
where dt > get_date(-30)

---- 有多少打点超过500m？
select count(*) as data_cnt
from dw_analyst.dw_analyst_beacon_rider_drifting
where dt > get_date(-30) and distance > 0.5

---- 有些骑手漂移超过阈值？
select *
from dw_analyst.dw_analyst_beacon_rider_drifting
where dt > get_date(-30) and distance > 1

---- 关注特定商户的漂移数据
select *
from dw_analyst.dw_analyst_beacon_rider_drifting
where dt > get_date(-30) and distance > 1
and beacon_shop_id = 155307294

---- 这些骑手有没有异地登陆？
select *
from dw.dw_tms_clair_gateway_tb_login
where dt = get_date(-1)
and target_id = 10231411

---- 给定骑手id和时间，反查千里眼轨迹
select * 
from dw.dw_log_talaris_taker_location_day_inc
where taker_id = 10231411
and record_time > '2018-02-18 20:25:00'
and record_time < '2018-02-18 20:50:00'
and dt = '2018-02-18'