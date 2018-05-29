---- 这里面是给老板提供数据和图可能用到的sql


-----------------------------------------------------------------------------------------------
---- 下面的SQL是确定偏远商户订单量的
---- 看分子的骑手在接单的时候听到了几家店的单？
drop table if exists temp.temp_beacon_faraway_shop_orders;
create table temp.temp_beacon_faraway_shop_orders as
select t01.* 
from (
	select *
	from temp.tracking_heard_jdz_0315
) t01
join(select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt >= get_date(-7)
) t02
on t01.tracking_id = t02.tracking_id and t01.dt = t02.dt
join (
	select dt, rider_id, hour(detected_at) as detected_hour, count(1) as data_cnt
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt >= get_date(-7)
	group by dt, rider_id, hour(detected_at)
) t03
on t01.dt = t03.dt and t02.rider_id = t03.rider_id
and hour(t02.pickup_at) = t03.detected_hour
where t03.data_cnt = 1





-----------------------------------------------------------------------------------------------
---- 下面的SQL是用来算不同情况下的到店监测率的

---- 得到一个30天Beacon的清单
drop table if exists temp.temp_beacon_shops_heard_beacon_in_30_days;
create table temp.temp_beacon_shops_heard_beacon_in_30_days as
	select distinct shop_id
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-30)

---- 得到一个14天Beacon的清单
drop table if exists temp.temp_beacon_shops_heard_beacon_in_14_days;
create table temp.temp_beacon_shops_heard_beacon_in_14_days as
	select distinct shop_id
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-14)

---- 得到一个30天骑手的清单
drop table if exists temp.temp_beacon_riders_heard_beacon_in_30_days;
create table temp.temp_beacon_riders_heard_beacon_in_30_days as
	select distinct rider_id
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-30)

---- 骑手该小时内听到任意beacon视为正常骑手
---- 看过去7天数据
---- 相当于重新给个分母
drop table temp.temp_beacon_perfect_one_hour_rider_7_days;
create table temp.temp_beacon_perfect_one_hour_rider_7_days as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt >= get_date(-7)
) t01
join (
	select * 
	from temp.temp_beacon_shops_heard_beacon_in_14_days
) t02
on t01.shop_id = t02.shop_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt >= get_date(-7)
) t03
on t01.dt = t03.dt and t01.rider_id = t03.rider_id
and hour(t01.pickup_at) = hour(t03.detected_at)

---- 骑手3小时内听到任意beacon视为正常骑手
---- 看过去7天数据
---- 相当于重新给个分母
---- 只考虑iOS的数据
drop table temp.temp_beacon_perfect_three_hour_rider_7_days_ios;
create table temp.temp_beacon_perfect_three_hour_rider_7_days_ios as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt >= get_date(-7)
) t01
join (
	select * 
	from temp.temp_beacon_shops_heard_beacon_in_14_days
) t02
on t01.shop_id = t02.shop_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt >= get_date(-7) and parse_json_object(device_info, 'platform') = 1
) t03
on t01.dt = t03.dt and t01.rider_id = t03.rider_id
where (hour(t01.pickup_at) = hour(t03.detected_at) 
	or hour(t01.pickup_at) = hour(t03.detected_at) + 1 
	or hour(t01.pickup_at) = hour(t03.detected_at) - 1)

---- 骑手3小时内听到任意beacon视为正常骑手
---- 看过去7天数据
---- 相当于重新给个分母
---- 只考虑android的数据
drop table temp.temp_beacon_perfect_three_hour_rider_7_days_android;
create table temp.temp_beacon_perfect_three_hour_rider_7_days_android as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt >= get_date(-7)
) t01
join (
	select * 
	from temp.temp_beacon_shops_heard_beacon_in_14_days
) t02
on t01.shop_id = t02.shop_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt >= get_date(-7) and parse_json_object(device_info, 'platform') = 2
) t03
on t01.dt = t03.dt and t01.rider_id = t03.rider_id
where (hour(t01.pickup_at) = hour(t03.detected_at) 
	or hour(t01.pickup_at) = hour(t03.detected_at) + 1 
	or hour(t01.pickup_at) = hour(t03.detected_at) - 1)

---- 骑手该小时内听到任意beacon视为正常骑手
---- 看过去7天数据
---- 只考虑iOS的数据
---- 相当于重新给个分母
drop table temp.temp_beacon_perfect_one_hour_rider_7_days_ios;
create table temp.temp_beacon_perfect_one_hour_rider_7_days_ios as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt >= get_date(-7)
) t01
join (
	select * 
	from temp.temp_beacon_shops_heard_beacon_in_14_days
) t02
on t01.shop_id = t02.shop_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt >= get_date(-7) and parse_json_object(device_info, 'platform') = 1
) t03
on t01.dt = t03.dt and t01.rider_id = t03.rider_id
and hour(t01.pickup_at) = hour(t03.detected_at)

