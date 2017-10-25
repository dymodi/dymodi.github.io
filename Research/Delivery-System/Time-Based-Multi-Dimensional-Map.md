--- 
layout: post
comments: false
title: Time-based Multi-Dimension Map
date: Oct. 16, 2017
author: Yi DING
---

[comment]: # (This post introduce the time-based mult-dimensional map)

# Time-based Multi-Dimension Map

## Background
In traditional navigation system, the distance based map is used with latitude and longitude as axis. However, in many applications, we care more abut the travelling time needed between vertices but not distance. Moreover, many other factors (floor, weather, etc.) besides latitude/longitude affects the travelling time between vertices. Hence here we introuduce the time-based mult-dimensional map.

## Basic Idea
The basci idea is, based on the data we have, we find some features and the time of the edge is the output. We use  logistic regression. The map is a graph.

We care about two component: staying time and travelling time.

A delivery batch can be shown in the following figure.
<p align = "center">
<img src="figures/delivery-batch-concept.png"  alt="delivery batch">
</p>


## Vertices of the Graph
There are two type of vertices in the map: restaurant vertices and customer vertices.

## Edges of the Graph
There are three types of edges in the map: edge between restaurant and restaurant (RR Edge), edge between restaurant and customer (RC Edge) and edge between customer and customer (CC Edge).

### RR Edge estimation
In the first place, we want a unified model for all the RR edges, that is each rider has a map for all the restaurants, then we find it's difficult due to inaccurate POI information.

Then we consider to build a different model for each edge.

Test:

|From       |To         |DataNum    |Outlier %  |Accuracy   |
|---        |---        |---        |---        |---        |
|1336307    |151677755  |4          |25%        ||
|1872851    |2123623    |315        |2%         ||
|577024     |1872851    |62         |Undefinde  ||


## Features
Here we introduce the features of the vertices

### Graph Features
* Weather: Clear Day(1), Wind(2), Partly Cloudy(3), Cloudy(4), Rain(5)...
* Hour: 0~23

### Restaurant Vertices Features
* Latitude
* Longitude
* Floor

### Customer Vertices Features
* Latitude
* Longitude
* Floor

## Feature Tuple on Training
### RR Edge
* Origin Restaurant Latitude
* Origin Restaurant Longitude
* Origin Restaurant Floor
* Destination Restaurant Latitude
* Destination Restaurant Longitude
* Destination Restaurant Floor
* Distance (km)
* Hour
* Weather

#### Chanllenges in estimating RR edge
1. Missing value (Floor number missing for many restaurants)
2. Inaccurate POI information (Wrong latitude/longitude)
3. Inaccurate labels (Wrong labels from riders)
