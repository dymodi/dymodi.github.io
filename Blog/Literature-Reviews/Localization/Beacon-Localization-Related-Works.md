---
layout: post
title: Related Works of BLE Beacon Based Application
date: Jan. 7, 2020
author: Yi DING
---

In this blog, we review the existing work related to applications based on BLE beacons.  

The advantages of using BLE in indoor localization (distinction compared with Wi-Fi):

* Quick and flexible deployment (compared with VLC). [ICCST16, JSAC15]
* Reasonable pricing. [ICCST16]
* Low energy consumption (especially compared with Wi-Fi postitioning). [JSAC15]
* High refresh rate. [ICCST16]



**Taxonomy**

* **Localization**

  * **Fingerprint-based** [JSAC15]: Fingerprints locations in the area of interest and then searches for the best matching location
  * **Model-based:** Trains a signal propagation model using training/calibration data 
    * Two steps are needed, from RSSI to distance, and from distance to locations.
      * From RSSI to distance:
        * Path loss function + calibration [AVSS15, MobiHoc16, ICCST16, ICUFN16, arXiv17]
      * From to distance to location:
        * Particle filter
        * Trilateration
        * Weighted centroid [ICUFN16]

* **Data Collection** [ICCIS16]

  

### Detailed Review

* BuildSys14: An iBeacon Primer for Indoor Localization
  * Taxonomy: Model-based
  * Summary: A demo paper that build a small indoor system with pass loss equation, trilateration and particle filtering. Trilateration in this paper seems more like a wighted sum of nearby beacons. No details of particle filter is included in the paper.
* ICCST16:  Indoor Localization Based on Beacons and Calculated by Particle Filter
  * Taxonomy: Model-based
  * Summary: uses path loss equation to transfer RSSI to distances, used some tricks (aggregation and remove noise) to reduce the influence of fluctuation. Paricle filtering is used to get and track the final position.
* MobiHoc16: Indoor Localization using Multi-Range Beaconing
  * Taxonomy: Model-based
  * Summary: a poster paper that propose *"Multi-Ranging"* method (different transmission power) to address the RSSI fluctuation, *moving average* is also used to reduce the fluctuation. Path loss equation is also used.
* ICCIS16: Building Bluetooth Beacon-based Network for Spatial- Temporal Data Collection
  * Taxonomy: Presence detection
  * Summary: Provides a different angle that mobile phone as TX and beacons as RX. This paper is more like the Rider Arrival Departure Detection (RADD) problem setting where we only care about the arrival and departure time at a certain spot. No more technical details are discussed in the paper. 

* ICUFN16: Beacon Based Indoor Positioning System Using Weighted Centroid Localization Approach
  * Taxonomy: Model-based
  * Summaryuses a *Weighted Centroid* method that use distance as weight. Path loss equation is used to get the distance and Kalman filter is used to handle the fluctuation.* 

* JSAC15: Location Fingerprinting With Bluetooth Low Energy Beacons
  * Summary: Provides a detailed study of BLE *fingerprinting*. The advantages of indoor positioning using BLE beacon compared with Wi-Fi is discussed in the paper.

* arXiv17, An iBeacon based Proximity and Indoor Localization System

  * Summary: uses a combined method of Kalma filter (to remove fluctuation) and patical filtering (to estimate position).

* SIGSPATIAL18, Global Map Matching using BLE Beacons for Indoor Route and Stay Estimation

  * Taxonomy: Fingerprinting

  * Summary: Borrow the idea of map matching from GPS to indoor localization

    



### Solution to RSSI fluctuation

| Methods          | Papers              | Notes                                 |
| ---------------- | ------------------- | ------------------------------------- |
| *Moving average* | [JSAC15, MobiHoc16] | Or use a window filter                |
| *Aggregation*    | [ICCST16]           | Also remove highest and lowest values |
| *Kalman filter*  | [ICUFN16,arXiv17]   |                                       |



### Some comments:

* The beacon signal with higher RSSI is more reliable. [BuildSys14,ICUFN16]
* BLE RSSI value is not reliable as a indicator of distance, due to many factors. [MobiHoc16]
* BLE RSSI has a strong fluctuation effect due to [fast fading](http://www.rfwireless-world.com/Terminology/fast-fading-vs-slow-fading.html). [JSAC15]
* BLE RSSI fluctuation has a negative influence on localization accuracy and how to reduce the fluctuation becomes an main issue. [ICCST16, MobiHoc16, arXiv17]
* Density of deployed transmitters has significant impact on accuracy. [ICCST16]
* Some basic experiment results are shown on BLE RSSI are shown in [MobiHoc16,JSAC15,arXiv17] (static performance), [ICCST16] (exponential decreasing) and [JSAC15] (RSSI variation with receiver moving).
* More about BLE beacon sensor power consumption can be found in the [SensingKit Report](http://ieeexplore.ieee.org/abstract/document/7723503/).
* An interesting and useful knowledge for indoor positioning: The average human walking pace is approximately 1.5m/s [JSAC15].


* No unified algorithm is applicable in real world large scale system due to complex environment. f
* Some challenges are still there before we can achieve a ubiquitous indoor localization system. [arXiv17]



### Ref.

[BuildSys14] Martin, P., Ho, B. J., Grupen, N., Muñoz, S., & Srivastava, M. (2014, November). **An iBeacon primer for indoor localization: demo abstract**. In *BuidSys*. ACM.

[AVSS15] Palumbo, F., Barsocchi, P., Chessa, S., & Augusto, J. C. (2015, August). **A stigmergic approach to indoor localization using bluetooth low energy beacons**. In *AVSS*,  IEEE.

[JSAC15] Faragher, R., & Harle, R. (2015). **Location fingerprinting with bluetooth low energy beacons**. IEEE journal on Selected Areas in Communications, 33(11), 2418-2428.

[SIGSPATIAL15] Youssef, M. (2015, November). **Towards truly ubiquitous indoor localization on a worldwide scale**. In *SIGSPATIAL*. ACM.

[ICCST16] Filípek, P., & Kovarova, A. (2016, June). **Indoor Localization Based on Beacons and Calculated by Particle Filter**. In *ICCST*. ACM.

[ICUFN16] Subedi, S., Kwon, G. R., Shin, S., Hwang, S. S., & Pyun, J. Y. (2016, July). **Beacon based indoor positioning system using weighted centroid localization approach**. In ICUFN, 2016 Eighth Internat

[ICCIS16] Chang, C. M., Li, S. C., & Huang, Y. (2016, December). **Building Bluetooth Beacon-based Network for Spatial-Temporal Data Collection**. In *ICCIS*. ACM.

[MobiHoc16] Golestanian, M., & Poellabauer, C. (2016, July). **Indoor localization using multi-range beaconing: poster**. In *MobiHoc*. ACM.

[arXiv17] Zafari, F., Papapanagiotou, I., Devetsikiotis, M., & Hacker, T. (2017). **An iBeacon based Proximity and Indoor Localization System**. arXiv preprint arXiv:1703.07876.

[SIGSPATIAL18] Yamamoto, D., Tanaka, R., Kajioka, S., Matsuo, H., & Takahashi, N. (2018, November). **Global map matching using BLE beacons for indoor route and stay estimation**. In *SIGSPATIAL*. ACM.



