---
layout: single
title: "Data-sets"
permalink: /data-sets-test/
classes: wide
last_modified_at: 2021-11-15
author_profile: true
---

## aBeacon: Citywide Bluetooth Sensing

**Description**

Large scale mobile sensing network is at the intersection of multiple research communities, including mobile computing, networked systems design and implementation, and spatial-temporal data mining. However, the progress of studies on large-scale mobile sensing networks does not meet industrial expectations. One of the main reasons is that there is no well-organized dataset that provides large amounts of sensing and mobility data from multiple channels to support related studies. Motivated by the observation, we release aBeacon: Alibaba Beacon System of Couriers’ Arrival Detection: a large-scale repository composed of BLE sensing, location trace, and manual report data, including 31,131 couriers at 2,466 merchant locations in one month. More details on the aBeacon system can be found in our NSDI’21 paper "*From Conception to Retirement: a Lifetime Story of a 3-Year-Old Operational Wireless Beacon System in the Wild*”.

**Potential Topics:**

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

**References:**

(1) Ding Yi, Ling Liu, Yu Yang, Yunhuai Liu, Tian He, Desheng Zhang.
From Conception to Retirement: a Lifetime Story of a 3-Year-Old Operational Wireless Beacon System in the Wild.
In USENIX NSDI 2021.

(2) Yu Yang, Ding Yi, D.Yuan, Guang Wang, Xiaoyang Xie, Yunhuai Liu, Tian He and Desheng Zhang.
TransLoc: Transparent Indoor Localization with Uncertain Human Participation.
In ACM MobiCom'20.

[Download Link](https://tianchi.aliyun.com/dataset/dataDetail?dataId=76359)

Yi Ding (dingx447@umn.edu)
Yu Yang (yu.yang@rutgers.edu)
Desheng Zhang (desheng@cs.rutgers.edu)


## VALID: Nationwide Arrival Detection via Bluetooth

**Description**

In this dataset, we release a repository composed of nationwide BLE sensing based on smartphone advertising and scanning, human report as labels, and human response to system intervention as feedback.

**Data Details**

* **Sensing** data records Bluetooth broadcast monitored on a courier's smartphone.
* **Courier device** data records a courier’s smartphone device hardware information.
* **Merchant device** data merchant’s smartphone device hardware information.
* **Courier report** data records the four timestamps from the courier's report for a delivery order.
* **Courier feedback** data records the four timestamps from the courier's report for a delivery order.

**Potential Topics:**

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

**References:**

[SIGCOMM' 21] Yi Ding, Yu Yang, Wenchao Jiang, Yunhuai Liu, Tian He, Desheng Zhang. Nationwide Deployment and Operation of a Virtual Arrival Detection System in the Wild. In ACM SIGCOMM 2021.

[Download Link](https://tianchi.aliyun.com/dataset/dataDetail?dataId=103969)

