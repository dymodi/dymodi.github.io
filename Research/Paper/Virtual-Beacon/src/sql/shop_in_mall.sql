

---- 连表得到mall和shop的信息
drop table if exists temp.temp_yiding_mall_shop;
create table temp.temp_yiding_mall_shop as
select t01.mall_id, t01.restaurant_id, t02.mall_latitude, t02.mall_longitude, 
t03.shop_latitude, t03.shop_longitude, 
get_point_distance(t02.mall_latitude, t02.mall_longitude, t03.shop_latitude, t03.shop_longitude) as distance
from 
dw.dw_prd_napos_restaurant_mall t01,
dm.dm_prd_mall t02,
dm.dm_prd_shop_wide t03
where t01.dt = get_date(-1)
and t01.restaurant_id is not null
and t02.dt = get_date(-1)
and t03.dt = get_date(-1)
and t03.is_shop_valid = 1
and t01.mall_id = t02.mall_id
and t01.restaurant_id = t03.shop_id;


---- 得到distance的统计信息
select round(distance,1) as bucket, count(*) as count
from temp.temp_yiding_mall_shop
group by round(distance,1)
order by bucket


---- 联表判断已开Beacon的店里有多少是商场商户
select t01.dt, count(distinct t01.shop_id) shop_has_virtual_beacon,
count(distinct t03.shop_id) shop_in_mall_cnt
from (
	select shop_id, dt 
	from dw_ai.dw_ai_merchant_virtualbeacon_info
	where dt > get_date(-8)
) t01
join (
	select restaurant_id, dt
	from dw.dw_prd_napos_restaurant_mall
	where dt > get_date(-8)
	and is_valid = 1 and mall_id is not null
) t02
on t01.shop_id = t02.restaurant_id and t01.dt = t02.dt
join (
	select shop_id, dt
	from dw_ai.dw_ai_merchant_virtualbeacon_info
	where dt > get_date(-8)
) t03
on t01.dt = t03.dt
group by t01.dt
order by t01.dt



---- 另一个带mall的字段
select * 
from dm.dm_prd_shop_wide
where dt = get_date(-1)
and is_mall


---- 找一批近铁商户作为test set的室内商户
select t01.shop_id
from dm.dm_prd_shop_wide t01,
dw.dw_prd_napos_restaurant_mall t02
where t01.dt = get_date(-1)
and t02.dt = get_date(-2)
and t02.is_valid = 1
and t02.mall_id is not null
and t01.city_id = 1
and t01.shop_name like "%近铁%"
and t01.is_valid = 1
and t01.shop_id = t02.restaurant_id




---- 找一批名字里不带
and t01.shop_name not like "%(%)%"
and t01.shop_name not like "%（%）%"
and t01.shop_name not like "%(%）%"
and t01.shop_name not like "%（%)%"
