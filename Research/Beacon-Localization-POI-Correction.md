--- 
layout: post
title: POI Information Correction based on Beacon
date: Sep. 18, 2017
author: Yi DING
---
[comment]: # (The math equation in this post is for latex and can be viewed in Visual Studio Code)

[comment]: # (This post composite the POI Correction Section)


## Remarks
* Due to fast fading, distance estimation is not reliable in indoor environment.


## Design Space
The design space can be like the following:
* Anchor based localization/detection
* Anchor free localization/detection
    * Bidirectional communication based
    * Bidirectional communication free (Our Work) (We need to claim that we are the first.)

## Notation
\\(P\\): The POI node set.

\\(n_P\\): The number of nodes in the POI node set. \\(n_P=\left\lvert P \right\rvert\\)

$$\text{lat}_i$$: The accurate latitude of POI node $$i\in P$$.

$$\text{lon}_i$$: The accurate longitude of POI node $$i\in P$$.

$$\hat{\text{lat}}_i$$: The recorded latitude of POI node $$i \in P$$ in the database.

$$\hat{\text{lon}}_i$$: The estimated longitude of POI node $$i \in P$$ in the database.

$$d_i$$: The drifting distance of POI node $$i$$.

$$d_P$$: The average drifting distance of all the nodes in $$P$$.


## The Metric for POI Accuracy
$$d_i=\sqrt{(\text{lat}_i-\hat{\text{lat}}_i)^2+(\text{lon}_i-\hat{\text{lon}}_i)^2}$$ 

\\(d_P=\frac{1}{n_P}\sum_{i\in P}{d_i}\\)

$$d_P$$ can be seen as a metric to measure the accuracy of the location information for a POI node set. 

## POI Exception Detection
[comment]: # (We need first define some metric to measure the exception)

An emperical relation between RSSI value and distance is:
rssi = -65 - 10n*log(d)
d = 10^((-rssi-65)/10n)
Here n is subject to the indoor environment. Based on our indoor exeperiment, we let n = 1.5.

## POI Correction


## Background
Many existing indoor localization methods are using the finger-printing strategy[][]. That is, a training phase is needed before indoor localization can be achieved, which is not pratical for large scale application. Some other studies 


## Motivation
[comment]: # (It will be better to have a small example and some figures)




## In-Field Experiment