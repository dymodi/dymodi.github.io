--- 
layout: post
title: Motivation for the XX
date: June 21, 2017
author: Yi DING
---

[comment]: # (This blog compose the MOTIVATION section of future paper)

Here we list some motivations for our system, basically are some observations from the real world applications.

## Fluctuation in Indoor Trace
Based on the fluctuation in indoor trace, we realize the influence brought by inaccurate landmark information.


## Unknown Beacon Detected
In one of our in-field experiments, we deployed 50 beacons in a mall and intergrate the beacon detection function in the rider's APP. However, since Android device can detect the beacons without knowing the UUID ahead (iOS has this restriction), we found that some other beacons that is not deployed by us are also detected. Although we can ignore these data, but we came to realize that this data can be used to assist our system and improve the localization accuracy.