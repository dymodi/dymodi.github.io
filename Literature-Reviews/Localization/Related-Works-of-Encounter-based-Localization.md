---
author: Yi DING
layout: post
title: Related Works of Cooperative / Encounter-based Localization
date: Mar. 1, 2021

---

**Key Words:** Encounter-based Localization, Cooperative Localization, Rendezvous-based Localization

**Taxonomy**

* How to achieve encounter detection: Audio, Wi-Fi
* How to obtain encounter location: Audio beacon, Wi-Fi
* How to infer between encounters: Dead reckoning on IMU
* Mathematical methods: Graph (MDS)

**Comments**

* Another related topic is "Range-free" localization where only "connectivity" information is used for localization.
* One of the major differences of P2Loc compared with cooperative localization is that P2Loc relies purely on the communication between nodes, but not relie on anchors.

**Papers**

* Locating nodes with EASE, *[INFOCOM 2003]*
  * Taxonomy: encounter detection method not mentioned,
  * Opportunity: "Distance Effect": If the node is far away from the destination, an imprecise estimate is sufficient, and vice versa.
  * Contributions:
    * (1) **Intellectual Novelty**: only used the location and time of last encounter of the nodes to infer the locations of all nodes;
    * (2) **Pros. compare with SoA**: No communication overhead is needed between nodes;
  * Comments:
    * (1) This is a theoretical paper based on simulation, but the idea, observation, and conclusion are valuable.
    * (2) Technical details like how to detect encounter, how to obtain node's location are not discussed.
* Cooperative Localization in Wireless Networks, *[IEEE 2009]*
  * Taxonomy: Comprehensive/Survey paper on cooperative localization
  * Comments:
    * Highly cited paper (>1000), one of the pioneer works on cooperative localization.
    * Cooperative localization: localize a node with the help of other nodes instead of purly relying in anchors.
    * Cooperative localization is one of the related topics of encounter-based localization.
    * Good taxonomy and summary.
* Did You See Bob? *[MobiCom 2010, Escort]*
  * Taxonomy: Audio for encounter detection, Dead reckoning on IMU
  * Contributions:
    * (1) One of the ealiest work on "encounter-based localization";
    * (2) No need of calibration, war-driving and floor plan;
  * Limitations:
    * (1) Need deploy audio beacons in the building;
* Collaborative PDR Localisation with Mobile Phones, *[ISWC 2011]*
  * Taxonomy: no fixed encounter detection methods, using problistic methods for localization;
  * Contributions: 
    * (1) **Intellectual Novelty**: use encounter information to improve dead reckoning accuracy.
* Push the Limit of WiFi based Localization for Smartphones, [MobiCom 2012]
  * Taxonomy: Acoustic for encounter detection, Wi-Fi for localization;
  * Contributions:
    * (1) **Observation**: Discover the root cause of large errors in Wi-Fi fingerprinting works: existence of faraway locations sharing similar radio signatures;
    * (2) **Intellectual Novelty**: Wi-Fi+Acoustic for localization;
* Encounter Based Sensor Tracking, *[MobileHoc 2012, EBT]*
  * Taxonomy: Dead reckoning on IMU to infer between encounters, Graph (MDS)
  * Core Idea: Treats encounters as constraints in a graph realization problem, minimizing positional estimates in an offline manner.
  * Contributions:
    * (1) **Intellectual Novelty**: model the encounter-based localiazation as a graph realization problem. 
  * Comments: 
    * (1) encounter detection is aussumed to achieve by radio;
    * (2) Only simulation, no in-field experiment conducted.
