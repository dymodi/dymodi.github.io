---
layout: post
title: Clairvoyant: Towards Fast and Efficient Food Delivery System with Accurate Indoor Localization
date: Jan. 30, 2017
author: Yi DING
---

Comments from Professor:
1. Emphasize this is a major effort in deploying BLE for indoor tracking.  
2. Although using beacon is not new,  it is new to have such a large deployment.  
3. This first paper should be **an overview of the system and explain why indoor tracking is critical for food delivery**.  
4. Then we discuss a few challenges we face including beacon location, POI, cheating etc. Objective should be making food delivery efficient, fast with better location information.
5. This paper should be a structure describing Fandian project. Also, this paper should be within the scope of Fandian, that is, topics like dispatching, time estimation should not be included.

Further comments from Professor:
1. We need to think a similar concept (IODetection) and build on top of that.
2. You need to accumulate enough technical design elements.  I did not see that level of details at all. It is still unclear to me what is the technique you will use to detection POI inconsistency etc.

# Clairvoyant: Towards Fast and Efficient Food Delivery System with Arrival/Depature Detection of Riders

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
In recent years, with the prevalence of the mobile Internet and sharing economy, online food ordering and delivery becomes a prosperous market. Driven by the mobile Internet technololy, a new business model is emerging with a centralized platform serving customers, restaurants and riders at the same time [][][]. Restaurants can operate online shops on the platform and accept orders while customers can choose from plenty of restaurants nearby from the cellphone APP provided by the platform. The food delivery tasks will be dispatched to registered and crowdsourced riders according to their location and destination. As the platform provides convenient service for all three sections, some problems also restrain the platform from achieving high efficiency dispatching. The most critical problem is to estimate the rider's travelling time among restaurants and customers. The estimation must be tight because food must be delivered within limited time (usually within 30 minutes) for fresh quality and the time-out case would be punished with costs.



**(Challenges and motivations)**
* As a service industry, food delivery is pursuing faster delivery speed and higher quality service.
* Riders' location information plays critical roles in food delivery system.
* Riders' location is lacking for indoor environment.
* Challenges in practical indoor localization for delivery system.

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

## 4 Large Scale Beacons Deployment in Real World

### 4.1 BLE Beacon Hardware

### 4.2 Receiving End on Riders' Cellphone

### 4.3 Parameter Tuning

### 4.4 Security Issue 


## 5 Arrival/Depature Detection

## 6 Data Fusion

