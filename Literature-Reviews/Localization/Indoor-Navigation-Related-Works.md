---
layout: single
title: "Related Works of Indoor Navigation"
permalink: /Literature-Reviews/Localization/Indoor-Navigation-Related-Works/
classes: wide
author_profile: true
---

**Key Words**: Indoor Navigation

**Taxonomy**

* Sensor: Wi-Fi, IMU, Camera, Geomagnetic, LiDAR;
* Floorplan-free / Floorplan-based;

**Comments**

* "Localization" and "Navigation" are two closely-related topics.
* The basic idea of *Travi-Navi*, *FOLLOWME*, and *ppNav* are similar in terms of the "Guider+Follower" scheme, the primary difference comes in data (sensor) source.
* The basic weaknesses of existing works (*Travi-Navi*, *FOLLOWME*, and *ppNav*) are the need of guider (leader) and high-sampling sensor data for trace construction, deviation detection or turn detection.

**Papers**

* Travi-Navi, Self-deployable Indoor Navigation System, [MobiCom-2014-Travi-Navi]
  * Taxonomy: Camera, Floorplan-free;
  * Idea: (1) Enable user to bootstrap simple navigation service; (2) Guider trace record + Follower scheme.
  * Contribution: (1) Idea: Guider+Follower; (2) Tech: Sensor fusion, shortcut discovery, image blur process.
  * Weaknesses: (1) Images unavailable for many applications; (2) Need guider;
* Last-mile navigation using smartphones, [MobiCom-2015-FOLLOWME]
  * Taxonomy: Geomagnetic, Floorplan-free;
  * Idea: (1) Guider+Follower scheme; (2) Geomagnetic fingerprints;
  * Contribution: (1) Idea: Infra-free; (2) Tech: Magnetic-field-based, step-constrained trace synchronization; (3) Implementation
  * Weaknesses: (1) Need high sampling rate (~100Hz) and energy consumption.
* ppNav, Peer-to-Peer Indoor Navigation, [IEEE-2017-P2P]
  * Taxonomy: Wi-Fi+IMU, Floorplan-free; 
  * Idea: Navigation according to a ***previous*** traveler’s trace experience.
  * Contribution: (1) Idea: Infra-free, P2P navigation; (2) Tech: WiFi fingerprint model: diagrammed; (3) Implementation.
  * Weaknesses: (1) Need guider or labeled data; (2) Recording events of interests (heading, turning, upstairs/downstairs) need high sampling rate (~100Hz) and energy consumption.
* Deep Learning-based Wireless Localization for Indoor Navigation, [MobiCom-2020-DLoc]
  * Taxonomy: Wi-Fi, LiDAR;
  * Idea: (1) Use the neural network to implicitly model environment (for Wi-Fi-based localization); 
  * Contribution: (1) Domain knowledge+NN to solve Domain-specific problem; (2) Map construction via robot; (3) Large-scale data-set.
  * Weaknesses: (1) Need map contribution (fingerprinting) process (MapFinder, SLAM).

## Ref.

[MobiCom-2014-Travi-Navi] Zheng, Yuanqing, Guobin Shen, Liqun Li, Chunshui Zhao, Mo Li, and Feng Zhao. "**Travi-navi: Self-deployable indoor navigation system**." *IEEE/ACM transactions on networking* 25, no. 5 (2017): 2655-2669.

[MobiCom-2015-FOLLOWME] Shu, Yuanchao, Kang G. Shin, Tian He, and Jiming Chen. "**Last-mile navigation using smartphones**." In *ACM MobiCom*, pp. 512-524. 2015.

[IEEE-2017-P2P] Yin, Zuwei, Chenshu Wu, Zheng Yang, and Yunhao Liu. "**Peer-to-peer indoor navigation using smartphones**." *IEEE Journal on Selected Areas in Communications* 35, no. 5 (2017): 1141-1153.

[MobiCom-2020-DLoc] Ayyalasomayajula, Roshan, Aditya Arun, Chenfeng Wu, Sanatan Sharma, Abhishek Rajkumar Sethi, Deepak Vasisht, and Dinesh Bharadia. "**Deep learning based wireless localization for indoor navigation**." In *ACM MobiCom*, pp. 1-14. 2020.



