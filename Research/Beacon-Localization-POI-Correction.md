--- 
layout: post
title: POI Information Correction based on Beacon
date: Sep. 18, 2017
author: Yi DING
---
[comment]: # (The math equation in this post is for latex and can be viewed in Visual Studio Code)

[comment]: # (This post composite the POI Correction Section)

## Design Space
The design space can be like the following:
* Anchor based localization/detection
* Anchor free localization/detection
    * Bidirectional communication based
    * Bidirectional communication free (Our Work) (We need to claim that we are the first.)

## Notation
$$\text{lat}_i$$: The accurate latitude of POI node $$i$$.

$$\text{lon}_i$$: The accurate longitude of POI node $$i$$.

$$\hat{\text{lat}}_i$$: The estimated latitude of POI node $$i$$.

$$\hat{\text{lon}}_i$$: The estimated longitude of POI node $$i$$.

$$d_i$$: The drifting distance of POI node $$i$$.


## The Metric for POI Accuracy
$$d_i=\sqrt{(\text{lat}_i-\hat{\text{lat}}_i)^2+(\text{lon}_i-\hat{\text{lon}}_i)^2}$$

## Background
Many existing indoor localization methods are using the finger-printing strategy[][]. That is, a training phase is needed before indoor localization can be achieved, which is not pratical for large scale application. Some other studies 


## Motivation
[comment]: # (It will be better to have a small example and some figures)


## POI Exception Detection
[comment]: # (We need first define some metric to measure the exception)

## In-Field Experiment