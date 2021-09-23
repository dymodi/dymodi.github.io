---
layout: archive
title: "Research"
permalink: /research/
youtubeIdABeacon: PV9MUVwGw8o
classes: wide
author_profile: true
---
## Overview

My research interests are broadly in data mining, mobile computing, on-demand delivery, and machine learning.



## Selected Topics

### aBeacon [NSDI'21], a 3-year citywide wireless beacon system

{% include youtubePlayer.html id=page.youtubeIdABeacon %}

aBeacon (short for alibaba Beacon) is an operational indoor sensing system based on BLE. aBeacon is pilot-studied, A/B tested, deployed, and operated in Shanghai, China to infer the indoor status of Alibaba couriers, e.g., arrival and departure at the merchants. 

In its full operation stage (2018/01-2020/04), aBeacon consists of customized BLE devices at 12,109 merchants, interacting with 109,378 couriers to infer their status to assist the scheduling of 64 million delivery orders for 7.3 million customers with a total amount of $600 million USD order values. 

Although in an academic setting, using BLE devices to detect arrival and departure looks straightforward, it is non-trivial to design, build, deploy, and operate aBeacon from its conception to its retirement at city scale in a metric-based approach by considering the tradeoffs between various practical factors (e.g., cost and performance) during a long-term system evolution. 



### [Literature Surveys](Research/Literature-Survey)
