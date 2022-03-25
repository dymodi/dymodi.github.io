---
layout: single
title: "Considerations of an Industrial Mobile Computing System"
permalink: /blog/IoT/Industrial-Considerations/
classes: wide
author_profile: true
use_math: true
date: 20/7/31
---

# Considerations of an Industrial Mobile Computing System

When we implement a system in the industry, there are some additional considerations, compared to in-lab research design. It is important to keep these considerations in mind when we want to transfer academic work into the industry.

There are many studies on evaluating a system, I summarize some aspects based on my experience in the industry.

## System and Hardware 

### Cost (Return of Investment, ROI)

### Scale

### Reliability

### Robustness

What happens if the some function of the system fails? 

It is better to conduct a quantitative evaluation (theoretically or experimentally) and give an upper bound of the impact.

### Energy Consumption

### Compatibility

Due to device heterogeneity

### Lifetime

As we observed in the physical beacon system, the lifetime of a device or even the whole system is not solely decided by the battery.

### Deployment



(What are the relations between these factors?)



## Data

### Privacy

Privacy is a big topic and we may need an individual article for it.

### Ground Truth and Label Collection

Ground truth is essential when we want to evaluate the performance of a new algorithm, strategy or a system, however, ground truth is difficult (if not impossible) to collect.

The same paradox also works when we want to collect theb label data for a machine learning algorithm. If the label is easy to collect, there is no need to build the learning algorithm.

### Data Redundancy and Data Missing


## Smartphone Related

### Restrictions on iOS and Android

Wi-Fi scanning

BLE broadcast and scan

Android Service

APP execution in the background



## Evaluation

A/B Test