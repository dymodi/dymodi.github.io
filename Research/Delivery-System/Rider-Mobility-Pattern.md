--- 
layout: post
title: Rider's Mobility Pattern in a Large Scale Real World Delivery System
date: Oct. 20, 2017
author: Yi DING
---

[comment]: # (This post introduce the rider's mobility pattern in the real world delivery system)

A literature review on generic human mobility can be found [here](../Human-Mobility-Literature-Review-Yi-Ding.pdf)

## Rider's State
Usually, a rider is in one of the following state:
Waiting for an order Task, Heading to a Restaurant, Waiting at a Resaurant, Heading to a Customer, Waiting for a Customer

Simple case (an order at a time): 
WT -> HR -> WR -> HC -> WC -> WT -> ...

Expected case (order batch):
WT -> HR1 -> WR1 -> HR2 -> WR2 -> HR3 -> WR3 -> HC2 -> WC2 -> HC1 -> HC1 -> HC3 -> WC3 -> WT -> ...

Real world case (hybrid):
WT -> HR1 -> WR1 -> HR2 -> WR2 -> HC2 -> WC2 -> HR3 -> WR3 -> HC3 -> WC3 -> HC1 -> WC1 -> WT -> ...

It is possible that the rider has multiple order tasks to fetch.

