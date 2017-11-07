--- 
layout: post
title: Data Inconsistency Detection and Correction in Delivery System
date: Nov. 6, 2017
author: Yi DING
---

[comment]: # (Discuss the data inconsistency)

In practical situations, data gathered from restaurants and riders might be inaccurate due to many reasons. A typical data collection scheme is illustrated in the following figure. 

<p align = "center">
<img src="../Delivery-System/figures/rr_edge_challenges.png"  alt="delivery batch">
</p>

In processinhg the real world data, we find following problems in the datasets:

Spatial inconsistency:
1. Inaccurate restaurant POI information(latitude, longitude, floor)
2. Inaccurate customer POI information(latitude, longitude, floor)
3. Inaccurate rider positioning (latitude/longitude)

Temporal inconsistency:
1. Abonormal rider behavior. (e.g. potential rider fraud: late arrival, late delivery)


<!---
Before utilizing the data for modeling, we need to verify the data consistency and remove or correct the wrong data. Thanks to the various data sources, same event is usually covered by multiple data reocords hence that redundency existis. Verification is possible due to data redundency. For example, The rider's arrival at a restaurant is recorded in the riders' behavior data and rider's trace data.
--->

Data inconsistency has been studied in many papers and some classical methods were proposed to detect and repair error data. CFD is the most important method in this field, other methods also includes Bayesian estimation and maximum likelihood. However, these methods cannot be use in the delivery system. CFD cannot be used because explicit semantic dependency is lacking in the system. Moreover, data inconsistency in delivery system tends to be quantitative instead of logical, hence manually defined funtional dependency cannot capture all the error data. Moreover, existing methods usually based on a single relation table, while in our case, data are gather from different sources. Data inconsistency might happen during the data fusing process.

In our method, we find the spatial and temporal data inconsistency by first clustering the data to by restaurant or by rider. Then we find the problematic entries by comparing the observed data with expected output or empirical patterns.

### Compare with Empirical Rider Mobility Pattern
It has been studied in many literature about the human mobility pattern. As a special type of human mobility, rider's mobility pattern can be used to understand the rider's behavior and to find out spatial and temporal data inconsistency. 

In a Bayesian statistics paradigm, the empirical rider mobility pattern provides a *prior* information on the rider's mobility. 


### 5.1 Spatial Inconsistency (POI Correction) (Clustering by shop)
Spatial inconsistency is detected by clustering the data by vertices in the delivery graph, since each vertex represents a spatial location. 

**Compare with $\hat \tau(s,d)$**

The abnormal event $(s,d)$ is defined as follows:

$$\left| \tilde \tau(s,d) - \hat \tau(s,d) \right| > \epsilon(s,d)$$

where $\tilde \tau(s,d)$ is the observed time for event $(s,d)$, $\hat \tau(s,d)$ is the estimated time for event $(s,d)$ based on empirical distance function $\tau$. $\epsilon(s,d)$ is the tolerance function determining the threshold for detecting abnormal event.

$\epsilon(s,d)$ can be defined as follows: suppose $\tau(s,d)$ follows a nomral distribution $\mathcal N(\mu,\sigma)$. Then we can set $\epsilon(s,d) = 2\sigma$. A un-biased estimation of $\mu$ and $\sigma$ is $\bar \tau (s,d)$

**Compare with Empirical Rider Mobility Pattern**

Rider's mobility pattern can be viewed as speical subset of generic human mobiliy pattern [][]. For the rider's mobility pattern, we focus on the following two distributions:
* Rider indoor speed distribution
* Rider outdoor speed distribution
* Rider trip length distribution

Indoor speed distribution can be built based on rider's indoor trace gathered from beacon data.

Outdoor speed distibution can be built based on rider's outdoor trace gathered from GPS data.

**Compare with Empirical Restaurant Behavior Pattern**
* Waiting time distribution
* Restaurant Delivery time distribution


**Data Correction**
Data correction can be achieved by minizing the residual error between the distances related the error data in the temporal space. That is, suppose the a restaurant has a error POI (lat and lon), the observe the distance related 

$$ \underset{lat,lon}{\text{minimize}} \sum \left| \tilde \tau(s,d) - \hat \tau(s,d) \right| $$


### 5.2 Temporal Inconsistency (Rider Fraud) (Clustering by rider)
Temporal inconsistency is detected clustering the data by rider and compare the observed with rider mobility pattern built from massive rider trace data. The basic idea is to compare the rider's trace and event data with the typical rider mobility pattern. We first conduct restaurant-oriented data clustering and rider-oriented data clustering. Abnormal data is detected if the sample is rejected by the distribution.


**Compare with $\hat \tau(s,d)$**

**Arrival Detection based on Beacon**

**Compare with Empirical Rider Mobility Pattern**

**Compare with Empirlcal Rider Behavior Pattern**
* Riders' Accepting time distribution
* Riders' Waiting time ditribution
