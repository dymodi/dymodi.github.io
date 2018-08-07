====step:1====
#获取物流餐厅对应的网格
drop table if exists temp.temp_dm_prd_restaurant_grid_mapping_01;
create table temp.temp_dm_prd_restaurant_grid_mapping_01 as
select
 t03.id grid_id
,t03.grid_name
,t03.area
,t01.id restaurant_id
,t01.name restaurant_name
,t01.longitude restaurant_longitude
,t01.latitude restaurant_latitude
,t03.city_id
,t01.is_valid
,get_point_distance(t03.latitude,t03.longitude, t01.latitude,t01.longitude) distance
from 
(select * from dw.dw_prd_restaurant where dt='${day}') t01
left join (select
y.*
from (
select *,row_number() over (partition by walle_id order by updated_at desc) rn  
from 
(select * from dw.dw_tms_prd_retailer_grid_new where dt='${day}' and is_valid=1) x
) y where y.rn=1) t02
on t01.id=t02.walle_id
left join (select id,coalesce(grid_name,'未知') grid_name,coalesce(area,-1) area,cast(split(center,',')[0] as double) latitude,cast(split(center,',')[1] as double) longitude,city_id from dw.dw_tms_edutuandui_meepo_grid_info where dt='${day}' and is_active=1 ) t03
on t02.grid_id=t03.id;


====step:1====
#计算网格覆盖区域的json
drop table if exists temp.temp_dm_prd_restaurant_grid_mapping_02;
create table temp.temp_dm_prd_restaurant_grid_mapping_02 as
select
 q01.grid_id
,q01.city_id
,q01.polygon
,cast(split(q02.center,',')[0] as double) latitude
,cast(split(q02.center,',')[1] as double) longitude
from 
(
select
 p01.grid_id
,p01.city_id
,concat('{"polygon":[',concat_ws(',',collect_set(p01.points)),']}') polygon
from(
select 
 t01.id grid_id
,t01.city_id
,concat('{"lng":',split(point,',')[1],',"lat":',split(point,',')[0],'}') points
from 
(select id,city_id,split(polygon,'\073') points from dw.dw_tms_edutuandui_meepo_grid_info where dt='${day}' and is_active=1) t01
lateral view explode(t01.points) point as point
)p01 group by p01.grid_id,p01.city_id
)q01
left join (select * from dw.dw_tms_edutuandui_meepo_grid_info where dt='${day}' and is_active=1) q02
on q01.grid_id=q02.id
;

====step:2====
#匹配物流没有的餐厅所在的网格
drop table if exists temp.temp_dm_prd_restaurant_grid_mapping_03;
create table temp.temp_dm_prd_restaurant_grid_mapping_03 as
select
 t01.restaurant_id
,t02.grid_id
,cross_status(t01.geohash,t02.pts,t02.rect) cross_status
,get_point_distance(t01.restaurant_latitude,t01.restaurant_longitude, t02.latitude,t02.longitude) distance
from (
select restaurant_id,cast (trans_geohash(geohash_of_latlng(restaurant_latitude,restaurant_longitude)) as bigint) geohash, geohash_of_latlng(restaurant_latitude,restaurant_longitude) restaurant_geohash,city_id,restaurant_latitude,restaurant_longitude
from temp.temp_dm_prd_restaurant_grid_mapping_01 where grid_id is null
) t01
join (select grid_id,city_id,gis_out_rect(polygon, 1) rect,gis_polygon_vertex(polygon, 1) pts,latitude,longitude,geohash_of_latlng(latitude,longitude) grid_geohash from temp.temp_dm_prd_restaurant_grid_mapping_02) t02
on substring(t01.restaurant_geohash,0,4)=substring(t02.grid_geohash,0,4);