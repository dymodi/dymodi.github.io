--- 
layout: post
title: Notes on Beacon Paper
date: Sept. 19, 2017
author: Yi DING
---

[comment]: # (This is the notes on the beacon paper)

## Idea to be Discussed
1. Deep Reinforcement Learning can be used in predicting rider's future bahavior.

## To Do List
* Articulate the uniqueness of time estimation in food delivery system.
* Find some related work of POI correction.            (Almost Done)
* Define a metric to measure the accuracy of the POI.  (Done) 

Long Term:
Know something about what they are doing in machine learning group


## Progress Record
10/24
1. Is it possible to use Deep Reinforcement Learning in order dispatching?
2. Rider's decision is related to both distance and order. We are building this relation.

10/23
1. Try use event table to extrace the single rider's travelling time between restaurants.
2. Use the data to do regression.

10/19
1. Fail to estimate time between restaurant and restaurant in the time map (rr edge), possiblely due to inaccurate raw data casued by inaccurate POI data. 
2. Try to estimate cc edge.


## Discussion with Professor
10/25 
1. Focus on the Time-based Delivery Map. The system overview should be only on this part.
2. Applications should only be discussed in the Introduction.
3. Data Processing should be discussed in the Discussion part.
4. Data Collection should be discussed in the Implementation part.
5. Two main part: edge estimation, point estimation.
6. Clarify challenges: spatial and temporal data missing and error. Spatial inconsistency can be corrected using POI correction. Temporal inconsistency can be corrected using other methods.
7. POI correction must be included in this paper.
8. We should articulate the difference with other time estimation methods.

2. New idea: Data Complementing in Rider System. (Tackeling base data problem (missing value and unreliable value). Performance can be evaluated using standard ML algorithm.)(Data redundancy and data validation.)

10/12
1. The Introduction draft 1 is rejected by the professor. Indoor localization is no more a meaningful topic for MobiSys, we have to find another story.
2. We can start from the (food) delivery system and find some practical problem to solve.
3. For example, due to complex indoor structure and layouts, it's not enough to consider only latitude/longitude and floor. We need to find the "distance" in terms of delivery in a higher dimension.
(Possible feature: latitude/longitude, floor, weather, time(hour), rider age)
4. We can ignore indoor localization or make it as a small component.

10/10
1. About the outline, the structure is ok. But we need to dig more and deeper.
2. What is the main challenge? Scale? Food delivery?
3. Maybe I can search some paper and find the challenges and tell a good story. That is, make a tentative introduction.

10/09
1. Prepare for the 2018 MobiSys (12/08 DDL). I will prepare an outline in this week. 

09/21
1. In future deployment, the transmission power will be reduced so that it can only be heared within the shop.
2. Based on 1. each beacon data can match to a POI. What we care is not multiple beacons heared at the same time, but the time difference between each 

09/20
1. Discover and Solve the advanced problem by removing the assumptions. For example, if we do not assume that rider are walking at a constant speed (1m/s) indoor, the problem will become more complexity.
2. Find some other topics and reach out to other people. Turn to PMO for help.

09/19
1. Location correction has been studies many years ago, so it's not a good idea to wirte a paper only on POI correction.
2. For algorithm and related work of location correction, please read Hwang's 2007 paper.
3. The main idea of my paper should be "We build a large scale real world indoor localization system basede on iBeacon protocol. In building this system, we met the following pracitcal problems and address them with novel methods."
4. Currently we have the following topics: "POI correction", "Security", "Risk Control". I can work on these topics and come up with new ones recently.

## Potential Topics
* Delivery Map based on Time
* AOI Recongization based on delivery map
* POI Correction
* Security/Authentication
* Risk Control
* Auto check-in (Similar to Existence Detection)
* Dispatching(Traditional and Fetch Delivery Seperation)