---- 骑手该小时内听到任意beacon视为正常骑手
---- 看过去7天数据
---- 只考虑Android的数据
---- 相当于重新给个分母
drop table temp.temp_beacon_perfect_one_hour_rider_7_days_android;
create table temp.temp_beacon_perfect_one_hour_rider_7_days_android as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt >= get_date(-7)
) t01
join (
	select * 
	from temp.temp_beacon_shops_heard_beacon_in_14_days
) t02
on t01.shop_id = t02.shop_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt >= get_date(-7) and parse_json_object(device_info, 'platform') = 2
) t03
on t01.dt = t03.dt and t01.rider_id = t03.rider_id
and hour(t01.pickup_at) = hour(t03.detected_at)


---- 骑手该小时内听到任意beacon视为正常骑手
---- 看过去10天数据
---- 相当于重新给个分母
drop table temp.temp_beacon_perfect_one_hour_rider_10_days;
create table temp.temp_beacon_perfect_one_hour_rider_10_days as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt >= get_date(-10)
) t01
join (
	select * 
	from temp.temp_beacon_shops_heard_beacon_in_14_days
) t02
on t01.shop_id = t02.shop_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt >= get_date(-10)
) t03
on t01.dt = t03.dt and t01.rider_id = t03.rider_id
and hour(t01.pickup_at) = hour(t03.detected_at)

---- 骑手当天听到任意beacon视为正常骑手
---- 看过去7天数据
---- 相当于分母
drop table temp.temp_beacon_perfect_one_day_rider_7_days;
create table temp.temp_beacon_perfect_one_day_rider_7_days as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt >= get_date(-7)
) t01
join (
	select * 
	from temp.temp_beacon_shops_heard_beacon_in_14_days
) t02
on t01.shop_id = t02.shop_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt >= get_date(-7)
) t03
on t01.dt = t03.dt and t01.rider_id = t03.rider_id

---- 算一个每小时的单perfect shop的到店监测率
---- 相当于重新给个分母
drop table temp.temp_beacon_perfect_one_hour_shop;
create table temp.temp_beacon_perfect_one_hour_shop as
select t01.* 
from (
	select *
	from dw_ai.dw_ai_beacon_tracking_day
	where dt > get_date(-7)
) t01
join (
	select * 
	from temp.temp_beacon_riders_heard_beacon_in_30_days
) t02
on t01.rider_id = t02.rider_id
join (
	select *
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-7)
) t03
on t01.dt = t03.dt and t01.shop_id = t03.shop_id
and hour(t01.pickup_at) = hour(t03.detected_at)



------------------------------------------------------------------------------------------------
---- 下面的SQL是画PDF要用的
---- 画老板要求的PDF
drop table if exists temp.temp_beacon_perfect_rider_shop_pdf;
create table temp.temp_beacon_perfect_rider_shop_pdf as 
select t01.order_cnt as perfect_order_cnt, t02.order_cnt as should_order_cnt, 
float(t01.order_cnt/t02.order_cnt) as percent
from (
	select shop_id, count(distinct tracking_id) as order_cnt
	from dw_ai.dw_ai_beacon_tracking_event
	where dt > get_date(-7)
	group by shop_id
) t01
right join(
	select shop_id, count(distinct tracking_id) as order_cnt
	from dw_ai.dw_ai_beacon_perfect_rider_tracking_day
	where dt > get_date(-7)
	group by shop_id
)t02
on t01.shop_id = t02.shop_id;


select round(percent,2) as bucket, count(1) as cnt
from temp.temp_beacon_perfect_rider_shop_pdf
group by round(percent,2)
order by bucket


---- 画老板要求的PDF
drop table if exists temp.temp_beacon_perfect_rider_rider_pdf;
create table temp.temp_beacon_perfect_rider_rider_pdf as 
select t01.order_cnt as perfect_order_cnt, t02.order_cnt as should_order_cnt, 
float(t01.order_cnt/t02.order_cnt) as percent
from (
	select rider_id, count(distinct tracking_id) as order_cnt
	from dw_ai.dw_ai_beacon_tracking_event
	where dt > get_date(-7)
	group by rider_id
) t01
right join(
	select rider_id, count(distinct tracking_id) as order_cnt
	from dw_ai.dw_ai_beacon_perfect_rider_tracking_day
	where dt > get_date(-7)
	group by rider_id
)t02
on t01.rider_id = t02.rider_id;

select round(percent,2) as bucket, count(1) as cnt
from temp.temp_beacon_perfect_rider_rider_pdf
group by round(percent,2)
order by bucket
