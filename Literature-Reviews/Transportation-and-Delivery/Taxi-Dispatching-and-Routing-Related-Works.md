---
layout: single
title: "Taxi Dispatching and Routing Related Works"
permalink: /Literature-Reviews/Transportation-and-Delivery/Taxi-Dispatching-and-Routing-Related-Works/
classes: wide
author_profile: true
date: 18/6/19
--- 

## Summary
Taxi distpatching and routing are two related but different topics. In my opinion, dispatching serves and operates at the platform side, such as Uber and Amazon, the goal can be profit, efficiency, fainess and so on. While routing (or recommendation) serves and operates at the driver side, such as Uber driver and DoorDash rider. The goal can be reduce waiting time or driving distance.

The existing taxi dispatching algorithms are designed to reduce autonomous vehicle balancing costs and taxis’ total idle distance [1].

## Review for Individual Paper

In paper [3], ride and delivery services are considered as variants of *classical multi-vehicle minimum latency problems*. Point to point request is formally defined in the paper and an approximation algorithms based on a linear programming framework in proposed to solve the problem. The problem assumes a metric space for the problem. However, sysmmetry law is not true in real world. Besides, the graph model for the problem is over simplified and waiting time is not considered.

In paper [1], the author proposed a receding horizon control framework that incorporates predicted demand model and real-time sensing data. 

## Ref.
[1] F. Miao et al., "Data-Driven Robust Taxi Dispatch Under Demand Uncertainties," in IEEE Transactions on Control Systems Technology. .doi: 10.1109/TCST.2017.2766042

[2] Lee, D. H., Wang, H., Cheu, R., & Teo, S. (2004). Taxi dispatch system based on current demands and real-time traffic conditions. *Transportation Research Record: Journal of the Transportation Research Board*, (1882), 193-200.

[3] Das, A., Gollapudi, S., Kim, A., Panigrahi, D., & Swamy, C. (2018, April). Minimizing Latency in Online Ride and Delivery Services. In *Proceedings of the 2018 World Wide Web Conference on World Wide Web* (pp. 379-388). International World Wide Web Conferences Steering Committee.