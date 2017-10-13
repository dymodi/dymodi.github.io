--- 
layout: post
title: 2018 MobiSys Paper Outline
date: Oct. 12, 2017
author: Yi DING
---

[comment]: # (This is the outline 2 for the 2018 MobiSys paper)

NOTE: This the second version of the draft.
 
## 1 INTRODUCTION

[comment]: # (The importance of the problems addressed)
[comment]: # (The novelty of the proposed solutions)
[comment]: # (The technical depth)
[comment]: # (The potential impact)

**(The problem we want to solve: Some key and practical problems met exclusively in the food delivery system)**


## 2 Motivation
A practical food delivery is a complex system with many constraints and objectives. The food needs to be delivered usually within 30 minutes to guarantee the quality of the food. Time-out will also be punished with penalites for both platform and riders. The delivery time is the key point in the system: the platform needs to estimate the time for dispatching, the rider wants to take as many orders as possible within the time constraints, and the customers want their meal to be delivered as soon as possible. However, simple estimation methods  is not apfor food delivery system due to many pracitical isses: (1) The physical distance of two POI does reflects the time needed from one place to the other due to differnt floors and building layouts; (2) The time needed to prepare the meal varies from restaurant; (3) The time needed for the rider to travel between POIs varies with the rider's age and familiarity with the POIs (4) External factors such as weather and rush hour also affects the delivery time to some extent.


## 3 System Overview
The system overview can be seen in the Figure 1.
<p align = "center">
<img src="figures/system-overview-2.png"  alt="system overview">
</p>

## 4 Application Layer
We can build the following applications based on our system: (1) Rider Behavior Prediction; (2) Delivery Time Estimation; (3) POI Correction; (4) Risk Control; (5) Dynamic Pricing; (6) Hub-based Delivery.

### 4.1 Rider Behavior Prediction
The rider behavior prediction will be conduct based on Bayesian estimation.

## 5 Model Layer (Time-based Multi-Dimension Delivery Map)
This is the main contribution of this paper. In the model layer, we build a time-based multi-dimenion delivery map to handle the complex problems met in delivery problem. The map will be built in the machine learning paradigm and update dynamically. 

There are two types of vertices in the map: restaurant and customer. Each vertex is a high dimensional representation of the object. The features are categorized into following types: rider features, restaurant features, customer features, order features and other features.

## 6 Data Layer (Data Processing)
In the data processing layer, data from different platforms are clustered, decoded and fused for the upper layer.

## 7 Physical Layer (Data Collection)
Physical layer is the bottom layer of the system and is responsible for collecting data from physical world.



    Solution: Multi-Dimensional Time-based Map
    Two parts of the map: (1) What is the possibility of each node for the next step? (Bayesian Estimation)
    (2) How long it will take to go there? (Logistic regression)

