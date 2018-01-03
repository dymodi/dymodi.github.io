#***************************************************************************************************
# ** 文件名称： dw_beacon_courier_summary_day
# ** 功能描述：
# ** 创建者： 
# ** 创建日期： 2017年08月23日
# ** 修改日期 修改人 修改内容
# ** 2017.09.04  qiao.chen 增加tracking_count、shop_count两个字段
# ** 2017.09.06  qiao.chen 增加GPS相关信息
#***************************************************************************************************


drop table if exists temp.temp_dw_beacon_courier_summary_day_0;
create table temp.temp_dw_beacon_courier_summary_day_0 as  
	SELECT 
	courier_id, 
	courier_type, 
	city_id, 
	count(1)+1  data_count, 
	sum(period) period_sum, 
	sum(if(distance=0, 1, 0)) immobility_period,
	sum(if(period>0 and distance/period>1.47, period, 0)) exception_period,
	to_date(record_time) record_date,
	sum(if(GPS_period>0,1,0))+1  GPS_data_count, 
	sum(GPS_period) GPS_period_sum, 
	sum(if(GPS_distance=0, 1, 0)) GPS_immobility_period,
	sum(if(GPS_period>0 and GPS_distance/GPS_period>1.47, period, 0)) GPS_exception_period  
	FROM dw.dw_beacon_distance  
	WHERE dt='${day}'
	group by courier_id, courier_type, city_id, to_date(record_time);


	drop table if exists temp.temp_dw_beacon_courier_summary_day_1;
	create table temp.temp_dw_beacon_courier_summary_day_1 as 
		select 
		courier_id, 
		count(distinct trackingIdTable.tracking_id) tracking_count, 
		count(distinct shopTable.shop_id) shop_count  from 
		(select  
			courier_id, 
			get_json_object(value,'$.tracking_id') tracking_id  
			from 
			(select  
				courier_id, 
				parse_json_array(parse_json_object(tracking_info,"tracking_info")) tracking_info 
				from dm.dm_tms_taker_location_day 
				where dt='${day}' and location_type=10 and tracking_info is not null
			) t11 
			lateral view explode(tracking_info) portrait as value
		) trackingIdTable  
		join 
		(select 
			shop_id, 
			deliver_tracking_id as tracking_id 
			from dm.dm_trd_order_wide 
			where dt=get_date(-1)
		) shopTable 
		on (trackingIdTable.tracking_id=shopTable.tracking_id) 
		group by courier_id;


		INSERT overwrite TABLE dw.dw_beacon_courier_summary_day partition(dt='${day}')
		select 
		t0.courier_id, 
		courier_type, 
		city_id, 
		data_count, 
		period_sum, 
		immobility_period, 
		exception_period, 
		record_date, 
		nvl(tracking_count,0), 
		nvl(shop_count,0),
		GPS_data_count, 
		GPS_period_sum, 
		GPS_immobility_period, 
		GPS_exception_period 
		from 
		temp.temp_dw_beacon_courier_summary_day_0 t0 
		left join temp.temp_dw_beacon_courier_summary_day_1 t1 
		on (t0.courier_id=t1.courier_id);