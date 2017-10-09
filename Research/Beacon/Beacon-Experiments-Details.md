--- 
layout: post
title: Experiments Details
date: June 21, 2017
author: Yi DING
---

[comment]: # (This blog compose the EXPERIMENTS section of future paper)


## In-field experiment
50 Beacons are deployed in 50 restaurants in one of the largest malls in Shanghai. The beacon in each restaurant is place near the door or checkout where riders and customers might stay.

The beacon detection function is integrated within the rider's APP. 
(Here we need more details about the APP)

The beacon signal is detected every second, but the data is uploaded to the server every 5 seconds to reduce the data traffic. Therefore for each data entry, there are two timestamp: the local timestamp when the device receives the signal, and the sever timestamp when the server receive the data from the device. Here we use the local timestamp and assume that the local time is accurate.