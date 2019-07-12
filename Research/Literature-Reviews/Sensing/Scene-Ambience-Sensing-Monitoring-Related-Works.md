---
author: Yi DING
layout: post
title: Related Works of Context/Scene/Ambience Sensing/Monitoring 
date: May 6, 2019
---



Context/Scene/Ambience Sensing/Monitoring and Context Sharing are related topics.

We may need to broaden the scope (Walkway) and consider some industrial progress.

Localization is a special type of context and related works on localization can be found [here](https://dymodi.github.io/Research/Literature-Reviews/Indoor-Localization-Related-Works).



**Keyword**

* Context sensing
* Context-aware computing
* Context modeling
* Context-sensitive



**Taxonomy**

* Context:
  * Acoustic: *MobiSys13-Auditeur*, *WWW14*
  * Activity/Behavior: *MobiCom14-ParkSense*, *SenSys14-Barometer*, *CHI19*,  *Katabi19-Passive*
  * Attitude: *MobiCom14-A3*
  * Floor/Altitude: *HotMobile14*, 
  * Indoor/Outdoor: *SenSys12-IODetector*, *SenSys14-CoTrain*
  * Light
  * Map: *KDD12*, *TOSN15*,IPSN18
  * Semantic context: *SenSys12-CrowdMon*
  * Door open/close: *UbiComp15*
* Sensor: Accelerometer, Barometer, Cell RSS, Compass, GPS, Gyroscope, Light, Magnetic, Microphone, Proximity, Wi-Fi, Specialized device
* Solution: machine learning, deep learning

**Comments**

* 

**Special Topics**

* CrowdMon, *SenSys12*
  * Taxonomy: Semantic context
* IODetector, *SenSys12*
  * Taxonomy: Indoor/Outdoor, Accelerometer, Cell RSS, Light, Magnetic
  * Light, cell RSS and magnetic field have different distributions indoor and outdoor.
* Auditeur, *MobiSys13*
  * Taxonomy: Acoustic, Microphone
  * User upload sound fragment with tag, cloud training, online learning on phone. 
  * Recognize who/where
* Barometric Phone Sensors, *HotMobile14*
  * Taxonomy: Floor/Altitude, Barometer
  * Floor/Altitude sensing is difficult since pressure is affected by many factors such as temperature and time.
* Barometric and GPS altitude sensor fusion, *ICASSP14*
  * Taxonomy: Floor/Altitude, Barometer
* $$A^3$$: Instantly Knowing Your Phone Attitude, *MobiCom14*
  * Taxonomy: Attitude, Compass, Gyroscope
* ParkSense: Sensing System For On-Street Parking, *MobiCom14*
  * Taxonomy: Activity/Behavior, Wi-Fi
  * Detect the unpark activity by sensing whether driver has return and drive away.
* Barometer for Low-Power Transportation Context Detection, *SenSys14*
  * Taxonomy:  Activity/Behavior, Barometer
  * Use barometer to detect three types of motion: IDLE, WALKING, and VEHICLE
* CoTrain: A Semi-Supervised Learning Approach for Robust Indoor-Outdoor Detection, *SenSys14*
  * Taxonomy: Indoor/Outdoor, Accelerometer, Cell RSS, Light, Magnetic
* Local business ambience, *WWW14*
  * Taxonomy: Acoustic, Microphone
  * Build a updated version of Koubei to provide more context info such as occupancy/music/noise
* SmartRoad: Crowd Sensing for Traffic Regulator Detection and Identification, *TOSN15*
  * Taxonomy: Map, GPS
  * Can detect and identify traffic regulators, traffic lights, and stop signs.
* Monitoring Building Door Events using Barometer, *UbiComp15*
  * Taxonomy: Barometer, Door open/close
* VitalAlley: Walkway Discovery from Large Scale Crowdsensing, *IPSN18*
  * Taxonomy: Map, GPS
  * Build the map of the human walkway from user GPS data
* Enabling Identification and Behavioral Sensing in Homes, *CHI19*
  * Taxonomy: Activity (Monitoring), Specialized device
  * 3D identification and behavior sensing
* Passive Monitoring at Home, *Katabi19*
  * Taxonomy: Activity (Monitoring), Specialized device
  * It's not a simple activity recognition but a continuous monitoring with high definition and accuracy

##  Ref.

[KDD12] Liu, X., Biagioni, J., Eriksson, J., Wang, Y., Forman, G., & Zhu, Y. (2012, August). **Mining large-scale, sparse GPS traces for map inference: comparison of approaches**. In *SIGKDD* (pp. 669-677). ACM.

[SenSys12-CrowdMon] Pushp, S., Min, C., Lee, Y., Liu, C. H., & Song, J. (2012, November). **Towards crowd-aware sensing platform for metropolitan environments**. In *SenSys* (pp. 335-336). ACM.

[SenSys12-IODetector] Zhou, P., Zheng, Y., Li, Z., Li, M., & Shen, G. (2012, November). **IODetector: A generic service for indoor outdoor detection**. In *SenSye* (pp. 113-126). ACM.

[MobiSys13-Auditeur] Nirjon, S., Dickerson, R. F., Asare, P., Li, Q., Hong, D., Stankovic, J. A., ... & Jiang, X. (2013, June). **Auditeur: A mobile-cloud service platform for acoustic event detection on smartphones**. In *MobiSys* (pp. 403-416). ACM.

[HotMobile14-Barometric] Muralidharan, K., Khan, A. J., Misra, A., Balan, R. K., & Agarwal, S. (2014, February). **Barometric phone sensors: More hype than hope!**. In *HotMobile* (p. 12). ACM.

[ICASSP14-Barometric] Zaliva, V., & Franchetti, F. (2014, May). **Barometric and GPS altitude sensor fusion**. In *ICASSP* (pp. 7525-7529). IEEE.

[MobiCom14-A3] Zhou, P., Li, M., & Shen, G. (2014, September). **Use it free: Instantly knowing your phone attitude**. In *MobiCom* (pp. 605-616). ACM.

[MobiCom14-ParkSense] Nawaz, S., Efstratiou, C., & Mascolo, C. (2013, September). **Parksense: A smartphone based sensing system for on-street parking**. In *MobiCom* (pp. 75-86). ACM.

[SenSys14-Barometer] Sankaran, K., Zhu, M., Guo, X. F., Ananda, A. L., Chan, M. C., & Peh, L. S. (2014, November). **Using mobile phone barometer for low-power transportation context detection**. In *SenSys* (pp. 191-205). ACM.

[SenSys14-CoTrain] Radu, V., Katsikouli, P., Sarkar, R., & Marina, M. K. (2014, November). **A semi-supervised learning approach for robust indoor-outdoor detection with smartphones**. In *SenSys* (pp. 280-294). ACM

[WWW14] Wang, H., Lymberopoulos, D., & Liu, J. (2014, April). **Local business ambience characterization through mobile audio sensing**. In *WWW* (pp. 293-304). ACM.

[TOSN15] Hu, S., Su, L., Liu, H., Wang, H., & Abdelzaher, T. F. (2015). **Smartroad: Smartphone-based crowd sensing for traffic regulator detection and identification**. *ACM Transactions on Sensor Networks (TOSN)*, *11*(4), 55.

[UbiComp15] Wu, M., Pathak, P. H., & Mohapatra, P. (2015, September). **Monitoring building door events using barometer sensor in smartphones**. In *UbiComp*(pp. 319-323). ACM.

[IPSN18] Cao, C., Liu, Z., Li, M., Wang, W., & Qin, Z. (2018, April). **Walkway discovery from large scale crowdsensing**. In *IPSN* (pp. 13-24). IEEE.

[CHI19] Hsu, C. Y., Hristov, R., Lee, G. H., Zhao, M., & Katabi, D. (2019, April). **Enabling Identification and Behavioral Sensing in Homes using Radio Reflections**. In *CHI* (p. 548). ACM.

[Katabi19-Passive] Kabelac, Z., Tarolli, C. G., Snyder, C., Feldman, B., Glidden, A., Hsu, C. Y., ... & Katabi, D. (2019). **Passive Monitoring at Home: A Pilot Study in Parkinson Disease**. *Digital Biomarkers*, *3*(1), 22-30.



**Industry Progress**

- Skyhook: Cooperative partner of Apple in localization. Massive dataset on GPS/Wi-FI/Cell-Tower/BLE. Provide user localization and trace analysis together with commercial value.
- Emerald: Achieve **device-free** monitoring (3D movement / Sleep / other physiological signal) through specialized device (with **strong sensing** and **variety signal transmitting capacity**)
- Advantech: Evolution of traditional industrial sensing through **Wzzard** (wireless sensor + self forming + configuration on cloud security gateway).
- Other traditional sensing applications (BeanAir/VersaSense): structural health, ground vibration, environment.