---- 看一下商户端手机的移动pattern

---- 找到某个数据较多的商户
select beacon_id, count(1) as data_cnt
from dw_ai.dw_ai_merchant_virtualbeacon_info
where dt = get_date(-1) and latitude_gps <> 0.0
group by beacon_id
order by data_cnt desc


---- 1GGPTUEZROT4T5ZE2NP
---- Y3OJ06SC3MVL7YSRUMX
---- Y33JV2TVOK4JZ6N737X
---- 下数据
select * 
from dw_ai.dw_ai_merchant_virtualbeacon_info
where dt = get_date(-1) and beacon_id = 'Y33JV2TVOK4JZ6N737X'
and latitude_gps <> 0.0
order by phone_time