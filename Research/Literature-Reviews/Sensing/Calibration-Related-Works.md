---
author: Yi DING
layout: post
title: Related Works of Calibration
date: July 3, 2019
---

**Taxonomy**

* One-hop, Multi-hop
* Application: mobile sensing system, motion detection
* Mechanism: opportunistic interaction, machine learning
* Calibration level: signal level, data level

**Comments**

* 

**Individual Papers**

* Collaborative calibration, *IPSN2012*
  * Taxonomy: One-hop, mobile sensing system, opportunistic interaction, signal level
  * Assumptions: (1) Sensor can communication with each other; (2) Drifts are independent and grows with time; (3) Known reference sensor in the system;
  * The main idea is that interactions among sensors can be used to adjust their calibration functions and error estimates.
* Multi-Hop, *IPSN2015*
  * Taxonomy: Multi-hop, signal level
  * Assumption: (1) Known reference sensor in the system;
  * Based on the fact that temporally and spatially close measurements of different sensors measuring the same phenomenon are similar. A rendezvous connection graph is built.
* COTS WiFi, *SenSys2017*
  * Taxonomy: Motion detection, signal level
  * Only process phase noise.
* You are sensing, but are you biased? *IMWUT2018*
  * Taxonomy: mobile sensing system, data level, machine learning
  * Only consider accelerometer and gyroscope, because the opportunity comes from the fact that no extra force when in stationary state, hence only motion related sensor can be calibrated in this way.



[comment]: # "Why we can do this: (1) Fixed environment makes spatial based aggregation possible; (2) Heterogeneous is different from drifting in the sense that same device/enviroment shares the heterogeneous while drifting cannot be shared; Hence in [IPSN2012], historical knowledge or same user knowledge is not used. That is, only spatial rendezvous is exploited, but historical data are not used."



## Ref.

[IPSN12] Xiang, Y., Bai, L. S., Pledrahita, R., Dick, R. P., Lv, Q., Hannigan, M., & Shang, L. (2012, April). **Collaborative calibration and sensor placement for mobile sensor networks**. In *IPSN* (pp. 73-83). IEEE.

[IPSN15] Saukh, O., Hasenfratz, D., & Thiele, L. (2015, April). **Reducing multi-hop calibration errors in large-scale mobile sensor networks**. In *IPSN* (pp. 274-285). ACM.

[SenSys17] Zhu, J., Im, Y., Mishra, S., & Ha, S. (2017, November). **Calibrating Time-variant, Device-specific Phase Noise for COTS WiFi Devices**. In *SenSys* (p. 15). ACM.

[IMWUT18] Grammenos, A., Mascolo, C., & Crowcroft, J. (2018). **You are sensing, but are you biased?: A user unaided sensor calibration approach for mobile sensing**. *IMWUT*, *2*(1), 11.