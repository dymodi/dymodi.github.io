---
layout: post
title: Falcon: Detection of Inaccurate POI Information and Rider Cheating in Food Delivery System
date: Jan. 26, 2017
author: Yi DING
---

(This is the outline 1 for the Falcon paper for Fandian for MobiCom 2018)

# Falcon: Detection of Inaccurate POI Information and Rider Cheating in Food Delivery System

Based on the discussion with Professor, this paper should be a structure describing Fandian project. Also, this paper should be within the scope of Fandian, that is, topics like dispatching, time estimation should not be included.

The potential topics are:

1. Inaccurate POI information detection and correction.
2. Rider cheating (false reporting, fake GPS position).


## 1 INTRODUCTION

* The importance of the problems addressed
* The novelty of the proposed solutions
* The technical depth
* The potential impact

**(The background of food delivery system)**


**(Challenges and motivations)**
* Rider dispatching and delivery time estimation are both relied on accurate POI information and rider postioning, which can be inaccurate or faked on purpose.
* POI information relied on self-report without verification. People may make mistake or fake POI information.
* Rider positioning relies on GPS and rider labeling (arrive restaurant, delivered). There is no GPS signal indoor and rider might fake GPS signal for profit.
* Current indoor positioning methods either relies accurate indoor map or accurate human labeling, which is lacking in real world environment. Also, empirical RSSI formula is not applicable due to uncontrollable deployment situationa and variety of hardware module.
* Many unique problems in food delivery system: order switching, rider's farmiliriaties with the area.

**(Our solution)**
* Large scale BLE beacons deployment as pre-binding anchors.
* Potential inaccurate POI information and rider cheating detection based on data inconsistency detection and anomaly detection.
* POI correction based on clustering and optimization.
* Rider behavior analysis based on Bayesian estimation.

**(The contribution of this paper)**


## 2 Motivation
**(Challenges and motivations)**


## 3 System Overview