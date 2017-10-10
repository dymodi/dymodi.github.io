--- 
layout: post
title: 2018 MobiSys Paper Outline
date: Oct. 08, 2017
author: Yi DING
---

[comment]: # (This is the outline for the 2018 MobiSys paper)


## 1 INTRODUCTION

[comment]: # (The importance of the problems addressed)
[comment]: # (The novelty of the proposed solutions)
[comment]: # (The technical depth)
[comment]: # (The potential impact)

Indoor localization has been studied both in academia and industry for many years. Many innovative methods have been proposed to tackle this issue from many aspects [][][]. However, compared with ubiquitous applications based on GPS in outdoor environment, the support from indoor localzation is still limited for upper layer applications. It seems that a gap still exists between the existing studies and potential large scale applications. Various complex challenges lead to the gap: a universal algorithm is lacking for generic indoor environment, many algorithm relying on fingerprinting data or floor plan, incentive is lacking for crowdsourcing mechanism, robustness against attack is lacking for commercial applications, etc [youssef2015towards].


In this paper, we propose a large scale indoor localization system for the food delivery business based on BLE beacons. 

The pass-loss equation is not applicable due to variety of cellphone platforms and hardware. 

Fingerprinting is not applicable due to large scale, we have to use existing POI information in the database. However, the POI information in the database in inaccurate ...

Commercial application require high security level 

To address these challenges and narrow the gap between existing indoor localization studies and real world applications, in this paper we build an indoor localization system for large scale applications. The key novelty  of our system is that existing (inaccurate) POI can be used to achieve hence no fingerprinting or training is needed and encryption mechanism is integrated to guarantee the security of the system. Specifically, our contributions in this paper are as follows: 

* To the best of our knowledge, this is the first paper that shows the effectiveness of BLE based beacon in large scale real world commercial application. The scale of the system is larger than any other system studied before in the followings aspects: For the physical layer, we have more than 15,000 beacons in 15,000 shops in Shanghai. For the sensor layer, more than 20,000 riders act as "sensors" with cellphone with them. Particularly, in the former studies the many, more than 600 types have cellphone have been involved in the system, which shows the effectiveness of our system in real world scenario. 


## 2 RELATED WORK




## 3 MOTIVATION
### 3.1 Insufficient Dispatching System


### 3.2 Inaccurate Real World POI Information
### 3.3 Commercial Requirement on Security

## 4 SYSTEM OVERVIEW
The system overview is shown in the following figure:
<p align = "center">
    <img src="figures/system-overview.png"  alt="system-overview", width="700", height="600">
</p>


## 5 Indoor Detection and Tracking

## 6 POI Correction
### 6.1 Exception Detection
(Almost done, based on riders' speed)

### 6.2 POI Correction
(Not started, plan to use optimization, minimize the exceptional rate)

## 7 System Security
(To be done by LIU Ling?)

## 8 Performance Evaluation
### 8.1 Data source
### 8.2 In-field Experiment

## 9 CONCLUSION

## Reference
@inproceedings{youssef2015towards,
  title={Towards truly ubiquitous indoor localization on a worldwide scale},
  author={Youssef, Moustafa},
  booktitle={Proceedings of the 23rd SIGSPATIAL International Conference on Advances in Geographic Information Systems},
  pages={12},
  year={2015},
  organization={ACM}
}