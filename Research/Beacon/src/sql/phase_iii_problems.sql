---- Some SQLs to discover and solve problems for Ele.Me Beacons phase III
---- Yi Ding
---- 02/19/2018

---- 查有没有大范围的骑手同时听到多个Beacon的情况
drop table if exists temp.temp_beacon_num_beacon_heared_at_same_second
create table temp.temp_beacon_num_beacon_heared_at_same_second as
select dt, rider_id, detected_at, count(*) as data_cnt
from dw_ai.dw_ai_clairvoyant_beacon
where dt > get_date(-30)
group by dt, rider_id, detected_at


---- 看看过去几天超过10，30，50的分布
select t01.dt, t01.num_greater_10, t02.num_greater_30, t03.num_greater_50
from (
select dt, count(*) as num_greater_10
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 10
group by dt
) t01
join (
select dt, count(*) as num_greater_30
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 30
group by dt
) t02
on t01.dt = t02.dt
join (
select dt, count(*) as num_greater_50
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 50
group by dt
) t03
on t02.dt = t03.dt
order by dt

---- 看看过去几天超过10，30，50的分布
---- distinct 骑手
select t01.dt, t01.num_greater_10, t02.num_greater_30, t03.num_greater_50
from (
select dt, count(distinct rider_id) as num_greater_10
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 10
group by dt
) t01
join (
select dt, count(distinct rider_id) as num_greater_30
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 30
group by dt
) t02
on t01.dt = t02.dt
join (
select dt, count(distinct rider_id) as num_greater_50
from temp.temp_beacon_num_beacon_heared_at_same_second
where data_cnt > 50
group by dt
) t03
on t02.dt = t03.dt
order by dt