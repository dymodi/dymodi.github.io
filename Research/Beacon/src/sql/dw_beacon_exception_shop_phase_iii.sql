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
drop table if exists temp.temp_beacon_at_the_same_time_detail_phase_iii;
create table temp.temp_beacon_at_the_same_time_detail_phase_iii as
	select t01.rider_id, 
	get_point_distance(t01.latitude, t01.longitude, t02.latitude, t02.longitude) as distance,
	t01.beacon_id as beacon_1,t01.detected_at as time_1, t01.rssi as rssi_1, t01.shop_id as shop_1, t01.latitude as latitude_1, t01.longitude as longitude_1,
	t02.beacon_id as beacon_2, t02.detected_at as time_2, t02.rssi as rssi_2, t02.shop_id as shop_2, t02.latitude as latitude_2, t01.longitude as longitude_2,
	t01.dt as dt
	from (
		select *
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt > get_date(-4) and detected_at > get_date(-4)
		and rssi > -80
	) t01
	join (
		select *
		from dw_ai.dw_ai_clairvoyant_beacon
		where dt > get_date(-4) and detected_at > get_date(-4)
		and rssi > -80
	) t02
	on t01.rider_id = t02.rider_id and t01.dt = t02.dt
	where unix_timestamp(t01.detected_at) - unix_timestamp(t02.detected_at) > -2
	and t01.shop_id < t02.shop_id
	and unix_timestamp(t01.detected_at) < unix_timestamp(t02.detected_at);


# 把同时听到的相距太远的店用阈值卡一下，把店铺id提取出来，作为可疑的店铺
# 现在的阈值是0.1km

INSERT overwrite TABLE dw_analyst.dw_analyst_beacon_exception_shop_day partition(dt='${day}') 
select distinct distance, shop_1, shop_2, latitude_1, longitude_1, latitude_2, longitude_2
from temp.temp_beacon_at_the_same_time_detail_phase_iii
where distance > 0.1