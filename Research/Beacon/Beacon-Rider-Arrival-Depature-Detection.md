--- 
layout: post
title: The Arrival and Depature Detection of Riders based on Beacon
date: Sept. 26, 2017
author: Yi DING
---

[comment]: # (Blog for rider's arrival detection)

## Background
We have discussed the arrival and depature detection before ([here](https://dymodi.github.io/Research/Beacon/Beacon-Filtering)), now we consider a specific case: rider, or courier.

## Assumption
As we know from [Beacon facts](https://github.com/dymodi/dymodi.github.io/blob/master/Research/Beacon/Beacon-Basic-Facts.md), the rider can be considered at (within 10 meters) the POI if the RSSI value is greater than -75dB. Hence the rider is considered arriving at the POI the first time he/she receive the POI broadcast data with RSSi > -75dB. The rider is considered leaving the POI the last time he/she receive the POI broadcast data with RSSi > -75dB.


## Sample Data
Date = 10/10/17, Rider ID = 10485410, 




[comment]: # (The old version where we only consider shop with orders)
[comment]: # (## Assumptions)
[comment]: # (1. The rider will be considered as *arrival* of a shop when he come near to the shop's beacon *and* he has an delivery order for this shop with him.)
[comment]: # (## Implementation)
[comment]: # (First, we need to select the orders from the shops with beacon and delivered by the riders with beacon data.)