* Social-Loc: Improving Indoor Localization with Social Sensing, *[SenSys 2013, Social-Loc]*
  * Taxonomy: Dead reckoning, Wi-Fi
  * Contributions:
    * (1) **Intellectual Novelty**: use *encounter* and *non-encounter* information to calibrate the underlying localization erros.
    * (2) Technical Novelty: a probabilistic approach to cooperatively calibrate the locations.
    * (3) **Experimental Novelty**: implement the system on Android.
  * Discussions:
    * (1) Limitations: is a middleware based on existing localization methods.
  * Comments:
    * (1) Not purely theoretical paper, but also not a pure system. 
    * (2) Specifically, its' a middleware, and the design is implemented using with dead reckoning and Wi-Fi based methods.
* Social Spring, *[BuildSys 2014]*
  * Taxonomy: Graph (MDS)
  * Contributions:
    * (1) **Intellectual Novelty**: model the encounter as springs in a graph. 
  * Comments:
    * (1) Only 1 citation untial 2021/03.
    * (2) Need distance information between users.
* CoSMiC: Mobile Crowd-sourced Collaborative Ap plication to Find a Missing Child, *[MobileHCI 2014]*
  * Taxonomy: Wi-Fi for encounter detection and localization
  * Contributions:
    * (1) **Problem Novelty**: a crowd-sourced collaborative application to help parents find a missing child quickly.
    * (2) **Technical Novelty**: New Recover the trace of the missing child;
  * Discussions:
    * (1) "Virtual encounter" instead of "Physical encounter" is considered in the paper. "Virtual encounter" is obtained through Wi-Fi-based localization.
    * (2) It's more like a "CHI" paper instead of a "Mobile Computing" paper.
* Spring Model Based Collaborative Indoor Position Estimation with Neighbor Mobile Devices, *[IEEE 2015]*
  * Taxonomy: Wi-Fi for localization, BLE for encounter detection
* M2M Encountering, *[Sensor Journal 2016]*
  * Taxonomy: ZigBee for localization, Wi-Fi for encounter detection;
* BLE-based Collaborative Indoor Localization, *[WCNC 2016]*
  * Taxonomy: BLE for localization (iBeacon devices), BLE for encounter detection
* Peer-to-Peer Indoor Navigation Using Smartphones, *[IEEE 2017]*
  * Taxonomy:  Wi-Fi (fingerprints) for localization
  * Comments:
    * Navigation work, based on previous user's trace.
    * NOT an encounter-based work.
* WAIPO: A Fusion-Based Collaborative Indoor Localization System on Smartphones, *[IEEE TON 2017]*
  * Comment: Too many data sources used: Wi-Fi, Photo, Magnetic.
* Crowdx, [IMWUT 2018]
  * Taxonomy: IMU, Dead Reckoning
  * Contributions: Use encounter event to calibrate dead reckoning to build indoor floor plan.
  * Comment: Need IMU data for dead reckoning.
* Smartphone-based user positioning in a multiple-user context with Wi-Fi and Bluetooth, *[IEEE IPIN 2018]*
  * Taxonomy: Wi-Fi for localization, BLE for encounter detection
  * Contribution: Merge Wi-Fi and BLE data for localization

## Ref.

[INFOCOM 2003] Grossglauser, Matthias, and Martin Vetterli. "Locating nodes with EASE: Last encounter routing in ad hoc networks through mobility diffusion." In *IEEE INFOCOM 2003. Twenty-second Annual Joint Conference of the IEEE Computer and Communications Societies (IEEE Cat. No. 03CH37428)*, vol. 3, pp. 1954-1964. IEEE, 2003.

[IEEE 2009] Wymeersch, Henk, Jaime Lien, and Moe Z. Win. "Cooperative localization in wireless networks." *Proceedings of the IEEE* 97, no. 2 (2009): 427-450

[MobiCom 2010, Escort] Constandache, Ionut, Xuan Bao, Martin Azizyan, and Romit Roy Choudhury. "Did you see Bob? Human localization using mobile phones." In *Proceedings of the sixteenth annual international conference on Mobile computing and networking*, pp. 149-160. 2010.

