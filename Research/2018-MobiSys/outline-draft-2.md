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

Goal:
* **Tight time estimation**
    * **Motivation**: meal cannot be cold, timeout penalty
    * **Challenges**: different preparing time, rush/non-rush hour elavator, rider's familiarity with environment, weather, etc 
    * **Solution**: time map instead of physical map, preparing time estimation.
    Two parts of the map: (1) What is the possibility of each node for the next step? (Bayesian Estimation)
    (2) How long it will take to go there? (Logistic regression)

