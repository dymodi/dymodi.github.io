#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Aug  7 17:16:51 2017
We test the beacon localization and compare with GPS 

@author: eleme-yi
"""



import math
import numpy as np

import process as bc

## Phase I
#date = datetime.date(2017,7,31)
#rider_id = 141
#shop_id = 240

def evaluation(date_list, rider_list, shop_list):

    evl_avg_beacon_arrive_error = []
    evl_avg_gps_arrive_error = []
    evl_avg_check_in_time_diff = []
    evl_var_beacon_arrive = []
    evl_var_gps_arrive = []
    evl_beacon_static_ratio = []
    evl_gps_static_ratio = []
    evl_exception_tuple = []
    evl_exception_minor = []
    
    total_order_num = 0
    total_check_in_fail_num = 0
    
    for elv_index in range(0,len(date_list)):
        date = date_list[elv_index]
        rider_id = rider_list[elv_index]
        shop_id = shop_list[elv_index]
    
        print("Evaluating ",elv_index," of ", len(date_list))
        print("shop:", shop_id, ", rider: ", rider_id, "on", str(date))
        
        startTime = [8,00,00]
        endTime = [22,00,00]
        
        is_ins = False
        is_tal = False
        if rider_id > 1000 and shop_id > 1000:
            is_tal = True
        if rider_id < 1000 and shop_id < 1000:
            is_ins = True
        
        # Read the beacon - shop mapping
        beacon_info = bc.ini_beacon_info("restaurant-beacon-mapping")
        beacon_info = bc.talaris_ini_beacon_info("data/others/all_restaurant_beacon_mapping",\
                                              beacon_info)
        
        shop_major,shop_minor = bc.get_major_minor_by_shop_id(shop_id,beacon_info)
        if len(shop_major) != len(shop_minor):
            raise Exception("Major Minor not equal size.")
                        
        if is_ins:
            print("This is a Phase I beacon.")
            # Read the beacon data from ins file
            beacon_file = '_'.join(['data/beacon/test_gps',str(date),str(rider_id)])
            beacon_data = bc.getRssiDataByUser(beacon_file,rider_id,startTime,endTime)            
            trace_lat,trace_lon,trace_floor,trace_time,trace_GPS_lat,trace_GPS_lon = \
            bc.beacon2GPS(beacon_data,beacon_info)
#            # Read order file and draw the compare figure
#            beacon_lat,beacon_lon,beacon_floor,GPS_lat,GPS_lon,arr_order,\
#            arr_time,order_num, num_check_in_fail = \
#            bc.get_check_in_location(date,rider_id,shop_id,startTime,endTime,\
#                                     beacon_data,shop_major,shop_minor)
            # Get check in data
            check_in_dist_beacon,check_in_dist_gps,check_in_time_delta,\
            num_order,num_check_in_fail = \
            bc.ins_get_check_in_location_filter(date,rider_id,shop_id,startTime,\
                                                 endTime,beacon_data,shop_major,shop_minor,beacon_info)
            
            
            
        if is_tal:
            print("This is a Phase II beacon")
            # Get trace from talaris file
            talaris_file = '_'.join(['data/talaris/all_talaris',str(date),str(rider_id)])
            trace_lat,trace_lon,trace_floor,trace_time,trace_GPS_lat,trace_GPS_lon = \
            bc.beacon2GPS_talaris(talaris_file)
            print(len(trace_lat), "data produced from talaris.")            
            # Read raw beacon data
            raw_talaris_file = '_'.join(['data/talaris/raw_talaris',str(date),str(rider_id)])
            beacon_data, strtTime, endTime = bc.read_raw_talaris_file(raw_talaris_file,'all')
            # Get check in data
#            beacon_lat,beacon_lon,beacon_floor,GPS_lat,GPS_lon,arr_order,arr_time,order_num,num_check_in_fail = \
#            bc.talaris_get_check_in_location(date,rider_id,shop_id,startTime,\
#                                             endTime,beacon_data,shop_major,shop_minor) 
            # Get check in data
            check_in_dist_beacon,check_in_dist_gps,check_in_time_delta,\
            num_order,num_check_in_fail = \
            bc.talaris_get_check_in_location_filter(date,rider_id,shop_id,startTime,\
                                                 endTime,beacon_data,shop_major,shop_minor)
            
            
        avg_beacon_arrive_error = np.mean(check_in_dist_beacon)
        avg_gps_arrive_error = np.mean(check_in_dist_gps)
        
        evl_avg_beacon_arrive_error.append(avg_beacon_arrive_error)
        evl_avg_gps_arrive_error.append(avg_gps_arrive_error)
            
        evl_avg_check_in_time_diff.append(np.mean(check_in_time_delta))
                
        print(len(beacon_data), "raw beacon data from this file")
        
        total_order_num = total_order_num + num_order
        total_check_in_fail_num = total_check_in_fail_num + num_check_in_fail                               
        
        duration = 20
        center_lat = trace_lat[0]
        center_lon = trace_lon[0]
        # Draw trace
        bc.draw_trace(center_lat, center_lon, trace_lat,trace_lon,\
               trace_GPS_lat,trace_GPS_lon,trace_time,startTime,\
               endTime,duration,rider_id,date)        
       
        
        # Static Ratio
        # 静止比例
        # 基于beacon数据的静止比例 = 静止的beacon数据点个数／总的beacon数据点个数
        # 基于gps数据的静止比例 = 静止的GPS数据点个数／总的GPS数据点个数
        # 静止点的判别为：相邻两点距离／相邻两点时间 < 0.1 m/s
        speed_beacon = []
        speed_gps = []
        static_num_beacon = 0
        static_num_gps = 0
        for i in range(1,len(trace_lat)):
            delta_dist_beacon = bc.calDist([trace_lat[i-1],trace_lon[i-1]],\
                                           [trace_lat[i],trace_lon[i]])*100000
            delta_dist_gps = bc.calDist([trace_GPS_lat[i-1],trace_GPS_lon[i-1]],
                                        [trace_GPS_lat[i],trace_GPS_lon[i]])*100000
            delta_time = (trace_time[i][0]-trace_time[i-1][0]) * 3600 + \
            (trace_time[i][1]-trace_time[i-1][1]) * 60 + (trace_time[i][2]-trace_time[i-1][2])
            if delta_time < 0.00000001:
                print("len(trace_time), i: ",len(trace_time),i)
                raise Exception("Duplicate trace time?!")
            speed_beacon.append(delta_dist_beacon/delta_time)
            speed_gps.append(delta_dist_gps/delta_time)
            if (delta_dist_beacon/delta_time) < 0.1:
                static_num_beacon = static_num_beacon + 1
            if (delta_dist_gps/delta_time) < 0.1:
                static_num_gps = static_num_gps + 1        
        
        beacon_static_ratio = static_num_beacon/len(trace_lat)
        gps_static_ratio = static_num_gps/len(trace_lat)
        
        evl_beacon_static_ratio.append(beacon_static_ratio)
        evl_gps_static_ratio.append(gps_static_ratio)
        
        # Get exceptional shops
        delta = 1       # Time delta
        distance = 200  # Distance in meters
        exception_tuple, exception_minor = bc.get_exceptional_shops(delta,distance,\
                                                                 beacon_data,beacon_info)
        evl_exception_tuple.append(exception_tuple)
        evl_exception_minor.append(exception_minor)
                               
        
        if num_order == num_check_in_fail:
            # No valid check in found            
            print("No valid check in found. num_order, num_check_in_fail: ",\
                  num_order, num_check_in_fail)
            evl_avg_beacon_arrive_error.append(None)
            evl_avg_gps_arrive_error.append(None)
            evl_beacon_static_ratio.append(None)
            evl_gps_static_ratio.append(None)
            evl_exception_tuple.append(None)
            evl_exception_minor.append(None)
            continue
        
#        # Draw check in
#        shop_lat, shop_lon, shop_floor = bc.get_location_by_shop_id(shop_id)
#        bc.draw_check_in(beacon_lat,beacon_lon,GPS_lat,GPS_lon,shop_lat, shop_lon,\
#                         date,shop_id,rider_id,arr_order,arr_time,shop_floor,beacon_floor)
                                
        
        
#        # Average error of position error of fetching meal
#        # 平均取餐点误差
#        # 计算方法：
#        # 基于beacon的取餐点误差 = ||骑手取餐时基于beacon定位的经纬度-店铺经纬度||*100000
#        # 基于GPS的取餐点误差 = ||骑手取餐时基于beacon定位的经纬度-店铺经纬度||*100000
#        beacon_arrive_error = []
#        gps_arrive_error = []
#        for i in range(0,len(beacon_lat)):
#            beacon_lat_delta_sqr = (shop_lat - beacon_lat[i])*(shop_lat - beacon_lat[i])
#            beacon_lon_delta_sqr = (shop_lon - beacon_lon[i])*(shop_lon - beacon_lon[i])
#            gps_lat_delta_sqr = (shop_lat - GPS_lat[i])*(shop_lat - GPS_lat[i])
#            gps_lon_delta_sqr = (shop_lon - GPS_lon[i])*(shop_lon - GPS_lon[i])
#            beacon_arrive_error.append(math.sqrt(beacon_lat_delta_sqr+beacon_lon_delta_sqr)*100000)
#            gps_arrive_error.append(math.sqrt(gps_lat_delta_sqr+gps_lon_delta_sqr)*100000)
#        
#        avg_beacon_arrive_error = np.mean(beacon_arrive_error)
#        avg_gps_arrive_error = np.mean(gps_arrive_error)
#        
#        evl_avg_beacon_arrive_error.append(avg_beacon_arrive_error)
#        evl_avg_gps_arrive_error.append(avg_gps_arrive_error)
        
        
  

      
#        print("beacon_lat: ",beacon_lat)
#        print("beacon_lon: ",beacon_lon)        
#        print("GPS_lat: ",GPS_lat)
#        print("GPS_lon: ",GPS_lon)
#        print("avg_beacon_arrive_error: ",avg_beacon_arrive_error)
#        print("avg_gps_arrive_error: ",avg_gps_arrive_error)
        
  

      
#        # Average variance of position of fetching meal
#        # 取餐点方差
#        # 计算方法：直接np.var
#        beacon_arrive_pos = []
#        gps_arrive_pos = []
#        for i in range(0,len(beacon_lat)):
#            beacon_arrive_pos.append([beacon_lat[i],beacon_lon[i]])
#            gps_arrive_pos.append([GPS_lat[i],GPS_lon[i]])
#        # Position Var                            
#        #var_beacon_arrive = np.var(beacon_arrive_pos)
#        #var_gps_arrive = np.var(gps_arrive_pos)        
#        # Error Var
#        # var_beacon_arrive = np.var(beacon_arrive_error)
#        # var_gps_arrive = np.var(gps_arrive_error)        
#        #print("beacon_arrive_pos: ",beacon_arrive_pos)
#        #print("gps_arrive_pos: ",gps_arrive_pos)        
#        #print("var_beacon_arrive: ",var_beacon_arrive)
#        #print("var_gps_arrive: ",var_gps_arrive)
#        evl_var_beacon_arrive.append(var_beacon_arrive)
#        evl_var_gps_arrive.append(var_gps_arrive)
        
        
       
        
        # Indoor ratio
        # 室内比例
        # 基于beacon的室内点比例 = 位于室内的beacon数据点个数／总beacon数据点个数
        # 基于gps的室内点比例 = 位于室内的gps数据点个数／总gps数据点个数
        # 是否室内的判断依据为
        # （是否室内很难用经纬度来卡，这个指标先放弃）
        
        # Power Distribution Pass Ratio
        # Power 分布通过率
        # powerlaw那个库没有直接进行假设检验的函数，所以暂时没法算
        # import powerlaw as pl
        # fit_beacon = pl.Fit(speed_beacon)
        # pl.plot_pdf(speed_beacon,color='b')
        
        print(" ")
    
    return evl_avg_beacon_arrive_error, evl_avg_gps_arrive_error,\
evl_var_beacon_arrive,evl_var_gps_arrive,\
evl_beacon_static_ratio, evl_gps_static_ratio, evl_exception_tuple,\
evl_exception_minor,total_order_num,total_check_in_fail_num,evl_avg_check_in_time_diff