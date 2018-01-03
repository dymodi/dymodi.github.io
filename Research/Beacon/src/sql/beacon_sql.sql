

select target_id, created_at, 
max(parse_json_object(device_info, 'platform')) as platform,
max(parse_json_object(device_info, 'appVersion')) as appVersion,
count(*) as data_cnt 
from dw.dw_tms_clairvoyant_tb_beacon 
where dt = get_date(-1) and created_at > get_date(-30)
and parse_json_object(beacon_info, 'beaconUuid') = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"
and parse_json_object(beacon_info, 'beaconRssi') <> 0
group by target_id,created_at
order by data_cnt desc




# Beacon数据库里的骑手所在城市
select get_date(t01.created_at) as create_date, count(*) as data_cnt
from (
	select * from dw.dw_tms_clairvoyant_tb_beacon where dt = get_date(-1) and created_at > get_date(-20)
) t01
join (
	select * from dm.dm_tms_courier_base 
	where dt = get_date(-1) and city_id <> 1 and city_id <> 11
) t02
on t01.target_id = t02.courier_id
group by get_date(t01.created_at)
order by create_date


# iOS是否存在0dB的情况
select * from dw.dw_tms_clairvoyant_tb_beacon 
where dt = get_date(-1) and created_at > get_date(-1) and parse_json_object(device_info, 'platform') = 1



# 建立beacon的店铺和zs，rs的minor的对应关系
drop table if exists temp.beacon_map;
create table temp.beacon_map
	as
	select t03.building_id, t05.shop_name, t05.shop_address, zs_minor, rs_minor from 
	(
		select t01.building_id, max(t01.minor) zs_minor
		from (
			select building_id, minor
			from dw.dw_tms_clairvoyant_tb_beacon_location
			where major = 16160 and dt = get_date(-1)
		) t01
		group by t01.building_id
	) t03
	join
	(
		select t02.building_id, max(t02.minor) rs_minor
		from (
			select building_id, minor
			from dw.dw_tms_clairvoyant_tb_beacon_location
			where major = 16161 and dt = get_date(-1)
		) t02
		group by t02.building_id
	) t04
	on t03.building_id = t04.building_id
	join
	(
		select shop_id, shop_name, shop_address
		from dm.dm_prd_shop_wide
		where dt = get_date(-1)
	) t05
	on t03.building_id = t05.shop_id

	

# 查各个店铺的beacon的数据量
select t01.building_id, t01.shop_name, t01.shop_address, t01.zs_minor,t02.zs_count, t01.rs_minor, t03.rs_count
from 
(
	select *
	from temp.beacon_map
) t01
join
(
	select get_json_object(beacon_info, '$.beaconMinor') as minor, count(*) as zs_count
	from dw.dw_tms_clairvoyant_tb_beacon
	where dt = get_date(-1)
	group by get_json_object(beacon_info, '$.beaconMinor')
) t02
on t01.zs_minor = t02.minor
join
(
	select get_json_object(beacon_info, '$.beaconMinor') as minor, count(*) as rs_count
	from dw.dw_tms_clairvoyant_tb_beacon
	where dt = get_date(-1)
	group by get_json_object(beacon_info, '$.beaconMinor')
) t03
on t01.rs_minor = t03.minor



# PhaseII 建立三个表的关系
drop table if exists temp.beacon_rider_order_review_0912;
create table temp.beacon_rider_order_review_0914
as
select t01.taker_id, t02.restaurant_id, max(t02.restaurant_name),max(t02.grid_name) restaurant_name,
count(case when t02.shipping_state=40 and t02.is_valid=1 then t02.tracking_id end) order_cnt, max(t02.dt) dt
from 
(select taker_id
from dw.dw_log_talaris_taker_location_day_inc 
as talaris_taker where dt >=  get_date(-3) and dt <= get_date(-1) and type = 'TALARIS_TEAM' 
and get_json_object(detail, '$.location_type')=10 
group by taker_id
) t01
join 
(select * from dm.dm_tms_apollo_waybill_wide_detail where dt=get_date(-1) 
) t02
on t01.taker_id=t02.taker_id
join 
(select distinct building_id from dw.dw_tms_clairvoyant_tb_beacon_location where dt=get_date(-1) 
) t03
on t02.restaurant_id=t03.building_id
group by t01.taker_id,t02.restaurant_id
;

# Phase I 查有beacon的店铺对应的骑手单数
drop table if exists temp.ins_rider_order_review_0911;
create table temp.ins_rider_order_review_0910
as
select t01.user_id, t02.shop_id, max(t02.shop_name) shop_name, max(t02.station_name) station_name,
count(distinct case when t02.status_code = 80 then t02.id end) order_cnt, max(t02.dt) dt
from
(select user_id
from dw.dw_tms_interstellar_ins_beacon_data_hour 
where dt = get_date(-1) and hour = 12 and created_at > "2017-09-10 06:00:00" and created_at < "2017-09-10 23:00:00"
group by user_id
) t01
join
(select * from dw.dw_tms_interstellar_ins_order 
where dt = get_date(-2) and created_at > "2017-09-10 06:00:00" and created_at < "2017-09-10 23:00:00"
) t02
on t01.user_id = t02.taker_id
group by t01.user_id, t02.shop_id


