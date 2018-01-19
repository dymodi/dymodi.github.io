# In this script we count the number of drifting points in Jintie
# Yi Ding @ Ele.me, 09/12/17
#
# Left-bottom: 	121.3797, 31.2312
# Right-bottom: 121.3833, 31.2312
# Left-top:		121.3797, 31.2340
# Right-top:	121.3833, 31.2340

# Result: (Wrong)
# Date | Total  | Drifting 	|ratio 	| Total user | Drifting user | ratio | >1e3   | >1e4 | > 1e5 | > 1e6
# 0911 | 760148 | 317286	| 0.417	| 68		 | 59			 | 0.868 | 122422 | 78	 | 76	 | 76
# 0910 | 498251 | 237851	| 0.477	| 53		 | 44			 | 0.830 | 126633 | 57	 | 51	 | 51
# 0909 | 523593 | 242069	| 0.462	| 66 		 | 57			 | 0.864 | 141517 | 31	 | 21	 | 21
# 0908 | 637159 | 275871	| 0.433	| 65		 | 58			 | 0.892 | 140751 | 267	 | 261 	 | 261
# 0907 | 699806 | 331764	| 0.474	| 60 		 | 55			 | 0.917 | 139830 | 555	 | 552	 | 552
# 0906 | 788405 | 372567	| 0.473 | 61		 | 52			 | 0.852 | 160130 | 366  | 330	 | 330
# 0905 | 776847 | 314231	| 0.404	| 55		 | 45			 | 0.818 | 157117 | 71	 | 36	 | 36

# Result: (Revised, Mapping Jintie Beacon) 
# Date | Total  | Drifting 	|ratio 	| Total user | Drifting user | ratio | >1e1   | >5e1  		  | >1e2 		  | >1e3 | >1e4
# 0911 | 760148 | 188800	| 0.248	| 68		 | 30		 	 | 0.440 | 168214 |	166987 (0.88) | 270 (0.0014)  | 249	 | 76
# 0910 | 498251 | 108393	| 0.218	| 53		 | 29		 	 | 0.547 | 89488  |	87031  (0.80) | 269 (0.0025)  | 251	 | 54
# 0909 | 523593 | 96304		| 0.194	| 66 		 | 34		 	 | 0.515 | 83540  | 80492  (0.84) | 93	(0.0010)  | 92	 | 17 
# 0908 | 637159 | 124675	| 0.196	| 65		 | 30		 	 | 0.462 | 110188 | 106947 (0.86) | 66  (0.0005)  | 61   | 23 
# 0907 | 699806 | 180741	| 0.258	| 60 		 | 29			 | 0.580 | 166890 | 163129 (0.90) | 180	(0.0010)  | 83	 | 13 
# 0906 | 788405 | 205282	| 0.260 | 61		 | 25			 | 0.409 | 186925 | 184600 (0.90) | 235	(0.0011)  | 91	 | 35
# 0905 | 776847 | 151399	| 0.195	| 55	 	 | 22	 		 | 0.400 | 134551 | 132037 (0.87) | 119 (0.0008)  | 55   | 35

