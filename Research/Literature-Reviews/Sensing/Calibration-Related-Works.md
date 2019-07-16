---
author: Yi DING
layout: post
title: Related Works of Mobile Sensing Calibration
date: July 3, 2019
---

**Taxonomy**

* Mechanical (Model) based / Reference based
* Reference based: Neighborhood(One-hop), Multi-hop
* Mechanism: opportunistic interaction, machine learning, mechanical sensing model, data fusion
* Calibration level: signal level, data level, system level
* Application: mobile sensing system, motion detection

**Comments**

* 

**Individual Papers**

* CaliBree: A Self-calibration System for Mobile Sensor Networks, *ICDCS08*
  * Taxonomy: Reference based, One-hop, mobile sensing system, opportunistic interaction
  * Assumption: Opportunistic rendezvous
* Collaborative calibration, *IPSN2012*
  * Taxonomy: Reference based, One-hop, mobile sensing system, opportunistic interaction, signal level
  * Assumptions: (1) Sensor can communication with each other; (2) Drifts are independent and grows with time; (3) Known reference sensor in the system;
  * The main idea is that interactions among sensors can be used to adjust their calibration functions and error estimates.
* Multi-Hop, *IPSN2015*
  * Taxonomy: Reference based, Multi-hop, signal level
  * Assumption: (1) Known reference sensor in the system;
  * Based on the fact that temporally and spatially close measurements of different sensors measuring the same phenomenon are similar. A rendezvous connection graph is built.
* Multihop Calibration for Mobile Sensing, *INFOCOM17*
  * Taxonomy: Reference based, Multi-hop,
  * This paper mainly solve the reference deployment problem
* COTS WiFi, *SenSys2017*
  * Taxonomy: Mechanical (Model) based, Motion detection, signal level
  * Only process phase noise.
* You are sensing, but are you biased? *IMWUT2018*
  * Taxonomy: Mechanical (Model) based, mobile sensing system, data level, machine learning
  * Only consider accelerometer and gyroscope, because the opportunity comes from the fact that no extra force when in stationary state, hence only motion related sensor can be calibrated in this way.



**Appendix: Not Mobile Sensing Calibration**

The key difference between mobile sensing calibration and static sensing calibration is that in mobile sensing, sensors move around hence ...


* A Self-Calibrating Distributed Acoustic Sensing Platform, *SenSys06*
  - ![This is **not** mobile sensing]!
  - Taxonomy: Reference based, One-hop, acoustic system, determined interaction
  - Assumptions: Sensor can hear each other.
  - Use chirp signal to communicate with neighbor nodes and calibrate own position.
* System-Level Calibration for Data Fusion in Wireless Sensor Networks, *TOSN13*
  - ![This is **not** mobile sensing]!
  - Taxonomy: Mechanical (Model) based, local mechanical sensing model+ system data fusion, system level



[comment]: # "Why we can do this: (1) Fixed environment makes spatial based aggregation possible; (2) Heterogeneous is different from drifting in the sense that same device/enviroment shares the heterogeneous while drifting cannot be shared; Hence in [IPSN2012], historical knowledge or same user knowledge is not used. That is, only spatial rendezvous is exploited, but historical data are not used."



## Ref.

[SenSys06] Girod, L., Lukac, M., Trifa, V., & Estrin, D. (2006, October). **A self-calibrating distributed acoustic sensing platform.** In *SenSys* (pp. 335-336). ACM.

[ICDCS08-CaliBree] Miluzzo, E., Lane, N. D., Campbell, A. T., & Olfati-Saber, R. (2008, June). **CaliBree: A self-calibration system for mobile sensor networks**. In *ICDCS* (pp. 314-331). Springer, Berlin, Heidelberg.

[IPSN12] Xiang, Y., Bai, L. S., Pledrahita, R., Dick, R. P., Lv, Q., Hannigan, M., & Shang, L. (2012, April). **Collaborative calibration and sensor placement for mobile sensor networks**. In *IPSN* (pp. 73-83). IEEE.

[TOSN13] Tan, R., Xing, G., Yuan, Z., Liu, X., & Yao, J. (2013). **System-level calibration for data fusion in wireless sensor networks**. *ACM Transactions on Sensor Networks (TOSN)*,

[IPSN15] Saukh, O., Hasenfratz, D., & Thiele, L. (2015, April). **Reducing multi-hop calibration errors in large-scale mobile sensor networks**. In *IPSN* (pp. 274-285). ACM.

[INFOCOM17] Fu, K., Ren, W., & Dong, W. (2017, May). **Multihop calibration for mobile sensing: K-hop calibratability and reference sensor deployment**. In *IEEE INFOCOM* (pp. 1-9). IEEE.

[SenSys17] Zhu, J., Im, Y., Mishra, S., & Ha, S. (2017, November). **Calibrating Time-variant, Device-specific Phase Noise for COTS WiFi Devices**. In *SenSys* (p. 15). ACM.

[IMWUT18] Grammenos, A., Mascolo, C., & Crowcroft, J. (2018). **You are sensing, but are you biased?: A user unaided sensor calibration approach for mobile sensing**. *IMWUT*, *2*(1), 11.