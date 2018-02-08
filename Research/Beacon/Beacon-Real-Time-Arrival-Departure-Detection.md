---
layout: post
title: Real-Time Arrival Departure Detection
date: Feb. 4, 2018
author: Yi DING
---

# Real-Time Arrival Departure Detection

## Why "Arrival/Departure Detection" instead of "Indoor Localization"
* Localization needs multiple beacon deivces installed nearby, which is not applicable in real world for large scale applcaition like city-range food delivery system.
* RSSI fluctuation makes BLE beacon not suitable for indoor localization. This is also supported by our experiment as well as Apple's claim in the technique report.

## Why not simple filtering
In the [beacon filtering blog](https://dymodi.github.io/Research/Beacon/Beacon-Filtering), we discuss the arrival and departure detection using filtering. However, this method is an off-line method based on the entire dataset. While in some scenarios, such as rider dispatching, we need real time information of people's arrival and departure at some indoor spots.

In this post,  we discuss real time arrival departure detection using beacon RSSI data. We will illustrate several techniques to achieve this.

## Short range low pass filter
For the short range low pass filter method, we assign a low pass filter to each rider-shop-pair and move the filter as time goes on.

For a specific (rider, shop) pair, the RSSI values are as follows

<figure>
<img src="figures/rssi-for-specific-shop-10-minutes.png"  alt="Rider-Shop-Pair">
<figure>

We can design a low pass filter based on what we have discussed in the [beacon filtering blog](https://dymodi.github.io/Research/Beacon/Beacon-Filtering):
(some mathmatical formula)

After the filter and shaving, the result are as follows:


This method can give us an accurate method, but can too complicated to maintain, given tens of thousands of riders and restaurants working at the same time. That is, we need some more light-weight application that can achieve arrival/departure detection.

## Light weight arrival/departure detection algorithm
