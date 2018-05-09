---
layout: post
title: A Industry Implementation of Beacon Localization
date: June 27, 2017
author: Yi DING
---

In this blog, we will discuss an industry implementation of indoor localization based on beacon. Basically, we have done three things: 
1. Weighting based on RSSI
2. Averaging with a window
3. Limiting the step size

## Weighting based on RSSI
Usually a device can hear multiple beacons at the same time. In order to let the algorithm to be simple and robust, we are not using a trilateration method. Instead, we use the location of the beacon as the proxy of the location of the device and weighting them according to the RSSI value of the signal from each beacon. The weight is defined as follows:

\\[w=\exp(\alpha*RSSI)\\] 

since there is a exponential relation between RSSI and distance ( [4] [7] in [Related Works](https://dymodi.github.io/Research/Beacon-Localization-Related-Works) )

## Averaging with a window
Since the RSSI surfers from high fluctuation, we cannot use the instant RSSI value to do the localization. Instead, we use a window to averaging the RSSI data. For example, we can set the window as 10 seconds. A longer window size will make the trace more smooth, while a shorter window size can provide better real-time performance.


## Limiting the step size
In some beacon-sparse environment, if the device moves around the middle between two isolated beacons. The algorithm will think that the device moves between two beacons very quickly, which is not applicable in real world. The simplist way to handle the situation is to limit the step size during calculation. That is, after we compute the step size, we use a threshold velocity to check the calculated values. If the calculated velocity is faster than the threshold, we will limit the distance to a acceptable value. The the direction of the step will be kept, but the distance will be limited. 

The specific value of the threshold remains a good question. Currently we are using 8 m/s. We think this value can be further reduced even if we consider the device is taken by a man who is running.