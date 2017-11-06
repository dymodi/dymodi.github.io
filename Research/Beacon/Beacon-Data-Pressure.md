--- 
layout: post
title: Beacon数据压力
date: Nov. 6, 2017
author: Yi DING
---

[comment]: # (统计并预估Beacon的数据压力)

### Quick Statistics
* 当前已部署的商户数量：200
* 当前

表一：智石数据统计

|Date   |# Beacon Raw Data  |# Rider    |# Shop | # Per Rider   |# Per Shop |# Per Rider Per Shop   |
|---    |---                |---        |---    |---            |---        |---                    |
|10-30  |258317             |338        |195    |764            |1325       |3.9                    |
|10-31  |264715             |330        |194    |802            |1365       |4.1                    |
|11-01  |242846             |323        |207    |752            |1173       |3.6                    |
|11-02  |258631             |330        |202    |784            |1280       |3.9                    |
|11-03  |240906             |330        |189    |730            |1275       |3.9                    |
|11-04  |229283             |329        |197    |697            |1164       |3.5                    |       
|11-05  |264371             |302        |210    |875            |1259       |4.2                    |

表一：睿石数据统计

|Date   |# Beacon Raw Data  |# Rider    |# Shop | # Per Rider   |# Per Shop |# Per Rider Per Shop   |
|---    |---                |---        |---    |---            |---        |---                    |
|10-30  |185426             |323        |166    |574            |1117       |3.5                    |
|10-31  |190935             |317        |166    |602            |1150       |3.6                    |
|11-01  |175553             |313        |175    |561            |1003       |3.2                    |
|11-02  |179930             |320        |169    |562            |1065       |3.3                    |
|11-03  |177267             |305        |160    |581            |1108       |3.6                    |
|11-04  |165081             |316        |165    |522            |1000       |3.2                    |
|11-05  |199530             |298        |171    |670            |1167       |3.9                    |


需要注意的事项：
1. 现在每天beacon的原始数据量大于上面的统计，是因为现在版本还没有卡UUID，也就是说除了公司beacon的UUID"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0" 之外还有别的UUID收上来，这需要在后续版本进行改进。



```
select get_date(created_at) as created_date, 
count (distinct id) as data_num,
count (distinct target_id) as rider_num,
count (distinct parse_json_object(beacon_info, 'beaconMinor')) as shop_num,
round((count (distinct id)/count (distinct target_id)),0)  as num_per_rider,
round((count (distinct id)/count (distinct parse_json_object(beacon_info, 'beaconMinor'))),0) as num_rider_per_shop,
round((count (distinct id)/count (distinct target_id)/count (distinct parse_json_object(beacon_info, 'beaconMinor'))),1) as num_per_rider_per_shop
from dw.dw_tms_clairvoyant_tb_beacon 
where dt = '2017-11-05' and created_at > '2017-10-30' 
and parse_json_object(beacon_info, 'beaconUuid') = 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
and parse_json_object(beacon_info, 'beaconMajor') = 16160
group by get_date(created_at)
order by created_date
```
