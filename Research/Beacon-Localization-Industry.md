--- 
layout: post
title: A Industry Implementation of Beacon Localization
date: June 27, 2017
author: Yi DING
---

[comment]: # (This blog compose the IMPLEMENTATION section of future paper)
In this blog, we will discuss an industry implementation of indoor localization based on beacon. Basically, we have done three things: 
1. Weighting based on RSSI
2. Averaging with a window
3. Limiting the step size

## Weighting based on RSSI
Usually a device can hear multiple beacons at the same time. In order to let the algorithm to be simple and robust, we are not using a trilateration method. Instead, we use the location of the beacon as the proxy of the location of the device and weighting them according to the RSSI of the signal from each beacon. The weight is definde as follows:

$w=\exp(\alpha*r')$

## Averaging with a window
Since the RSSI surfers from high fluctuation, we cannot use the RSSI value at a specific time to do the localization. Instead, we use a window to averaging the RSSI data. For example, we set the window as 10 seconds.


## Limiting the step size
In some beacon-sparse environment, if the device moves around the middle between two isolated beacons. The algorithm will think that the device moves between two beacons very quickly, which is not applicable in real world. The simplist way to handle the situation is to limit the step size during calculation. That is, after we compute the step size, we use a threshold velocity to check the calculated values. If the calculated velocity is faster than the threshold, we will limit the distance to a acceptable value. The the direction of the step will be kept, but the distance will be limited. 

The specific value of the threshold remains a good question. Currently we are using 8 m/s. We think this value can be further reduced even if we consider the device is taken by a man who is running.