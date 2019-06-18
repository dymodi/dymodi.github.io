---
layout: post
title: Related Works of Beacon Based Indoor Localization
date: June 9, 2018
author: Yi DING
---

In this blog, we review the existing work related to the indoor localization based on bluetooth low energy (BLE) beacons.  

Among all the literature listed here, [8] provides most comprehensive introduction on this topic. First, we need to keep in mind that GPS is not available in the indoor scenario [9].

Wi-Fi based indoor localization has much in common with BLE beacon based indoor localization, hence will also be considered in this survey.

The advantages of using BLE in indoor localization (distinction compared with Wi-Fi):

* Quick and flexible deployment (compared with VLC). [5] (Not for that in [6]) [8]
* Reasonable pricing. [5]
* Low energy consumption (especially compared with Wi-Fi postitioning). [5][8]
* High refresh rate. [5]



**Basic Facts**

Two main categories [11]. A simple explanation is "The former fingerprints locations in the area of interest and then searches for the best matching location, while the latter trains a signal propagation model using training/calibration data and then applies trilateration for localization." 

* Fingerprint-based [8]
* Model-based

Two steps are needed in model-based approaches, from RSSI to distance, and from distance to locations.

From RSSI to distance:

* Path loss function + calibration [2, 5, 7, 10]

From to distance to location:

* Particle filter
* Trilateration
* Weighted centroid [7]

**Special Topics**

* EZ: Indoor Localization without Pain, [13], *MobiCom 10*
  * No need for physical layout, i.e. the position of AP is unknown
  * Assume universal LDPL equation (as constraints)
  * Assume occasional location fix (entrance, window)
* Zee: Zero-Effort Crowdsourcing, [14], *MobiCom 12*
  * No need for site-specific calibration
  * Assume map showing pathways and barriers
* Modellet: Diversity in Data Density and Environmental Locality, [11], *MobiCom 14*
  * Can handle diversity in training data density and environment condition for real-world deployment
  * Device diversity is not considered
  * Still relies on fingerprint. (which is impossible in real large scale problem)
* UnLoc: Unsupervised Indoor Localization [15], *MobiSys 12*
  * Signal landmarks in the building as anchors
  * Dead reckoning using to locate between anchors
  * Device diversity not considered
  * Landmark not available at everywhere
* Beacon system to collect data [6]



### Review for each paper:

[1] is a demo paper that build a small indoor system with pass loss equation, trilateration and particle filtering. Trilateration in this paper seems more like a wighted sum of nearby beacons. No details of particle filter is included in the paper.

[2] is a poster paper that propose *"Multi-Ranging"* method (different transmission power) to address the RSSI fluctuation, *moving average* is also used to reduce the fluctuation. Path loss equation is also used.

[3] is a traditional methods that combines *Fingerprinting* and *ANN*.

[4] is a poster paper propose corridor level localization and navigation with a *graph based* method. No need for accurate positioning. No details are included.

[5] uses path loss equation to transfer RSSI to distances, used some tricks (aggregation and remove noise) to reduce the influence of fluctuation. Paricle filtering is used to get and track the final position.

[6] provides a different angle that mobile phone as TX and beacons as RX. This paper is more like the Rider Arrival Departure Detection (RADD) problem setting where we only care about the arrival and departure time at a certain spot. No more technical details are discussed in the paper. Our RADD problem also has the following challenges: passing by is different from arrival, noise data and missing data, different hardware and unknown deployment environment.

[7] uses a *Weighted Centroid* method that use distance as weight. Path loss equation is used to get the distance and Kalman filter is used to handle the fluctuation.

[8] provides a detailed study of BLE *fingerprinting*. The advantages of indoor positioning using BLE beacon compared with Wi-Fi is discussed in the paper.

[10] uses a combined method of Kalma filter (to remove fluctuation) and patical filtering (to estimate position).

[11] discusses a indoor localization system based on Wi-Fi.  Although this paper is for WI-FI based indoor localization system, the problem discussed in the paper is also met in BLE based localization: due to complexity in real world environment, there is no unified algorithm for all applications. The problem is, fingerprinting is also needed in this method, which is not applicable in our case.



### Solution to RSSI fluctuation

| Methods          | Papers    | Notes                                 |
| ---------------- | --------- | ------------------------------------- |
| *Moving average* | [2], [8]  | Or use a window filter                |
| *Aggregation*    | [5]       | Also remove highest and lowest values |
| *Kalman filter*  | [7], [10] |                                       |





### Some comments:

