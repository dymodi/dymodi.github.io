# 查多少beacon有数据

select get_json_object(beacon_info, '$.beaconMinor') as Minor, count(*) as data_num 
from 
dw.dw_tms_clairvoyant_tb_beacon 
where 
dt = get_date(-1) and get_json_object(beacon_info, '$.beaconUuid') ​= "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0​"
group by 
get_json_object(beacon_info, '$.beaconMinor')​




# 查某个beacon某天24h的数据
select hour(created_at),count(1) 
from dw.dw_tms_clairvoyant_tb_beacon 
where dt='2017-09-06' and get_date(created_at)='2017-09-06' 
group by hour(created_at) 
order by 1 desc;

# 查某个beacon某天24h的数据
select hour(beacon_detected_at),count(1) 
from dw.dw_tms_interstellar_ins_beacon_data_hour
where dt='2017-09-05' and hour = 12 and beacon_minor = 1130 and get_date(beacon_detected_at)='2017-09-04' 
group by hour(beacon_detected_at) 
order by 1 desc
