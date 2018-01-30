--- 
layout: post
title: Clairvoyant: Towards Fast and Efficient Food Delivery System with Accurate Indoor Localization
date: Jan. 30, 2017
author: Yi DING
---

[comment]: # (This is the outline 1 for the Falcon paper for Fandian for MobiCom 2018)

Comments from Professor:

I feel that we still need to emphasize this is a major effort in deploying BLE for indoor tracking.  Although using beacon is not new,  it is new to have such a large deployment.  I believe this first paper should be **an overview of the system and explain why indoor tracking is critical for food delivery**.  Then we discuss a few challenges we face including beacon location, POI, cheating etc.  Objective should be making food delivery efficient, fast with better location information.  "

# Clairvoyant: Towards Fast and Efficient Food Delivery System with Accurate Indoor Localization

Based on the discussion with Professor, this paper should be a structure describing Fandian project. Also, this paper should be within the scope of Fandian, that is, topics like dispatching, time estimation should not be included.

Things should be included:
1. Explain why indoor tracking is critical for food delivery.
2. Overview of our system.
3. Challenges in building the system: beacon location, inaccurate POI, rider cheating(false reporting, fake GPS position)
4. Our solution to the challenges.


## 1 INTRODUCTION

* The importance of the problems addressed
* The novelty of the proposed solutions
* The technical depth
* The potential impact

**(The background of food delivery system)**


**(Challenges and motivations)**
* As a service industry, food delivery is pursuing faster delivery speed and higher quality service.
* Riders' location information plays critical roles in food delivery system.
* Riders' location is lacking for indoor environment.
* Challenges in practical indoor localization system.

**(Our solution)**
* Large scale deployment of BLE beacons at each POI
* Add beacon receiving function in riders' APP on cellphone
* Rider localization based on BLE beacons (trilateration, arrival/depature detection)
* Data fusing with GPS data, order data and POI data
* Data inconsistency detection to find out inaccurate POI and rider cheating

**(The contribution of this paper)**


## 2 Motivation
**(Challenges and motivations)**
* As a service industry, food delivery is pursuing faster delivery speed and higher quality service.
    * Amazon food, Uber EAT, ELE.ME (Make every thing 30 minutes.)
* Riders' location information plays critical roles in food delivery system.
    * Rider dispatching and delivery time estimation are both relied on accurate POI information and rider postioning.
* Riders' location is lacking for indoor environment.
    * Rider positioning relies on GPS and rider labeling (arrive restaurant, delivered). There is no GPS signal indoor and rider might fake GPS signal for profit.
* Challenges in practical indoor localization system.
    * POI information relied on self-report without verification. People may make mistake or fake POI information.
    * Current indoor positioning methods either relies accurate indoor map or accurate human labeling, which is lacking in real world environment. Also, empirical RSSI formula is not applicable due to uncontrollable deployment situationa and variety of hardware module.
    * Many unique problems in food delivery system: order switching, rider's farmiliriaties with the area.

## 3 System Overview