* The beacon signal with higher RSSI is more reliable. [1] [7]
* BLE RSSI value is not reliable as a indicator of distance, due to many factors. [2]
* BLE RSSI has a strong fluctuation effect due to [fast fading](http://www.rfwireless-world.com/Terminology/fast-fading-vs-slow-fading.html). [8]
* BLE RSSI fluctuation has a negative influence on localization accuracy and how to reduce the fluctuation becomes an main issue. [2][5][10]
* Density of deployed transmitters has significant impact on accuracy. [5]
* Some basic experiment results are shown on BLE RSSI are shown in [2][8][10] (static performance), [5] (exponential decreasing) and [8] (RSSI variation with receiver moving).
* More about BLE beacon sensor power consumption can be found in the [SensingKit Report](http://ieeexplore.ieee.org/abstract/document/7723503/).
* An interesting and useful knowledge for indoor positioning: The average human walking pace is approximately 1.5m/s [8].


* No unified algorithm is applicable in real world large scale system due to complex environment. [11]
* Some challenges are still there before we can achieve a ubiquitous indoor localization system. [12]



### Ref

Note: paper with bold title are recommended for reading.

#### MobiCom

[13] Krishna Chintalapudi. 2010. **Indoor Localization Without the Pain**. In *ACM MobiCom*, 173–184. 

[14] Anshul Rai. 2012. **Zee : Zero-Effort Crowdsourcing for Indoor Localization Categories and Subject Descriptors**. In *ACM MobiCom*, 293–304.

[11] Li, L., 2014, **Experiencing and handling the diversity in data density and environmental locality in an indoor positioning service**. In *ACM MobiCom* 59-470

#### MobiSys

[15] He Wang, S Sen, and Ahmed Elgohary. 2012. **No need to war-drive: Unsupervised indoor localization**. *ACM MobiSys*, 197–210. 

[16] Kaikai Liu, Xinxin Liu, and Xiaolin Li. 2013. **Guoguo: Enabling Fine-grained Indoor Localization via Smartphone**. *ACM MobiSys*, 235. 

[4] Huang, Q. 2016,. **Poster: Simplified In-door WiFi-Beacon Navigation System Without Exact Location**. In *ACM MobiSys* 33-33

#### Large Scale Indoor Localization System

[11] Li, L., 2014, **Experiencing and handling the diversity in data density and environmental locality in an indoor positioning service**. In *ACM MobiCom* 59-470

[12] Youssef, M. (2015, November). **Towards truly ubiquitous indoor localization on a worldwide scale**. In Proceedings of the 23rd SIGSPATIAL International Conference on Advances in Geographic Information Systems (p. 12). ACM.

#### Others

[2] Golestanian, M., & Poellabauer, C. (2016, July). **Indoor localization using multi-range beaconing: poster**. In Proceedings of the 17th ACM International Symposium on Mobile Ad Hoc Networking and Computing (pp. 397-398). ACM.

[6] Chang, C. M., Li, S. C., & Huang, Y. (2016, December). **Building Bluetooth Beacon-based Network for Spatial-Temporal Data Collection**. In Proceedings of the 2016 International Conference on Communication and Information Systems (ICCIS) (pp. 91-95). ACM.

[7] Subedi, S., Kwon, G. R., Shin, S., Hwang, S. S., & Pyun, J. Y. (2016, July). **Beacon based indoor positioning system using weighted centroid localization approach**. In Ubiquitous and Future Networks (ICUFN), 2016 Eighth Internat

[8] Faragher, R., & Harle, R. (2015). **Location fingerprinting with bluetooth low energy beacons**. IEEE journal on Selected Areas in Communications, 33(11), 2418-2428.

[9] Miller, L. E. (2006). **Indoor navigation for first responders: a feasibility study**. National Institute of Standards and Technology, Wireless Communication Technologies Group.

[10] Zafari, F., Papapanagiotou, I., Devetsikiotis, M., & Hacker, T. (2017). **An iBeacon based Proximity and Indoor Localization System**. arXiv preprint arXiv:1703.07876.

#### Complementary

[1] Martin, P., Ho, B. J., Grupen, N., Muñoz, S., & Srivastava, M. (2014, November). An iBeacon primer for indoor localization: demo abstract. In Proceedings of the 1st ACM Conference on Embedded Systems for Energy-Efficient Buildings (pp. 190-191). ACM.

[3] Mazan, F., & Kovarova, A. (2016, June). Optimizing Artificial Neural Network for Beacon Based Indoor Localization. In Proceedings of the 17th International Conference on Computer Systems and Technologies (ICCST) 2016 (pp. 261-268). ACM.

[5] Filípek, P., & Kovarova, A. (2016, June). Indoor Localization Based on Beacons and Calculated by Particle Filter. In Proceedings of the 17th International Conference on Computer Systems and Technologies (ICCST) 2016 (pp. 269-276). ACM.