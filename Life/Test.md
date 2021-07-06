---
layout: default
title: Data-sets
youtubeId: YkL1rTvxoF4
date: Apr. 14, 2021
---

# Data-sets

## aBeacon Data

**Description**

{% include youtubePlayer.html id=page.YkL1rTvxoF4 %}

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