---
layout: archive
title: "Research"
permalink: /research/
youtubeIdABeacon: PV9MUVwGw8o
classes: wide
author_profile: true
gallery:
  - url: /assets/images/Research/physical-beacon-idea.png
    image_path: /assets/images/Research/physical-beacon-idea.png
    height: '200'
    alt: "Idea of aBeacon system"
    title: "Idea of aBeacon system"
  - url: /assets/images/Research/physical-beacon-phase_1_deployment_6.JPG
    image_path: /assets/images/Research/physical-beacon-phase_1_deployment_6.JPG
    height: '200'
    alt: "Deployment"
    title: "Deployment"
  - url: /assets/images/Research/physical-beacon-Heamap-1632403428001.png
    image_path: /assets/images/Research/physical-beacon-Heamap-1632403428001.png
    height: '200'
    alt: "Heatmap in Shanghai"
    title: "Heatmap in Shanghai"
---
## Overview

My research interests are broadly in data mining, mobile computing, on-demand delivery, and machine learning.


## Selected Topics

### aBeacon [NSDI'21], a 3-year citywide wireless beacon system

{% include gallery caption="Idea, Deployment, and Spatial Heatmap of aBeacon System" %}

aBeacon (short for alibaba Beacon) is an operational indoor sensing system to infer the indoor status of Alibaba couriers, e.g., arrival and departure at the merchants based on Bluetooth. 

Although in an academic setting, using BLE devices to detect arrival and departure looks straightforward, it is non-trivial to design, build, deploy, and operate aBeacon from its conception to its retirement at city scale in a metric-based approach by considering the tradeoffs between various practical factors (e.g., cost and performance) during a long-term system evolution. 

aBeacon consists of customized BLE devices at 12,109 merchants, interacting with 109,378 couriers to infer their status to assist the scheduling of 64 million delivery orders for 7.3 million customers with a total amount of $600 million USD order values. 



### [Literature Surveys](Research/Literature-Survey)
