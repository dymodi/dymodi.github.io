--- 
layout: post
title: Real-Time Arrival Departure Detection
date: Feb. 4, 2018
author: Yi DING
---

[comment]: # (A blog discuss real time detection, also as a section of the paper)

In the [beacon filtering blog](https://dymodi.github.io/Research/Beacon/Beacon-Filtering), we discuss the arrival and departure detection using filtering. However, this method is an off-line method based on the entire dataset. While in some scenarios, such as rider dispatching, we need real time information of people's arrival and departure at some indoor spots.

In this post,  we discuss real time arrival departure detection using beacon RSSI data. We will illustrate several techniques to achieve this.

## Short range low pass filter
For the short range low pass filter method, we assign a low pass filter to each rider-shop-pair and move the filter as time goes on.

For a specific (rider, shop) pair, the RSSI values are as follows

<center> 
    <img src="figures/rssi-for-specific-shop-10-minutes.png"  alt="Rider-Shop-Pair">
</center>

