#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun 13 20:07:14 2017

@author: eleme-yi
"""

import matplotlib.pyplot as plt
import datetime
import json

from process import getRssiData
from process import detArrDptVer1
from process import ini_beacon_info
from process import getRssiDataByUser
from process import getSubBeaconData
from process import beacon2GPS
from process import buildGraph
from process import findWrongBeacon
from process import writeToFile
from process import getRssiDataByUserByBeacon
from process import arrivalDetect
from process import locationQuery
from process import getArrTimeFromInsOrder
from process import get_location_by_shop_id
from date_shop_rider_dict import date_shop_to_rider
from process import beacon_item
from process import cal_sim_index
from process import getBeaconPos
from process import timeAdd
from process import writeToArvFile
from process import get_check_in_location
from process import talaris_get_check_in_location
from process import draw_check_in
from process import draw_trace
from process import beacon2GPS_talaris
from process import read_raw_talaris_file
from process import talaris_ini_beacon_info
from process import get_beacon_by_minor
from process import calDist
from process import time_delta
from process import trace_time_align
from process import draw_trace_three
from process import generic_trace_draw
from process import get_exceptional_shops

uuid = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"

# This is a test script
# rssi, inShop, strtTime, endTime = getRssiData("myTest0612",2,1,-1)
# detArrDptVer1(rssi, inShop, strtTime, endTime)

## Here we find the wrong beacons based on the rider data and beacon mapping
#rider_id = 39
#beacon_info = ini_beacon_info("restaurant-beacon-mapping")
#rider_beacon = getRssiDataByUser("test_gps",rider_id)
#beacon_graph = buildGraph(rider_beacon,beacon_info)
#findWrongBeacon(beacon_graph)


## Choose a shop
#shop_id = 240
#date = datetime.date(2017,8,18)
#
## Here we find the trace of the rider
#rider_id = 39                                # Specify a rider
## rider_id = date_shop_to_rider[date][shop_id]          # Find a corresponding rider
#startTime = [10,00,00]
#endTime = [13,00,00]
#beacon_file = '_'.join(['data/beacon/test_gps',str(date),str(rider_id)])
#beacon_info = ini_beacon_info("restaurant-beacon-mapping")
#rider_beacon = getRssiDataByUser(beacon_file,rider_id,startTime,endTime)
#trace_latitude,trace_longitude,trace_floor,trace_timeStamp,trace_GPS_latitude,\
# trace_GPS_longitude = beacon2GPS(rider_beacon,beacon_info)
#trace_name = '_'.join(['trace/rider_trace',str(date),str(rider_id),str(startTime)])
#writeToFile(trace_name,trace_latitude,trace_longitude,\
#            trace_floor,trace_timeStamp, trace_GPS_latitude, \
#            trace_GPS_longitude, rider_id, date)
#
#
## Here we decide whether a rider arrive or not
#beacon_lat,beacon_lon,beacon_floor,GPS_lat,GPS_lon,arr_order,arr_time = \
#get_check_in_location(date,rider_id,shop_id,startTime,endTime)
#shop_lat, shop_lon, shop_floor = get_location_by_shop_id(shop_id)
#draw_check_in(beacon_lat,beacon_lon,GPS_lat,GPS_lon,shop_lat, shop_lon,\
#                 date,shop_id,rider_id,arr_order,arr_time,shop_floor,beacon_floor)


# Here we test to read data from talaris file
# Shenzhen
# date = datetime.date(2017,8,25)
# rider_id = 10391078
# shop_id = 639184 


# Shanghai RiYueGuang
# date = datetime.date(2017,8,25)
# rider_id = 10747144
# shop_id = 1879109


date = datetime.date(2017,9,3)
rider_id = 10384072
shop_id = 639184

# Get trace from talaris data
talaris_file = '_'.join(['data/talaris/all_talaris',str(date),str(rider_id)])
trace_lat,trace_lon,trace_floor,trace_time,trace_GPS_lat,trace_GPS_lon = \
beacon2GPS_talaris(talaris_file)

# Shanghai Jintie
# center_lat = 31.2325
# center_lon = 121.381895

# Shanghai Riyueguang
# center_lat = 31.2071
# center_lon = 121.4682

uuid = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"

beacon_info = ini_beacon_info("restaurant-beacon-mapping")
beacon_info = talaris_ini_beacon_info("data/others/all_restaurant_beacon_mapping",\
                                      beacon_info)

raise Exception("Debug")

# Auto get center
center_lat = trace_lat[0]
center_lon = trace_lon[0]

startTime = [9,50,0]
duration = 20
timeBound = [18,50,0]

# draw_trace(center_lat, center_lon, trace_lat,trace_lon,trace_GPS_lat,\
#            trace_GPS_lon,trace_time,startTime,timeBound,duration,rider_id,date)

raw_talaris_file = '_'.join(['data/talaris/raw_talaris',str(date),str(rider_id)])
beacon_data_all, strtTime, endTime = read_raw_talaris_file(raw_talaris_file,'all')
beacon_data_zs, strtTime, endTime = read_raw_talaris_file(raw_talaris_file,'zs')
beacon_data_rs, strtTime, endTime = read_raw_talaris_file(raw_talaris_file,'rs')


# Compute trace with my own algorithm
raw_trace_lat_all,raw_trace_lon_all,raw_trace_floor_all,raw_timeStamp_all,\
raw_trace_GPS_lat_all,raw_trace_GPS_lon_all = beacon2GPS(beacon_data_all,beacon_info)

# Compute trace with my own algorithm
raw_trace_lat_zs,raw_trace_lon_zs,raw_trace_floor_zs,raw_timeStamp_zs,\
raw_trace_GPS_lat_zs,raw_trace_GPS_lon_zs = beacon2GPS(beacon_data_zs,beacon_info)

# Compute trace with my own algorithm
raw_trace_lat_rs,raw_trace_lon_rs,raw_trace_floor_rs,raw_timeStamp_rs,\
raw_trace_GPS_lat_rs,raw_trace_GPS_lon_rs = beacon2GPS(beacon_data_rs,beacon_info)

## Compare zs and rs beacon 
#all_trace_lat = [raw_trace_lat_zs,raw_trace_lat_rs]
#all_trace_lon = [raw_trace_lon_zs,raw_trace_lon_rs]
#all_trace_flr = [raw_trace_floor_zs,raw_trace_floor_rs]
#all_trace_time = [raw_timeStamp_zs,raw_timeStamp_rs]

# Compare GPS and beacon
all_trace_lat = [trace_GPS_lat,trace_lat]
all_trace_lon = [trace_GPS_lon,trace_lon]
all_trace_flr = [trace_floor,trace_floor]
all_trace_time = [trace_time,trace_time]

# Generic trace draw
generic_trace_draw(center_lat,center_lon,2,all_trace_lat,all_trace_lon,all_trace_flr,\
                      all_trace_time,startTime,timeBound,duration,rider_id,date)


#raw_lat_shrk,raw_lon_shrk,raw_flr_shrk = \
#trace_time_align(trace_time,raw_timeStamp,raw_trace_lat,raw_trace_lon,raw_trace_floor)


## Draw our trace
#draw_trace_three(center_lat, center_lon, trace_lat,trace_lon,\
#               trace_GPS_lat,trace_GPS_lon,raw_lat_shrk,\
#               raw_lon_shrk,trace_time,startTime,\
#               timeBound,duration,rider_id,date)



beacon_num_our = 0
beacon_num_other = 0

for beacon in beacon_data_all:
    if beacon.uuid == "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0":
        beacon_num_our = beacon_num_our + 1
    else:
        beacon_num_other = beacon_num_other + 1
        

beacon_lat,beacon_lon,beacon_floor,GPS_lat,GPS_lon,arr_order,arr_time = \
talaris_get_check_in_location(date,rider_id,shop_id,startTime,endTime)        

shop_lat, shop_lon, shop_floor = get_location_by_shop_id(shop_id)

draw_check_in(beacon_lat,beacon_lon,GPS_lat,GPS_lon,shop_lat, shop_lon,\
                 date,shop_id,rider_id,arr_order,arr_time,shop_floor,beacon_floor)




#beacon_graph = buildGraph(beacon_data,beacon_info)

delta = 1
distance = 200
exception_tuple, exception_minor = get_exceptional_shops(delta,distance,\
                                                         beacon_data_all,beacon_info)                             
            
    


#rider_id = 141
#major = 16160
#minor = 1138
#rider_beacon = getRssiDataByUserByBeacon("test_arrive",rider_id,uuid,major,minor)
#isInShop, timeStamp = arrivalDetect(rider_beacon)
#
#plt.plot(isInShop,'c-',label='InShop')
#plt.title('InShop')
#plt.legend()
#plt.show()
#plt.clf()

#import gmplot
#gmap = gmplot.GoogleMapPlotter(31.2325, 121.381895, 16)
#gmap = gmplot.from_geocode("Shanghai")
#gmap.plot(trace_latitude, trace_longitude, 'red', edge_width=10)
#gmap.scatter(more_lats, more_lngs, '#3B0B39', size=40, marker=False)
#gmap.scatter(trace_latitude, trace_longitude, 'red', marker=True)
#gmap.heatmap(heat_lats, heat_lngs)
#gmap.draw("trace/mymap.html")

#beacon1 = beacon_item()
#beacon1.uuid = "ECB33B47-781F-4C16-8513-73FCBB7134F2"
#beacon1.major = 23135
#beacon1.minor = 27275
#
#beacon2 = beacon_item()
#beacon2.uuid = "AB8190D5-D11E-4941-ACC4-42F30510B408"
#beacon2.major = 10024
#beacon2.minor = 6482
#
#beacon3 = beacon_item()
#beacon3.uuid = "ECB33B47-781F-4C16-8513-73FCBB7134F2"
#beacon3.major = 23135
#beacon3.minor = 27208
#
#
#test_beacons = [beacon1,beacon2,beacon3]
#
#sim_mat,sco_mat = cal_sim_index("data/beacon/all_beacon_2017-07-06_433",test_beacons)


## Test how to get the position of the beacon
#uuid = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"
#major = 2
#minor = 1
## method = 2
#rider_id = -1
#date = datetime.date(2017,7,17)
#startTime = [16,20,0]
#duration = 25
#endTime = timeAdd(startTime, duration)
#timeBound = [16,50,0]
## beacon_file = '_'.join(['data/beacon/test_gps',str(date),str(rider_id)])
#beacon_file = "myTest0622"
#
#beacon_lat_2, beacon_lon_2, beacon_floor, beacon_lat_real, beacon_lon_real = \
#getBeaconPos(beacon_file,rider_id,uuid,major,minor,startTime,endTime,2)
#
#beacon_lat_3, beacon_lon_3, beacon_floor, beacon_lat_real, beacon_lon_real = \
#getBeaconPos(beacon_file,rider_id,uuid,major,minor,startTime,endTime,3)