[ISWC 2011] Kloch, Kamil, Paul Lukowicz, and Carl Fischer. "Collaborative PDR localisation with mobile phones." In *2011 15th Annual International Symposium on Wearable Computers*, pp. 37-40. IEEE, 2011.

[MobiCom 2012] Liu, Hongbo, Yu Gan, Jie Yang, Simon Sidhom, Yan Wang, Yingying Chen, and Fan Ye. "Push the limit of WiFi based localization for smartphones." In *Proceedings of the 18th annual international conference on Mobile computing and networking*, pp. 305-316. 2012.

[MobileHoc 2012, EBT] Symington, Andrew, and Niki Trigoni. "Encounter based sensor tracking." In *Proceedings of the thirteenth ACM international symposium on Mobile Ad Hoc Networking and Computing*, pp. 15-24. 2012.

[SenSys 2013, Social-Loc] Jun, Junghyun, Yu Gu, Long Cheng, Banghui Lu, Jun Sun, Ting Zhu, and Jianwei Niu. "Social-Loc: Improving indoor localization with social sensing." In *Proceedings of the 11th ACM Conference on Embedded Networked Sensor Systems*, pp. 1-14. 2013.

[BuildSys 2014] Martin, Paul, Yasser Shoukry, Prashanth Swaminathan, Robin Wentao Ouyang, and Mani Srivastava. "Social spring: encounter-based path refinement for indoor tracking systems." In *Proceedings of the 1st ACM Conference on Embedded Systems for Energy-Efficient Buildings*, pp. 156-159. 2014.

[MobileHCI 2014] Shin, Hyojeong, Taiwoo Park, Seungwoo Kang, Bupjae Lee, Junehwa Song, Yohan Chon, and Hojung Cha. "CoSMiC: Designing a mobile crowd-sourced collaborative application to find a missing child in situ." In *Proceedings of the 16th international conference on Human-computer interaction with mobile devices & services*, pp. 389-398. 2014.

[IEEE 2015] Taniuchi, Daisuke, Xiaopeng Liu, Daisuke Nakai, and Takuya Maekawa. "Spring model based collaborative indoor position estimation with neighbor mobile devices." *IEEE Journal of Selected Topics in Signal Processing* 9, no. 2 (2015): 268-277.

[Sensor Journal 2016] Qiu, Jun-Wei, and Yu-Chee Tseng. "M2M encountering: Collaborative localization via instant inter-particle filter data fusion." *IEEE Sensors Journal* 16, no. 14 (2016): 5715-5724.

[WCNC 2016] Qiu, Jun-Wei, Chien-Pu Lin, and Yu-Chee Tseng. "BLE-based collaborative indoor localization with adaptive multi-lateration and mobile encountering." In *2016 IEEE Wireless Communications and Networking Conference*, pp. 1-7. IEEE, 2016.

[IEEE 2017] Yin, Zuwei, Chenshu Wu, Zheng Yang, and Yunhao Liu. "Peer-to-peer indoor navigation using smartphones." *IEEE Journal on Selected Areas in Communications* 35, no. 5 (2017): 1141-1153.

[IEEE TON 2017] Gu, Fei, Jianwei Niu, and Lingjie Duan. "WAIPO: A fusion-based collaborative indoor localization system on smartphones." *IEEE/ACM Transactions on Networking* 25, no. 4 (2017): 2267-2280.

[IMWUT 2018] Chen, Huijie, Fan Li, Xiaojun Hei, and Yu Wang. "Crowdx: Enhancing automatic construction of indoor floorplan with opportunistic encounters." *Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies* 2, no. 4 (2018): 1-21.

[IEEE IPIN 2018] Ta, Viet-Cuong, Trung-Kien Dao, Dominique Vaufreydaz, and Eric Castelli. "Smartphone-based user positioning in a multiple-user context with Wi-Fi and Bluetooth." In *2018 International Conference on Indoor Positioning and Indoor Navigation (IPIN)*, pp. 206-212. IEEE, 2018.