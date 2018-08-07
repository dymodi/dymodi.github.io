---- check 在同一grid内的所需时间的分布


---- 把同一grid的trip取出来
drop table if exists temp.temp_yiding_in_grid_trips;
create table temp.temp_yiding_in_grid_trips as
select t01.*, t02.delivery_grid_id as from_grid, t03.delivery_grid_id as to_grid
from(
	select * 
	from dw_analyst.dw_analyst_yiding_tracking_trip_with_tag
	where dt > get_date(-10)
	and from_shipping_state = 30 and to_shipping_state = 80
	and distance_km > 0.001
) t01
join (
	select shop_id, delivery_grid_id
	from dm.dm_prd_shop_wide
	where dt = get_date(-1)
) t02
on t01.from_shop = t02.shop_id
join (
	select shop_id, delivery_grid_id
	from dm.dm_prd_shop_wide
	where dt = get_date(-1)
) t03
on t01.to_shop = t03.shop_id
where t02.delivery_grid_id = t03.delivery_grid_id;


---- 把不同同grid的trip取出来
drop table if exists temp.temp_yiding_out_grid_trips;
create table temp.temp_yiding_out_grid_trips as
select t01.*, t02.delivery_grid_id as from_grid, t03.delivery_grid_id as to_grid
from(
	select * 
	from dw_analyst.dw_analyst_yiding_tracking_trip_with_tag
	where dt > get_date(-10)
	and from_shipping_state = 30 and to_shipping_state = 80
	and distance_km > 0.001
) t01
join (
	select shop_id, delivery_grid_id
	from dm.dm_prd_shop_wide
	where dt = get_date(-1)
) t02
on t01.from_shop = t02.shop_id
join (
	select shop_id, delivery_grid_id
	from dm.dm_prd_shop_wide
	where dt = get_date(-1)
) t03
on t01.to_shop = t03.shop_id
where t02.delivery_grid_id <> t03.delivery_grid_id;

---- 找一个多的grid
select from_grid, count(1) as data_cnt
from temp.temp_yiding_in_grid_trips
group by from_grid
order by data_cnt desc

select from_grid, count(1) as data_cnt
from temp.temp_yiding_out_grid_trips
group by from_grid
order by data_cnt desc


---- 看分布
select round(time_seconds,0) as time_seconds, count(*) as count
from temp.temp_yiding_in_grid_trips
where from_grid = 4065
group by round(time_seconds,0)
order by time_seconds