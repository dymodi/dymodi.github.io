#***************************************************************************************************
# ** 文件名称： dw_beacon_exception_shop
# ** 功能描述： 基于beacon原始数据进行POI校正
# ** 创建者： 
# ** 创建日期： 2017年09月18日
# ** 修改日期 修改人 修改内容
# 
#***************************************************************************************************

# temp.temp_beacon_at_the_same_time 表中存的是同一设备在同一秒内听到的beacon pair的信息
# target_id 和 clairvoyant_tb_beacon_id 被保留用于返回来查clairvoyant_tb_beacon表中的原始数据
drop table if exists temp.temp_beacon_at_the_same_time;
create table temp.temp_beacon_at_the_same_time as
	select t01.target_id, t01.id as clairvoyant_tb_beacon_id_1, t02.id as clairvoyant_tb_beacon_id_2,
	t01.created_at as time_1, t02.created_at as time_2, parse_json_object(t01.beacon_info, 'beaconUuid') as uuid,
	parse_json_object(t01.beacon_info, 'beaconMajor') as major_1, parse_json_object(t02.beacon_info, 'beaconMajor') as major_2,
	parse_json_object(t01.beacon_info, 'beaconMinor') as minor_1, parse_json_object(t02.beacon_info, 'beaconMinor') as minor_2,
	parse_json_object(t01.beacon_info, 'beaconRssi') as rssi_1, parse_json_object(t02.beacon_info, 'beaconRssi') as rssi_2,
	t01.dt as dt
	from (
		select created_at, target_id, beacon_info,id,dt
		from dw.dw_tms_clairvoyant_tb_beacon
		where dt = get_date(-1) and created_at > get_date(-2)
		and parse_json_object(beacon_info, 'beaconUuid') = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
	) t01
	join (
		select *
		from dw.dw_tms_clairvoyant_tb_beacon
		where dt = get_date(-1) and created_at > get_date(-2)
		and parse_json_object(beacon_info, 'beaconUuid') = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
	) t02
	on unix_timestamp(t01.created_at) = unix_timestamp(t02.created_at) and t01.target_id = t02.target_id
	where parse_json_object(t01.beacon_info, 'beaconMinor') <> parse_json_object(t02.beacon_info, 'beaconMinor')
	and t01.id < t02.id;

# 通过联beacon_location的表，可以得到beaocn的经纬度和店铺id，并将全部信息存到 temp_beacon_at_the_same_time_detail 表中
drop table if exists temp.temp_beacon_at_the_same_time_detail;
create table temp.temp_beacon_at_the_same_time_detail as
	select t01.target_id, t01.clairvoyant_tb_beacon_id_1, t01.clairvoyant_tb_beacon_id_2,
	t01.major_1, t01.minor_1, t01.major_2, t01.minor_2,
	t02.building_id as shop_1, t03.building_id as shop_2,
	t02.latitude as latitude_1, t02.longitude as longitude_1, t03.latitude as latitude_2, t03.longitude as longitude_2,
	get_point_distance(t02.latitude, t02.longitude, t03.latitude, t03.longitude) as distance, t01.dt as dt
	from (
		select *
		from temp.temp_beacon_at_the_same_time
	) t01
	join (
		select *
		from dw.dw_tms_clairvoyant_tb_beacon_location
		where dt = get_date(-1)
	) t02
	on t01.major_1 = t02.major and t01.minor_1 = t02.minor
	join (
		select *
		from dw.dw_tms_clairvoyant_tb_beacon_location
		where dt = get_date(-1) 
	) t03
	on t01.major_2 = t03.major and t01.minor_2 = t03.minor;
	where t02.building_id <> t03.building_id

# 把同时听到的相距太远的店用阈值卡一下，把店铺id提取出来，作为可疑的店铺
# 现在的阈值是0.1km
drop table if exists temp.temp_beacon_exception_shop;
create table temp.temp_beacon_exception_shop as
	select distinct t01.shop_1, t01.shop_2, t01.distance, t01.latitude_1, t01.longitude_1, t01.latitude_2, t01.longitude_2, t01.dt
	from (
		select 
		(case when shop_1 < shop_2 then shop_1 else shop_2 end) as shop_1, 
		(case when shop_1 < shop_2 then shop_2 else shop_1 end) as shop_2, 
		distance,
		(case when shop_1 < shop_2 then latitude_1 else latitude_2 end) as latitude_1,
		(case when shop_1 < shop_2 then longitude_1 else longitude_2 end) as longitude_1,
		(case when shop_1 < shop_2 then latitude_2 else latitude_1 end) as latitude_2,
		(case when shop_1 < shop_2 then longitude_2 else longitude_1 end) as longitude_2,
		dt
		from temp.temp_beacon_at_the_same_time_detail
	) t01
	where distance > 0.1
