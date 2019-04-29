---
author: Yi DING
layout: post
title: Related Works of RSSI-based Sensing
date: April 29, 2019
---

**Taxonomy**

* RSSI-based Features: Time related features (e.g., period of slope), Min/Max related features, 
* 

**Comments**

* Tracking Human Queues[MobiSys14] has a very detailed description of what are derived from RSSI raw data and used as feature for following sensing.

* Although [MobiCom15] is a CSI based work, there is a good survey on the RSSI-based human activity recognition topic. But the survey here is to citing some RSSI-based works and show their performance defects compared with (author's) CSI-based work.

  

**Special Topics**

* Tracking Human Queues, *MobiSys14*
  * RSSI-based Features: Time related features, Min/Max related features
  * Three features are extracted from raw RSSI data: (1) Longest period of negative slopes in the trace; (2) Stable RSS & largest RSS value during service; (3) Largest change of RSS in the trace. 

<p align = "center">
<img src="figures/TrackingHumanQueues_MobiSys14.png"  alt="RSSI Features" height="400">
</p>

(Figure from the Paper)



## Ref.

[MobiSys14] Wang, Y., Yang, J., Chen, Y., Liu, H., Gruteser, M., & Martin, R. P. (2014, June). **Tracking human queues using single-point signal monitoring.** In *MobiSys* (pp. 42-54). ACM.

[MobiCom15] Wang, W., Liu, A. X., Shahzad, M., Ling, K., & Lu, S. (2015, September). **Understanding and modeling of wifi signal based human activity recognition**. In *MobiCom*(pp. 65-76). ACM.

