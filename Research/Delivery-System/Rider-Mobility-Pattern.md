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
Waiting for an order Task, Heading to a Restaurant, Waiting at a Resaurant, Heading to a Customer, Waiting for a Customer.

Simple case (an order at a time): 
WT -> HR -> WR -> HC -> WC -> WT -> ...

Expected case (order batch):
WT -> HR1 -> WR1 -> HR2 -> WR2 -> HR3 -> WR3 -> HC2 -> WC2 -> HC1 -> HC1 -> HC3 -> WC3 -> WT -> ...

Real world case (hybrid):
WT -> HR1 -> WR1 -> HR2 -> WR2 -> HC2 -> WC2 -> HR3 -> WR3 -> HC3 -> WC3 -> HC1 -> WC1 -> WT -> ...

It is possible that the rider has multiple order tasks to fetch.

The abstraction of R and C is good, we can draw some figures to have a look at the ride's event.


Some useful dataset

|Date       |Rider      |Remark         |
|---        |---        |---            |
|10/22/17   |10125035   |Expected Case  |


## Factors the rider consider when making decisions 
When the rider make a decision (which R to go next, which C to go next, pick up meal first or send to customer first), there are many factors the rider might consider. Some factors around hand are: the distance to all the target restaurants(customers), the time constraints of orders under deliverying, competition with other riders.

So, first we need to gather the data and information that a rider have when he/she makes a decision.

## Order Exchange
Order exchange can happen at any stage in delivery. A normal order state is : 20 -> 80 -> 30 -> 40.
* Order exchange happened during 30 -> 40. (Rider A fetch, rider B send. A has state 20, 80, 30. B has state 30, 40) (Tracking id =  '3000007297179663078')
