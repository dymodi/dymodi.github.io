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

## Limiting the step size