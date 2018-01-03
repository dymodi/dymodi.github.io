#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Sep  4 15:37:08 2017

@author: eleme-yi
"""
import datetime as dt
import numpy as np
from evaluation import evaluation
from process import eval_obj

# This is a outer main function to evaluate functions for Phase II report

eval_list = []

# Phase I (Jintie)
# eval_list.append(eval_obj(dt.date(2017,8,7),240,99)) # No order-beacon
eval_list.append(eval_obj(dt.date(2017,8,18),240,39))
#eval_list.append(eval_obj(dt.date(2017,8,19),92,731)) # NaN,No order-beacon
eval_list.append(eval_obj(dt.date(2017,8,20),56,142))
#eval_list.append(eval_obj(dt.date(2017,9,4),88,803)) # dtquery error
eval_list.append(eval_obj(dt.date(2017,9,4),49,731))
#eval_list.append(eval_obj(dt.date(2017,9,10),92,39)) # dtquery error
#
# Phase II (Riyueguang)
#eval_list.append(eval_obj(dt.date(2017,9,3),155834939,10705176))# POI error # 馍都（日月光店）,徐家汇618号B2—TT—28B
eval_list.append(eval_obj(dt.date(2017,9,5),319962,10108333))    # 松乃家日式猪排专门店（日月光店）,上海市黄浦区徐家汇路618号B2F-B-20室
eval_list.append(eval_obj(dt.date(2017,9,5),12825,10108333))     # 妙寿司(日月光店), 上海市黄浦区徐家汇路618号B2F-B32室
#eval_list.append(eval_obj(dt.date(2017,8,25),1879109,10747144)) # raw file time format error

# Phase II (Huaqiangbei)
#eval_list.append(eval_obj(dt.date(2017,8,25),639184,10391078))  # raw file time format error
eval_list.append(eval_obj(dt.date(2017,8,30),639184,827390))
eval_list.append(eval_obj(dt.date(2017,9,3),639184,10473204))
eval_list.append(eval_obj(dt.date(2017,9,3),639184,10384072))   # 辉记煲仔饭（汤粉店）， 深圳市福田区华强北街道燕南路87-6商铺桑达工业区400栋首层-面点王旁边
eval_list.append(eval_obj(dt.date(2017,9,3),1845719,10368943))  # 婆婆味(燕南店)，深圳市福田区华强北街道燕南路七层综合楼1栋东座一层南4号4-1
#eval_list.append(eval_obj(dt.date(2017,9,4),32996,10732692))   # nan error # 大漠牛肉面， 深圳市福田区华发北路73号
#eval_list.append(eval_obj(dt.date(2017,9,4),152679629,881204)) # nan error # 豫味坊烩面饺子（华强北店）,华强北街道燕南路87-5上步电子工业区417栋一楼一部
eval_list.append(eval_obj(dt.date(2017,9,4),155850470,10763945))# 囧先生鲍汁饭，深圳市福田区华强北街道振兴路2058号嘉年华外贸服装城二楼美食广场CY13-A
eval_list.append(eval_obj(dt.date(2017,9,4),398929,914551))     # 金翠烧鹅皇餐厅，深圳市福田区华强北街道华发北路56-5号铺
eval_list.append(eval_obj(dt.date(2017,9,5),155127631,971540))  # 假装在台北，深圳市福田区华强北街道振兴路23华发大厦2楼16号铺
eval_list.append(eval_obj(dt.date(2017,9,6),639184,10243956))   # 辉记煲仔饭（汤粉店）， 深圳市福田区华强北街道燕南路87-6商铺桑达工业区400栋首层-面点王旁边
eval_list.append(eval_obj(dt.date(2017,9,6),639184,10530483))   # 辉记煲仔饭（汤粉店）， 深圳市福田区华强北街道燕南路87-6商铺桑达工业区400栋首层-面点王旁边
eval_list.append(eval_obj(dt.date(2017,9,6),1845719,10530483))  # 辉记煲仔饭（汤粉店）， 深圳市福田区华强北街道燕南路87-6商铺桑达工业区400栋首层-面点王旁边
#eval_list.append(eval_obj(dt.date(2017,9,6),1845719,10391078)) # ABSURD ERROR # 婆婆味(燕南店)，深圳市福田区华强北街道燕南路七层综合楼1栋东座一层南4号4-1
eval_list.append(eval_obj(dt.date(2017,9,7),155127631,10714353))# 假装在台北，深圳市福田区华强北街道振兴路23华发大厦2楼16号铺
eval_list.append(eval_obj(dt.date(2017,9,7),398929,10204859))   # 金翠烧鹅皇餐厅，深圳市福田区华强北街道华发北路56-5号铺
eval_list.append(eval_obj(dt.date(2017,9,12),639184,991187))    # 辉记煲仔饭（汤粉店）， 深圳市福田区华强北街道燕南路87-6商铺桑达工业区400栋首层-面点王旁边
eval_list.append(eval_obj(dt.date(2017,9,12),152679629,881204)) # nan error # 豫味坊烩面饺子（华强北店）,华强北街道燕南路87-5上步电子工业区417栋一楼一部
eval_list.append(eval_obj(dt.date(2017,9,12),1845719,881204))   # 婆婆味(燕南店)，深圳市福田区华强北街道燕南路七层综合楼1栋东座一层南4号4-1
eval_list.append(eval_obj(dt.date(2017,9,13),639184,800846))    # 辉记煲仔饭（汤粉店）， 深圳市福田区华强北街道燕南路87-6商铺桑达工业区400栋首层-面点王旁边


date_list = []
rider_list = []
shop_list = []
for i in range(0,len(eval_list)):
    date_list.append(eval_list[i].date)
    shop_list.append(eval_list[i].shop_id)
    rider_list.append(eval_list[i].rider_id)
    

evl_beacon_arrive_error, evl_gps_arrive_error,\
evl_var_beacon_arrive,evl_var_gps_arrive,\
evl_beacon_static_ratio, evl_gps_static_ratio, \
evl_exception_tuple,evl_exception_minor,\
total_order_num,total_check_in_fail_num,evl_avg_check_in_time_diff\
 = evaluation(date_list, rider_list, shop_list)


rvs_beacon_arrive_error = [x for x in evl_beacon_arrive_error if x is not None]
rvs_gps_arrive_error = [x for x in evl_gps_arrive_error if x is not None]
rvs_beacon_static_ratio = [x for x in evl_beacon_static_ratio if x is not None]
rvs_gps_static_ratio = [x for x in evl_gps_static_ratio if x is not None]

evl_avg_beacon_arrive_error = np.mean(rvs_beacon_arrive_error)
evl_avg_gps_arrive_error = np.mean(rvs_gps_arrive_error)
evl_avg_beacon_static_ratio = np.mean(rvs_beacon_static_ratio)
evl_avg_gps_static_ratio = np.mean(rvs_gps_static_ratio)
