--- 
layout: post
title: 2018 MobiSys Paper Outline
date: Oct. 08, 2017
author: Yi DING
---

[comment]: # (This is the outline for the 2018 MobiSys paper)

NOTE: This first version is rejected by the professor on 10/12/17. Please turn to the new version.
 
## 1 INTRODUCTION

[comment]: # (The importance of the problems addressed)
[comment]: # (The novelty of the proposed solutions)
[comment]: # (The technical depth)
[comment]: # (The potential impact)

**(If we claim for generic indoor applications, riders' mobility pattern cannot be used.)**

**(If we claim for food delivery system, it seems can not serve as solution to narrow the gap between research and real world application.)**

**(The problem we want to solve: narrow the gap between IPS research and applications)**

Indoor Localization, or Indoor Positioning System (IPS) has been studied both in academia and industry for many years. Many innovative methods have been proposed to tackle this issue from many aspects [][][]. However, compared with ubiquitous applications based on GPS in outdoor environment, the support from indoor localzation is still limited for upper layer applications. It seems that a gap still exists between the existing studies and potential large scale applications. Various complex challenges compose the gap: a universal algorithm is lacking for generic indoor environment, many algorithms relies on fingerprinting data or floor plan, incentive is lacking for crowdsourcing mechanism, robustness against attack is lacking for commercial applications, etc [youssef2015towards].

**(The special features of indoor localization)**

The challenges faced for indoor localization application prompt us to explore the underlying features of indoor localization services. Based on the in-depth exploration of many IPS research and applications[][][], we found the following characteristics of IPS (compared with GPS): (1) The indoor localization usually serves for some specific purpose such as indoor navigation in mall and airport, and riders' arrival/depature detection for delivery services; (2) Additional informaiton is needed to achieve indoor localization, such as floorplan or fingerprinting database; (3) The security issue needs to be resolved for privacy and commercial consideration.

**(The background of food delivery system)**

In recent years, with the prevalence of the mobile Internet and sharing economy, online food ordering and delivery becomes a prosperous market. Driven by the mobile Internet technololy, a new business model is emerging with a centralized platform  serving customers, restaurants and riders at the same time [][][]. Restaurants can operate online shops on the platform and accept orders while customers can choose from plenty of restaurants nearby from the cellphone APP provided by the platform. The food delivery tasks will be dispatched to registered and crowdsourced riders according to their location and destination. As the platform provides convenient service for all three sections, some problems also restrain the platform from achieving high efficiency dispatching. One of the key problems is the lacking of riders' location information when the riders are in the indoor environment.  Acquiring riders' indoor location plays an important role in the following parts: delivery task dispatching, delivery time estimation and fraud detection.

**(The uniqueness of IPS in food delivery / Why existing studies cannot solve the problem)**

The existing systems and algorithms cannot solve the indoor localization problem for food delivery for the following reasons (The challenges we met for the paper): (1) Fingerprinting is not applicable due to large scale, we have to use existing POI information in the database. However, the POI information in the database is inaccurate. (2) The pass-loss model is not applicable due to high diversity of cellphone hardware and indoor layout. (3) Security needs to be considered for privacy and security issue. However, some specialities of food delivery system makes it possible to resolve the challenges: (1) The indoor mobility demonstrates predictable pattern; (2) Special spatial/temporal events(arrival/depature) outweigh indoor trace for upper layer applications. (3) POI information is known and can be used as anchors for the IPS.

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