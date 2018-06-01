

---- 找出嫌疑较高的POI
select t01.distance, t01.shop_id_1, t02.shop_name as shop_name_1, 
t02.shop_latitude as shop_latitude_1, t02.shop_longitude as shop_longitude_1,
t01.shop_id_2, t03.shop_name as shop_name_2, 
t03.shop_latitude as shop_latitude_2, t03.shop_longitude as shop_longitude_2
from (
select *
from dw_analyst.dw_analyst_beacon_exception_shop_day 
where dt = '2018-01-31'
) t01
join (
select shop_id, shop_name, shop_latitude, shop_longitude
from dm.dm_prd_shop_wide
where dt = get_date(-1)
) t02
on t01.shop_id_1 = t02.shop_id
join (
select shop_id, shop_name, shop_latitude, shop_longitude
from dm.dm_prd_shop_wide
where dt = get_date(-1)
) t03
on t01.shop_id_2 = t03.shop_id
order by t01.distance desc

---- 找出嫌疑较高的POI
select t01.shop_id_1 as shop_id, count(*) as shop_cnt, max(t02.shop_name), 
max(t02.shop_latitude), max(t02.shop_longitude)
from (
select shop_id_1 
from dw_analyst.dw_analyst_beacon_exception_shop_day 
where dt > get_date(-10) and distance > 0.3
union all
select shop_id_2
from dw_analyst.dw_analyst_beacon_exception_shop_day 
where dt > get_date(-10) and distance > 0.3
) t01
join (
select shop_id, shop_name, shop_latitude, shop_longitude
from dm.dm_prd_shop_wide
where dt = get_date(-1)
) t02
on t01.shop_id_1 = t02.shop_id
group by t01.shop_id_1
order by shop_cnt desc