# 对比zs和rs的beacon
drop table if exists temp.beacon_compare;
create table temp.beacon_compare
as
select distinct(t01.building_id), count(t03.id), count(t04.id)
from
(select building_id,
)

# 按小时列出所有原始数据
select hour(created_at),count(1) 
from dw.dw_tms_clairvoyant_tb_beacon 
where dt='2017-09-08' and get_date(created_at)='2017-09-08' 
group by hour(created_at) 
order by 1 desc;

# 按小时列出所有骑手的所有原始数据
select target_id,hour(created_at) as hour, count(1) as data_cnt
from dw.dw_tms_clairvoyant_tb_beacon 
where dt='2017-09-06' and get_date(created_at)='2017-09-06' 
group by target_id,hour(created_at) 
order by target_id, hour



select t01.taker_id, t01.tracking_id, t01.pickup_at, t01.dt
from (
	select * from dm.dm_tms_apollo_waybill_wide_detail
	where dt = '2017-09-25' and taker_id = 787944
) t01
join(
	select distinct building_id from dw.dw_tms_clairvoyant_tb_beacon_location where dt=get_date(-1) 
) t02
on t01.restaurant_id = t02.building_id

# 按小时列出所有骑手的单量数据在有beaocn的店的单量数据
select t01.taker_id, hour(t01.pickup_at) as hour, count(1) as order_cnt
from (
	select * from dm.dm_tms_apollo_waybill_wide_detail where dt = '2017-09-06' 
) t01
join(
	select distinct building_id from dw.dw_tms_clairvoyant_tb_beacon_location where dt=get_date(-1) 
) t02
on t01.restaurant_id = t02.building_id
group by t01.taker_id, hour(t01.pickup_at)

# 订单宽表，给定date和restaurant_id
select * 
from dm.dm_tms_apollo_waybill_wide_detail 
where dt = "2017-09-06" and restaurant_id = 1845719
order by created_at

# 千里眼beacon原始数据，查单个骑手指定日期
select * 
from dw.dw_tms_clairvoyant_tb_beacon 
where dt = "2017-08-30" and created_at > "2017-08-30" and created_at < "2017-08-30" and target_id = 827390
order by created_at

# 千里眼beacon原始数据，查不同骑手数据量
select target_id, count(*) as dat_num 
from dw.dw_tms_clairvoyant_tb_beacon where dt = "2017-08-19" and created_at > "2017-08-18 06:00:00" group by target_id

# 千里眼数据，LocationType=10是beacon数据，其他是高德数据
select * from dw.dw_log_talaris_taker_location_day_inc 
where dt = "2017-08-21" and type = "TALARIS_TEAM" and get_json_object(get_json_object(detail, '$.location'), '$.LocationType')=10 limit 1000

# 千里眼数据，给定日期查各骑手beacon数据量
select taker_id,count(*) as data_num 
from dw.dw_log_talaris_taker_location_day_inc 
where dt = "2017-08-24" and type = "TALARIS_TEAM" and get_json_object(get_json_object(detail, '$.location'), '$.LocationType')=10 
group by taker_id 
order by data_num desc

# 千里眼数据，给定日期和骑手，查所有类型的数据（包括beacon和GPS，用LocationType区分）
select * 
from dw.dw_log_talaris_taker_location_day_inc 
where dt = "2017-09-03" and type = "TALARIS_TEAM" and taker_id = 10398815
order by record_time

# 千里眼原始数据，给定minor查beacon数据
select *
from dw.dw_tms_clairvoyant_tb_beacon where dt = "2017-09-03" and created_at > "2017-09-03" and created_at < "2017-09-03"
and get_json_object(beacon_info, '$.beaconMinor')=46566
order by created_at


# 近铁beacon原始数据，给定日期、骑手ID查beacon数据
select * from dw.dw_tms_interstellar_ins_beacon_data_hour 
where dt = "2017-09-04" and hour = 12 and beacon_uuid = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0" 
and user_id = 803 and beacon_detected_at > "2017-09-04 06:00:00" and beacon_detected_at < "2017-09-04 23:00:00" 
order by beacon_detected_at

# 近铁beacon原始数据，给定日期查各骑手数据量
select user_id, count(*) from dw.dw_tms_interstellar_ins_beacon_data_hour 
where dt = "2017-08-20" and hour = 12 and beacon_uuid = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0" 
and beacon_detected_at > "2017-08-19 07:00:00" and beacon_detected_at < "2017-08-19 23:00:00" 
group by user_id

# 近铁订单数据
select * from dw.dw_tms_interstellar_ins_order 
where dt = "2017-09-10" and shop_id = 92 and taken_at > "2017-09-10 06:00:00.0" and taken_at < "2017-09-10 23:00:00.0" 
order by taken_at asc

# 近铁订单数据，给定日期查各店铺单数
select shop_id, count(*) from dw.dw_tms_interstellar_ins_order 
where dt = get_date(-1) and created_at > "2017-08-21 08:00:00.0" and created_at < "2017-08-21 23:00:00.0" group by shop_id

测试账号和密码：
User Name: 17721429141
Password: wh123456.
user_id = 10080551