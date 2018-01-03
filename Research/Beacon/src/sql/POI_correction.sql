# Here are some codes for POI correction section in the paper
# Yi Ding, 09/19/17

# Here we check the average node that can be heared at the same time
select t01.data_cnt, count(*) 
from (
select target_id, unix_timestamp(created_at) as time_stamp, count(distinct parse_json_object(beacon_info, 'beaconMinor')) as data_cnt
from dw.dw_tms_clairvoyant_tb_beacon
where dt = get_date(-1)
group by target_id, unix_timestamp(created_at)
) t01
group by t01.data_cnt


# 09/19/17 Data
#Heared	#Portion	# Ratio		# Accu Ratio	
#1		26574337	0.764904555	
#2		3803688		0.109483758	0.874388313
#3		1283827		0.036953137	0.91134145
#4		753640		0.021692457	0.933033907
#5		502554		0.014465303	0.947499211
#6		362399		0.010431141	0.957930351
#7		257522		0.007412405	0.965342756
#8		199492		0.005742094	0.97108485
#9		160023		0.004606035	0.975690885
#10		129710		0.003733518	0.979424403


# Here we calculate the distance of rider to beacon
select  created_at, target_id, beacon_info, power(10,(-parse_json_object(beacon_info, 'beaconRssi')-65)/(10*1.5)) as dist_to_beacon
from dw.dw_tms_clairvoyant_tb_beacon
where dt = get_date(-1)
limit 1000


# RSSI distribution
select t01.rssi, t01.data_cnt as zs_cnt, t02.data_cnt as rs_cnt
from (
	select parse_json_object(beacon_info, 'beaconRssi') as rssi, count(*) as data_cnt 
	from dw.dw_tms_clairvoyant_tb_beacon 
	where dt = get_date(-1) and parse_json_object(beacon_info, 'beaconMajor') = 16160
	group by parse_json_object(beacon_info, 'beaconRssi') 
) t01
join (
	select parse_json_object(beacon_info, 'beaconRssi') as rssi, count(*) as data_cnt 
	from dw.dw_tms_clairvoyant_tb_beacon 
	where dt = get_date(-1) and parse_json_object(beacon_info, 'beaconMajor') = 16161
	group by parse_json_object(beacon_info, 'beaconRssi') 
) t02
on t01.rssi = t02.rssi
