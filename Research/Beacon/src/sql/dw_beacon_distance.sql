#***************************************************************************************************
# ** 文件名称： dw_beacon_distance
# ** 功能描述：
# ** 创建者： 
# ** 创建日期： 2017年08月23日
# ** 修改日期 修改人 修改内容
#***************************************************************************************************


INSERT overwrite TABLE dw.dw_beacon_distance partition(dt='${day}') 
SELECT courier_id, 
            courier_type, 
            city_id, 
            record_time, 
            time_diff(record_time, lat_time) period, 
            get_point_distance(pre_latitude, pre_longitude, lat_latitude, lat_longitude) distance,
            GPS_record_time, 
            time_diff(GPS_record_time, GPS_lat_time) GPS_period, 
            get_point_distance(GPS_pre_latitude, GPS_pre_longitude, GPS_lat_latitude, GPS_lat_longitude) GPS_distance   
FROM (SELECT courier_id, 
            courier_type, 
            city_id, 
            zone_id, 
            record_time, 
            floor pre_floor, 
            longitude pre_longitude, 
            latitude pre_latitude, 
            lead(courier_id, 1, '') OVER (order by courier_id,record_time) lat_courier_id,
            lead(floor,1,'') OVER (order by courier_id,record_time) lat_floor,
            lead(record_time,1,'') OVER (order by courier_id, record_time) lat_time,
            lead(longitude,1,null) OVER (order by courier_id, record_time) lat_longitude, 
            lead(latitude,1,null) OVER (order by courier_id, record_time) lat_latitude,
            GPS_record_time, 
            GPS_longitude GPS_pre_longitude, 
            GPS_latitude GPS_pre_latitude, 
            lead(GPS_record_time,1,'') OVER (order by courier_id, record_time) GPS_lat_time,
            lead(GPS_longitude,1,null) OVER (order by courier_id, record_time) GPS_lat_longitude, 
            lead(GPS_latitude,1,null) OVER (order by courier_id, record_time) GPS_lat_latitude 
FROM dw.dw_beacon_wide 
WHERE dt='${day}') t1   
where courier_id=lat_courier_id;