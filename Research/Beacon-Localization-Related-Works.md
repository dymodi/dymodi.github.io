--- 
layout: post
title: Related Works of Beacon Based Indoor Localization
date: June 9, 2017
author: Yi DING
---

[comment]: # (This blog compose the RELATED WORK section of future paper)

In this blog, we review the existing work related to the indoor localization based on bluetooth low energy (BLE) beacons. Note that this review only consists publications with "Beacon" as keywords. The BLE localization is a bigger topic with more impactive publications. Among all the literature listed here, [8] provides most comprehensive introduction on this topic.

The advantages of using BLE in indoor localization:
* Quick and flexible deployment (compared with VLC). [5] (Not for that in [6]) [8]
* Reasonable pricing. [5]
* Low energy consumption (especially compared with Wi-Fi postitioning). [5][8]
* High refresh rate. [5]

Localization method: (Mechanism based methods are also called determinisitic methods)
1. Mechanism based. Optimization based on trilateration. [1]
2. Mechanism based. Multi-Range based on different transmission power. [2]
3. Data based. Artitifial neural networking.[3]
4. Mechanism based. Build a graph and provide corridor level localization. [4]
5. Mechanism based. Particle filter. [5]
6. Mechanism based. BLE bracelets emits signals to fixed BLE beacon receivers. [6]
7. Mechanism based. Weighted centroid localization. [7]
8. Fingerprinting (seems like a combination of data and mechanism). [8]

Some comments:
* The beacon signal with higher RSSI is more reliable. [1][7]
* BLE RSSI value is not reliable as a indicator of distance, due to many factors. [2]
* BLE RSSI has a strong fluctuation effect due to [fast fading](http://www.rfwireless-world.com/Terminology/fast-fading-vs-slow-fading.html). [8]
* BLE RSSI fluctuation has a negative influence on localization accuracy and how to reduce the fluctuation becomes an main issue. [2][5]
* Density of deployed transmitters has significant impact on accuracy. [5]
* Some basic experiment results are shown on BLE RSSI are shown in [2][8] (static performance), [5] (exponential decreasing) and [8] (RSSI variation with receiver moving).
* Kalman filter is also used to filter the RSSI values. [7]
* More about BLE beacon sensor power consumption can be found in the [SensingKit Report](http://ieeexplore.ieee.org/abstract/document/7723503/).
* An interesting and useful knowledge for indoor positioning: The average human walking pace is approximately 1.5m/s [8].

No discussion on the security issue.

[1] Martin, P., Ho, B. J., Grupen, N., Muñoz, S., & Srivastava, M. (2014, November). **An iBeacon primer for indoor localization: demo abstract**. In Proceedings of the 1st ACM Conference on Embedded Systems for Energy-Efficient Buildings (pp. 190-191). ACM.

[2] Golestanian, M., & Poellabauer, C. (2016, July). **Indoor localization using multi-range beaconing: poster**. In Proceedings of the 17th ACM International Symposium on Mobile Ad Hoc Networking and Computing (pp. 397-398). ACM.

[3] Mazan, F., & Kovarova, A. (2016, June). **Optimizing Artificial Neural Network for Beacon Based Indoor Localization**. In Proceedings of the 17th International Conference on Computer Systems and Technologies (ICCST) 2016 (pp. 261-268). ACM.

[4] Huang, Q., Yagi, Y., Takahashi, J., & Tobe, Y. (2016, June). **Poster: Simplified In-door WiFi-Beacon Navigation System Without Exact Location**. In Proceedings of the 14th Annual International Conference on Mobile Systems, Applications, and Services Companion (pp. 33-33). ACM.

[5] Filípek, P., & Kovarova, A. (2016, June). **Indoor Localization Based on Beacons and Calculated by Particle Filter**. In Proceedings of the 17th International Conference on Computer Systems and Technologies (ICCST) 2016 (pp. 269-276). ACM.

[6] Chang, C. M., Li, S. C., & Huang, Y. (2016, December). **Building Bluetooth Beacon-based Network for Spatial-Temporal Data Collection**. In Proceedings of the 2016 International Conference on Communication and Information Systems (ICCIS) (pp. 91-95). ACM.

[7] Subedi, S., Kwon, G. R., Shin, S., Hwang, S. S., & Pyun, J. Y. (2016, July). **Beacon based indoor positioning system using weighted centroid localization approach**. In Ubiquitous and Future Networks (ICUFN), 2016 Eighth Internat

**[8]** Faragher, R., & Harle, R. (2015). **Location fingerprinting with bluetooth low energy beacons**. IEEE journal on Selected Areas in Communications, 33(11), 2418-2428.