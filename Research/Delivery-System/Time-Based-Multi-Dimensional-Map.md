--- 
layout: post
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

We care about two component: staying time and travelling time


## Vertices of the Graph
There are two type of vertices in the map: restaurant vertices and customer vertices.

## Edges of the Graph
There are three types of edges in the map: edge between restaurant and restaurant (RR Edge), edge between restaurant and customer (RC Edge) and edge between customer and customer (CC Edge).

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
Origin Restaurant Latitude
Origin Restaurant Longitude
Origin Restaurant Floor
Destination Restaurant Latitude
Destination Restaurant Longitude
Destination Restaurant Floor
Hour
Weather
