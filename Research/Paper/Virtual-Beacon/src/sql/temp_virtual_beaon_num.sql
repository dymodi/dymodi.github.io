---- 临时查看虚拟beacon数据
drop table if exists temp.temp_virtual_beacon_seven_days;
create table temp.temp_virtual_beacon_seven_days as
select t02.*
from (
	select beacon_id, dt 
	from dw_ai.dw_ai_merchant_virtualbeacon_info
	where dt > get_date(-7)
) t01
join (
	select * 
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt > get_date(-7)
) t02
on t01.beacon_id = t02.beacon_id and t01.dt = t02.dt;