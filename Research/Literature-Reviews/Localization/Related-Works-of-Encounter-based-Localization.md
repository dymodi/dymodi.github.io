---
author: Yi DING
layout: post
title: Related Works of Encounter-based Localization
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
  * Taxonomy:
    * 
  * Comments:
    * Highly cited paper (>1000), one of the pioneer works on cooperative localization.
    * Cooperative localization is one of the related topics of encounter-based localization.
* Did You See Bob? *[MobiCom 2010, Escort]*
  * Taxonomy: Audio for encounter detection, Dead reckoning on IMU
  * Contributions:
    * (1) One of the ealiest work on "encounter-based localization";
    * (2) No need of calibration, war-driving and floor plan;
  * Limitations:
    * (1) Need deploy audio beacons in the building;
* Collaborative pdr localisation with mobile phones, *[ISWC 2011]*
  * Taxonomy: no fixed encounter detection methods, using problistic methods for localization;
  * Contributions: 
    * (1) **Intellectual Novelty**: use encounter information to improve dead reckoning accuracy.
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
* M2M Encountering, *[Sensor Journal 2016]*
* 

## Ref.

[INFOCOM 2003] Grossglauser, Matthias, and Martin Vetterli. "Locating nodes with EASE: Last encounter routing in ad hoc networks through mobility diffusion." In *IEEE INFOCOM 2003. Twenty-second Annual Joint Conference of the IEEE Computer and Communications Societies (IEEE Cat. No. 03CH37428)*, vol. 3, pp. 1954-1964. IEEE, 2003.

[IEEE 2009] Wymeersch, Henk, Jaime Lien, and Moe Z. Win. "Cooperative localization in wireless networks." *Proceedings of the IEEE* 97, no. 2 (2009): 427-450

[MobiCom 2010, Escort] Constandache, Ionut, Xuan Bao, Martin Azizyan, and Romit Roy Choudhury. "Did you see Bob? Human localization using mobile phones." In *Proceedings of the sixteenth annual international conference on Mobile computing and networking*, pp. 149-160. 2010.

[MobileHoc 2012, EBT] Symington, Andrew, and Niki Trigoni. "Encounter based sensor tracking." In *Proceedings of the thirteenth ACM international symposium on Mobile Ad Hoc Networking and Computing*, pp. 15-24. 2012.

[SenSys 2013, Social-Loc] Jun, Junghyun, Yu Gu, Long Cheng, Banghui Lu, Jun Sun, Ting Zhu, and Jianwei Niu. "Social-Loc: Improving indoor localization with social sensing." In *Proceedings of the 11th ACM Conference on Embedded Networked Sensor Systems*, pp. 1-14. 2013.

[BuildSys 2014] Martin, Paul, Yasser Shoukry, Prashanth Swaminathan, Robin Wentao Ouyang, and Mani Srivastava. "Social spring: encounter-based path refinement for indoor tracking systems." In *Proceedings of the 1st ACM Conference on Embedded Systems for Energy-Efficient Buildings*, pp. 156-159. 2014.

[MobileHCI 2014] Shin, Hyojeong, Taiwoo Park, Seungwoo Kang, Bupjae Lee, Junehwa Song, Yohan Chon, and Hojung Cha. "CoSMiC: Designing a mobile crowd-sourced collaborative application to find a missing child in situ." In *Proceedings of the 16th international conference on Human-computer interaction with mobile devices & services*, pp. 389-398. 2014.

[Sensor Journal 2016] Qiu, Jun-Wei, and Yu-Chee Tseng. "M2M encountering: Collaborative localization via instant inter-particle filter data fusion." *IEEE Sensors Journal* 16, no. 14 (2016): 5715-5724.

