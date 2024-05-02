---
layout: single
title: "Code and Data-set Release"
permalink: /code-and-data/
classes: wide
last_modified_at: 2024-05-01
author_profile: true
---

We have published the source code and data-sets for some of the papers from our group.

## Code

### P2Loc

* Paper: [<span style="color:DarkGreen">[IMWUT/UbiComp'22]</span> *P2-Loc: A Person-2-Person Indoor Localization System in On-Demand Delivery*](https://dl.acm.org/doi/pdf/10.1145/3517238)
* Code: [P2Loc](https://github.com/dymodi/P2Loc)

### SmartLOC
* Paper:  [<span style="color:DarkGreen">[IMWUT/UbiComp'22]</span> *SmartLOC: Indoor Localization with Smartphone Anchors for On-Demand Delivery*](https://dl.acm.org/doi/pdf/10.1145/3494972). 
* Code: [SmartLoc](https://github.com/dymodi/SmartLOC)



## Data-set

### aBeacon: Citywide Bluetooth Sensing

**Description**

Large scale mobile sensing network is at the intersection of multiple research communities, including mobile computing, networked systems design and implementation, and spatial-temporal data mining. However, the progress of studies on large-scale mobile sensing networks does not meet industrial expectations. One of the main reasons is that there is no well-organized dataset that provides large amounts of sensing and mobility data from multiple channels to support related studies. Motivated by the observation, we release aBeacon: Alibaba Beacon System of Couriers’ Arrival Detection: a large-scale repository composed of BLE sensing, location trace, and manual report data, including 31,131 couriers at 2,466 merchant locations in one month. More details on the aBeacon system can be found in our NSDI’21 paper "*From Conception to Retirement: a Lifetime Story of a 3-Year-Old Operational Wireless Beacon System in the Wild*”.

**Data Details**

* **Sensing** data records a Bluetooth broadcast monitored on a courier’s smartphone.
* **Location trace** data records a GPS results of a courier.
* **Location report** data records the four timestamps from the courier’s report for an delivery order.

**Potential Topics**

* For aBeacon sensing data, we envision the following research topics:
  * Bluetooth network topology;
  * Impact of device type on Bluetooth monitoring;
  * Relation between Bluetooth-based detection and courier report (with courier location report data);
  * Relation between Bluetooth-based detection and GPS (with courier location trace data);
* For courier location trace data, we envision the following research topics:
  * Courier Mobility Study (Cluster analysis/Destination prediction);
  * Differences between e-scooter mobility and other transportation types (with other data-sets);
  * Location privacy;
* For courier location report data, we envision the following research topics:
  * Order scheduling strategy study;
  * Order scheduling system efficiency (with courier location trace data);

**References**

[1] Ding Yi, Ling Liu, Yu Yang, Yunhuai Liu, Tian He, Desheng Zhang.
*From Conception to Retirement: a Lifetime Story of a 3-Year-Old Operational Wireless Beacon System in the Wild.*
In USENIX NSDI 2021.

[2] Yu Yang, Ding Yi, D.Yuan, Guang Wang, Xiaoyang Xie, Yunhuai Liu, Tian He and Desheng Zhang.
*TransLoc: Transparent Indoor Localization with Uncertain Human Participation.*
In ACM MobiCom'20.

[Download Link](https://tianchi.aliyun.com/dataset/dataDetail?dataId=76359)


### VALID: Nationwide Arrival Detection via Bluetooth

**Description**

In this dataset, we release a repository composed of nationwide BLE sensing based on smartphone advertising and scanning, human report as labels, and human response to system intervention as feedback.

**Data Details**

* **Sensing** data records Bluetooth broadcast monitored on a courier's smartphone.
* **Courier device** data records a courier’s smartphone device hardware information.
* **Merchant device** data merchant’s smartphone device hardware information.
* **Courier report** data records the four timestamps from the courier's report for a delivery order.
* **Courier feedback** data records the four timestamps from the courier's report for a delivery order.

**Potential Topics**

* For VALID sensing data, we envision the following research topics:
  * Bluetooth network topology;
  * Relation between Bluetooth-based detection and courier report (with courier location report data);
  * Relation between physical BLE beacons and smartphone-base beacons (with [aBeacon](https://tianchi.aliyun.com/dataset/dataDetail?dataId=76359) dataset).
* For VALID courier device and merchant device data, we envision the following research topics:
  * Impact of sender device types on Bluetooth advertising;
  * Impact of receiver device types on Bluetooth scanning.
* For VALID courier report data, we envision the following research topics:
  * Order scheduling strategy study.
* For VALID courier feedback data, we envision the following research topics:
  * Human behavior changes due to system interventions;
  * Human-system synergy.

**References**

Yi Ding, Yu Yang, Wenchao Jiang, Yunhuai Liu, Tian He, Desheng Zhang. 
*Nationwide Deployment and Operation of a Virtual Arrival Detection System in the Wild.* 
In ACM SIGCOMM 2021.

[Download Link](https://tianchi.aliyun.com/dataset/dataDetail?dataId=103969)

### RL-Dispatch: A City-Wide Crowdsourcing Delivery System with Reinforcement Learning

**Description**

The revolution of online shopping in recent years demands corresponding evolution in delivery services in urban areas. To cater to this trend, delivery by the crowd has become an alternative to the traditional delivery services thanks to the advances in ubiquitous computing. Notably, some studies use public transportation for crowdsourcing delivery, given it slow-cost delivery network with millions of passengers as potential couriers.

One of the challenges met in building advanced order dispatching and delivery system is lacking of real-world data from both supply end (e.g., public transport) and demand end (e.g., delivery order).

In this dataset, we release a repository composed of citywide metro trip data and on-demand food delivery order data.

**Data Details**

* **Order** data records a Bluetooth broadcast monitored on a courier’s smartphone.

**Potential Topics**

* Order dispatching scheduling strategy study.
* E-scooter-based citywide mobility pattern study.
* On-demand food order distribution study.

**References**

Yi Ding, Baoshen Guo, Lin Zheng, Mingming Lu, Desheng Zhang, Shuai Wang, Sang Hyuk Son, Tian He
*A City-Wide Crowdsourcing Delivery System with Reinforcement Learning*\
In ACM UbiComp 2021.

[Download Link](https://tianchi.aliyun.com/dataset/dataDetail?dataId=106807)

### ALWAES: Automatic Outdoor Location-Aware Correction

**Description**

For an online delivery platform, accurate physical locations of merchants are essential for delivery scheduling. It is challenging to maintain tens of thousands of merchant locations accurately because of potential errors introduced by merchants for profits (e.g., potential fraud). In practice, a platform periodically sends a dedicated crew to survey limited locations due to high workforce costs, leaving many potential location errors.

In this dataset, we release a repository composed of online instant delivery order update data including BLE sensing, and manual report data. It can be used for measuring the travel time of couriers between merchants and verify all merchants' locations by cross-validation automatically.

**Data Details**

* **Courier-report-based order feature** data records order related features between two merchants during couriers delivery from couriers' report.
* **Beacon-based order feature** data records order related features between two merchants during couriers delivery from beacon system.
* **Merchant locationm ground truth** data records the real location of a merchant.

**Potential Topics**

* Automatic Outdoor Location-Aware Correction
* POI Labeling
* Time Estimation

**References**

Dongzhe Jiang, Yi Ding, Hao Zhang, Yunhuai Liu, Tian He, Yu Yang, Desheng Zhang. 
*ALWAES: an Automatic Outdoor Location-Aware Correction System for Online Delivery Platforms*. 
In ACM UbiComp 2021.

[Download Link](https://tianchi.aliyun.com/dataset/dataDetail?dataId=107267) 

### P2Loc: Indoor Encounter Data based on Smartphone Bluetooth

**Description**

Large scale mobile sensing network is at the intersection of multiple research communities, including IoT, Cyber-Physical Systems, Human-Centered Computing, and Data Mining. In the research of indoor localization and estimated time of arrival (ETA), one direction is to use the encounter events among targets to estimate their locations. In this dataset, we release a repository composed of BLE-based indoor encounter data and reported data of couriers. Details on the data and the systems can be found in our papers on the systems. 

P2Loc provides the encounter data and manual report data of 176 couriers at 54 merchant locations in a mall during one month.

**Data Details**

* **P2Loc Encounter Data** records Bluetooth broadcast monitored on courier’s smartphones.
* **P2Loc Accounting Data** records the four timestamps from the courier’s report for a delivery order.

**Potential Topics**

* Interned of Things / Cyber-Physical Systems
* Human-Centered Computing
* Gig Delivery

**References**

[IMWUT/UbiComp’22] P2-Loc: A Person-2-Person Indoor Localization System in On-Demand Delivery
Yi Ding, Dongzhe Jiang, Yu Yang, Yunhuai Liu, Tian He, Desheng Zhang

[Download Link](https://tianchi.aliyun.com/dataset/dataDetail?dataId=119097) 
