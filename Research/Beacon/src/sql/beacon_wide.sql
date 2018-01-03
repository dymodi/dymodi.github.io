#***************************************************************************************************
# ** 文件名称： dw_beacon_wide
# ** 功能描述：
# ** 创建者： 
# ** 创建日期： 2017年08月23日
# ** 修改日期 修改人 修改内容
# ** 17.09.06 qiao.chen 增加对应GPS信息：GPS_record_time, GPS_location_type, GPS_longitude, GPS_latitude
#***************************************************************************************************





drop table if exists temp.temp_dw_beacon_wide_02;
create table temp.temp_dw_beacon_wide_02 as 
      select 
      orderedTable.taker_id, 
      taker_type,
      city_id,
      zone_id,
      record_time, 
      location_type,
      longitude,
      latitude,
      row_number() over (partition by orderedTable.taker_id order by record_time) as rn 
      from
      (select 
            taker_id, 
            TYPE as taker_type,
            city_id,
            zone_id,
            record_time, 
            longitude,
            latitude,
            parse_json_object(detail, 'location_type') as location_type 
            FROM dw.dw_log_talaris_taker_location_day_inc 
            WHERE dt='${day}' and TYPE in ('TALARIS_TEAM')  
            distribute by taker_id 
            ) orderedTable 
      join 
      (select 
            distinct taker_id 
            FROM dw.dw_log_talaris_taker_location_day_inc 
            WHERE dt='${day}' and TYPE in ('TALARIS_TEAM') and parse_json_object(detail, 'location_type')=10
            ) beaconCourierTable 
      on (orderedTable.taker_id=beaconCourierTable.taker_id);

# temp.temp_dw_beacon_wide_01 产生一个按时间顺序排好的（并用rn表示的）所有有beacon数据的骑手详单表
# 注意，这用了join是为了把这个骑手所有类型的数据都取出来而不仅取出beacon的数据

# INSERT overwrite TABLE dw.dw_beacon_wide partition(dt='${day}')
create table temp.temp_dw_beacon_wide_yi as
            select 
            rnTable.taker_id, 
            rnTable.taker_type, 
            city_id,
            zone_id,
            rnTable.record_time, 
            0,
            rnTable.longitude,
            rnTable.latitude,
            preTable.record_time as GPS_record_time, 
            preTable.location_type as GPS_location_type,
            preTable.longitude as GPS_longitude,
            preTable.latitude as GPS_latitude 
            from
            (select 
                  taker_id, 
                  taker_type,
                  city_id,
                  zone_id,
                  record_time, 
                  location_type,
                  longitude,
                  latitude,
                  rn, 
                  rn_pre 
                  from
                  (select 
                        taker_id, 
                        taker_type,
                        city_id,
                        zone_id,
                        record_time, 
                        location_type,
                        longitude,
                        latitude,
                        rn, 
                        max(case when location_type<>10 then rn end ) 
                        over (partition by taker_id order by rn rows between unbounded preceding and 1 preceding ) rn_pre 
                        # 这里的rn_pre其实就是每个骑手的row按时间顺序排，往前找到第一个location_type<>10的
                        from temp.temp_dw_beacon_wide_01
                  ) rnAllTable
                  where location_type=10
            ) rnTable
            join 
            (select 
                  taker_id, 
                  rn, 
                  record_time, 
                  location_type, 
                  longitude, 
                  latitude 
                  from temp.temp_dw_beacon_wide_01 
                  where location_type<>10
            ) preTable
            on (rnTable.taker_id=preTable.taker_id and rnTable.rn_pre=preTable.rn)