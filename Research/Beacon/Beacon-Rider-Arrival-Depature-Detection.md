--- 
layout: post
title: The Arrival and Depature Detection of Riders based on Beacon
date: Sept. 26, 2017
author: Yi DING
---

[comment]: # (Blog for rider's arrival detection)

## Background
We have discussed the arrival and depature detection before ([here](https://dymodi.github.io/Research/Beacon/Beacon-Filtering)), now we consider a specific case: rider, or courier.

## Assumptions
1. The rider will be considered as *arrival* of a shop when he come near to the shop's beacon *and* he has an delivery order for this shop with him.

## Implementation
First, we need to select the orders from the shops with beacon and delivered by the riders with beacon data.