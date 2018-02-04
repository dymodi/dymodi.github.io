---- For blog "Real-Time Arrival Departure Detection"
---- Yi Ding
---- 02/04/18


---- Find a target rider
select rider_id, count(*) as data_cnt 
from dw_ai.dw_ai_clairvoyant_beacon
where dt = '2018-02-04'
group by rider_id
order by data_cnt desc

---- Find rider '100556090'

---- Extract the specific rider's beacon data in the specific day
select * , unix_timestamp(detected_at) as unix_timestamp
from dw_ai.dw_ai_clairvoyant_beacon
where dt = '2018-02-04' and rider_id = 100556090
order by detected_at
limit 50000

---- Extract the specific rider's beacon data at specific shop in the specific day
select * ,unix_timestamp(detected_at) as unix_timestamp
from dw_ai.dw_ai_clairvoyant_beacon
where dt = '2018-02-04' and rider_id = 100556090 and shop_id = 147525716
order by detected_at
limit 30000






---- Save data to local for further analysis with Python