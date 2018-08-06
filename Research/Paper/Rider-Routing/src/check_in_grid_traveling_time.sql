---- check 在同一grid内的所需时间的分布


---- 联表，搭上首尾点的grid_id
drop table if exists temp.temp_yiding_in_grid_trips;
create table temp.temp_yiding_in_grid_trips as
select t01.*, t02.delivery_grid_id as from_grid, t03.delivery_grid_id as to_grid
from(
	select * 
	from dw_analyst.dw_analyst_yiding_tracking_trip_with_tag
	where dt = get_date(-1)
	and from_shipping_state = 30 and to_shipping_state = 80
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