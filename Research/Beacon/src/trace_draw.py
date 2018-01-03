#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jun 28 12:27:43 2017

In this program we compare the beacon trace and GPS trace of a given rider
on a given date from a given startTime to a given endTime at a given interval

@author: eleme-yi
"""


import matplotlib.pyplot as plt
import gmplot
import datetime

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
from process import timeAdd
from process import time_delta
from myTest0718 import trace_latitude_truth
from myTest0718 import trace_longitude_truth

uuid = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"


# rider_id = 276
rider_id = -1
date = datetime.date(2017,9,18)
startTime = [14,00,0]
duration = 60
endTime = timeAdd(startTime, duration)
timeBound = [17,00,0]
beacon_info = ini_beacon_info("restaurant-beacon-mapping")
while time_delta(timeBound,endTime) > 0:
    print("StartTime: ",startTime)
    # My test file
    #beacon_file = "myTest0714"
    # Rider's test file
    beacon_file = '_'.join(['data/beacon/test_gps',str(date),str(rider_id)])
    rider_beacon = getRssiDataByUser(beacon_file,rider_id,startTime,endTime)
    trace_latitude_2,trace_longitude_2,\
    trace_floor,trace_timeStamp,trace_GPS_latitude,\
    trace_GPS_longitude = beacon2GPS(rider_beacon,beacon_info)
    print("Trace Done.")
    if len(trace_latitude_2) == 0 :
        print('No trace in current interval.')
        startTime = endTime
        endTime = timeAdd(endTime, duration)
        continue
    gmap = gmplot.GoogleMapPlotter(31.2325, 121.381895, 16)
    #gmap = gmplot.from_geocode("Shanghai")
    gmap.plot(trace_latitude_2, trace_longitude_2, 'blue', edge_width=10)
    gmap.scatter(trace_latitude_2, trace_longitude_2, 'blue', marker=True)
    # gmap.plot(trace_latitude_3, trace_longitude_3, 'yellow', edge_width=10)
    # gmap.scatter(trace_latitude_3, trace_longitude_3, 'yellow', marker=True)
    # gmap.plot(trace_GPS_latitude, trace_GPS_longitude, 'red', edge_width=10)
    # gmap.scatter(trace_GPS_latitude, trace_GPS_longitude, 'red', marker=True)
    # gmap.plot(trace_latitude_truth, trace_longitude_truth, 'maroon', edge_width=10)
    # gmap.scatter(trace_latitude_truth, trace_longitude_truth, 'maroon', marker=True)
    hs1 = str(startTime[0])
    hm = str(startTime[1])
    hs2 = str(startTime[2])
    comma = ':'
    time = comma.join([hs1,hm,hs2])
    sep = '_'
    fileName = sep.join(["trace/trace_comp",str(rider_id),str(date),time,".html"])      
    gmap.draw(fileName)
    print("plot done")
    startTime = endTime
    endTime = timeAdd(endTime, duration)