# Result: (Revised, Mapping Jintie Beacon, distance calc) 
# Date | Total  | Drifting 	|ratio 	| Total user | Drifting user | ratio | >1e2 		 	| >3e2 		 	| >4e2			| >5e2	| >1e3 	| >1e4
# 0911 | 760148 | 188800	| 0.248	| 68		 | 30		 	 | 0.440 | 188581 (0.99)	| 159674 (0.846)| 319 (0.0017)	| 268	| 249	| 76	
# 0910 | 498251 | 108393	| 0.218	| 53		 | 29		 	 | 0.547 | 108052 (0.99)  	| 83382	 (0.769)| 336 (0.0031)	| 269	| 251	| 54
# 0909 | 523593 | 96304		| 0.194	| 66 		 | 34		 	 | 0.515 | 96144  (0.99)  	| 77397  (0.804)| 318 (0.0033)	| 93	| 92	| 17 				| 		
# 0908 | 637159 | 124675	| 0.196	| 65		 | 30		 	 | 0.462 | 124624 (0.99)  	| 104209 (0.836)| 302 (0.0024) 	| 63 	| 61	| 23
# 0907 | 699806 | 180741	| 0.258	| 60 		 | 29			 | 0.580 | 180672 (0.99) 	| 155715 (0.862)| 227 (0.0013) 	| 177 	| 116 	| 13 
# 0906 | 788405 | 205282	| 0.260 | 61		 | 25			 | 0.409 | 205189 (0.99)	| 175977 (0.857)| 203 (0.0010)	| 183 	| 124 	| 35 
# 0905 | 776847 | 151399	| 0.195	| 55	 	 | 22	 		 | 0.400 | 151320 (0.99)	| 129591 (0.856)| 250 (0.0017) 	| 66   	| 57 	| 35

# Count total
select count(*) as num_total, count (distinct user_id) as num_user_total, max(dt) as dt
from dw.dw_tms_interstellar_ins_beacon_data_hour 
where dt = '2017-09-05' and hour = 21 and beacon_uuid = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0' 


# Count drifting
select count(*) as num_drifting, count(distinct user_id) as num_user_drifting, max(t01.dt) as dt
from (
select * 
from dw.dw_tms_interstellar_ins_beacon_data_hour
where dt = '2017-09-05' and hour = 21 and beacon_uuid = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0' 
and (latitude < 31.2312 or latitude > 31.2340 or longitude < 121.3797 or longitude > 121.3833)
) t01
join(
	select beacon_minor
	from temp_analyst.ins_shop_beacon_mapping
) t03
on t01.beacon_minor = t03.beacon_minor


# Calculate average drifting distance
select 
count(*) as totoal,
count(case when dist_drift > 10 then id end) as larger_than_1e1,
count(case when dist_drift > 50 then id end) as larger_than_5e1,
count(case when dist_drift > 100 then id end) as larger_than_1e2,
count(case when dist_drift > 1000 then id end) as larger_than_1e3,
count(case when dist_drift > 10000 then id end) as larger_than_1e4, 
max(dt)
from (
	select t01.id as id, (sqrt(power(abs(t01.latitude-t03.restaurant_latitude_way_wide)*100000,2)+
		power(abs(t01.longitude-t03.restaurant_longitude_way_wide)*100000,2))-10) as dist_drift, 
	t01.latitude, t01.longitude, t01.beacon_major, t01.beacon_minor, t01.dt
	from (
		select *
		from dw.dw_tms_interstellar_ins_beacon_data_hour 
		where dt = '2017-09-11' and hour = 21 and beacon_uuid = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0' 
		and (latitude < 31.2312 or latitude > 31.2340 or longitude < 121.3797 or longitude > 121.3833)
	) t01
	join (
	select *
	from temp_analyst.ins_shop_beacon_mapping
	) t03
	on t01.beacon_minor = t03.beacon_minor
) t02





# Back up code
select *
from (
	select t01.id as id, (sqrt(power(abs(t01.latitude-31.2326)*100000,2)+power(abs(t01.longitude-121.3815)*100000,2))-320) as dist_drift, 
	t01.latitude, t01.longitude, t01.beacon_major, t01.beacon_minor, t01.dt
	from (
		select *
		from dw.dw_tms_interstellar_ins_beacon_data_hour 
		where dt = '2017-09-05' and hour = 21 and beacon_uuid = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0' 
		and (latitude < 31.2312 or latitude > 31.2340 or longitude < 121.3797 or longitude > 121.3833)
	) t01
	join 
	(select beacon_minor
	from temp_analyst.ins_shop_beacon_mapping) t02
	on t01.beacon_minor = t02.beacon_minor
	)