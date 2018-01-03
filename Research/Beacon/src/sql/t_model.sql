---- Select features from t model ----


drop table if exists temp.temp_beacon_t_model_day;
create table temp.temp_beacon_t_model_day as
Select label, grid_avg_lead_time_30, rst_avg_lead_time_30, weather_code, order_distance, yesterday_cook_time
from dw_ai.dw_aly_t_model_4_3_feature_v5
where dt = get_date(-1)


select get_date(eleme_created_at), count(distinct tracking_id)
from dw_ai.dw_aly_t_model_4_3_feature_v5 
where dt > get_date(-10)
group by get_date(eleme_created_at)

select * 
from dw_ai.dw_aly_t_model_4_3_feature_v5
where dt = get_date(-1)
order by rand()
limit 10000