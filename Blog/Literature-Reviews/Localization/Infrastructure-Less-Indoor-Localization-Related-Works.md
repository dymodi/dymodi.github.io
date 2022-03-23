---
layout: post
title: Related Works of Infrastructure Less Indoor Localization
date: Oct. 9, 2019
author: Yi DING
---



**Keywords:** infrastructure/anchor less/free.



**Comments**

- Definition of infrastructure: No unfied definition is given. Generally, infrastructure requires additional hardware (BLE beacon) when provide position information.
- Additional effort (Wi-Fi AP fingerprinting) may be needed.
- It seems that many dead reckoning work (with some natural landmark) claims to be infrastructure less
- Many infrastructure-less work focus on post-disaster rescue work.



**Taxonomy**

* Solution: 
  * Multi-Dimensional Scaling (MDS)
  * Landmark (Light, Known GPS, Acoustic)
  * Dead reckoning
  * learning and sharing (d2d interaction),



**Individual Papers**

* Anchor-Free Distributed Localization in Sensor Networks, SenSys-03
  * Solution: Similar as MDS, nodes communicate with neighbors to estimate relative position, then the whole network converges with absolute position
* Cooperative Anchor-less Localization, *ICUWB-08*
  * Solution: Agents are deployed at known initial position, then cooperate to get each other's position
  * Not traditional dead reckoning, more like multi-agent cooperation.
* Towards Mobile Phone Localization without War-Driving, *INFOCOM-10-CompAcc*
  * Solution: GPS + Dead reckoning (Compass+Accelerometer)
  * Landmark: Initial GPS
* Indoor Localization without Infrastructure, *MobiSys-11*
  * Solution: Acoustic fingerpriting
* A Reliable and Accurate Indoor Localization, *UbiComp-12*
  * Solution: Dead reckoning (step detection + stride length estimation + heading inference)
* Indoor Infrastructure-less Solution based on Sensor Augmented Smartphone, *UPINLBS-12*
  * Solution: Dead reckoning (walking speed from anemometer)
* Finding lane positions of vehicles, *IEEE-15*
  * Solution: Vehicle with camera as landmark and data with other vehicle through V2V
  * Landmark: Vehicle with camera
* Infrastructure-Less Indoor Localization Using Microphone, Magnetometer and Light Sensor,*Sensors-15*
  * Solution: Acoustic, magenetic, and light fingerprinting
  * Landmark: Acoustic, magenetic, and light
* Infrastructure-less indoor localization using light fingerprints, *ICASSP-17*
  * Solution: Light fingerpriting
* Infrastructure-less and calibration-free RFID-based localization, *IEEE-16*
  * Solution: RFID on victim + GPS from responders
  * Landmark: GPS from responders
* Infrastructure independent indoor localization, *MobiSys-16*
  * Solution: Similar as *IEEE-16*, localize victim with known responder position



## Ref.

[SenSys-03] Priyantha, N. B., Balakrishnan, H., Demaine, E. D., & Teller, S. J. (2003, April). **Anchor-free distributed localization in sensor networks**. In *ACM SenSys* (Vol. 3, pp. 340-341).

[ICUWB-08] Ferner, U., Wymeersch, H., & Win, M. Z. (2008, September). **Cooperative anchor-less localization for large dynamic networks**. In *2008 IEEE International Conference on Ultra-Wideband* (Vol. 2, pp. 181-185). IEEE.

[INFOCOM-10-CompAcc] Constandache, I., Choudhury, R. R., & Rhee, I. (2010, March). **Towards mobile phone localization without war-driving**. In *2010 IEEE INFOCOM* (pp. 1-9). IEEE.

[MobiSys-11] Tarzia, S. P., Dinda, P. A., Dick, R. P., & Memik, G. (2011, June). **Indoor localization without infrastructure using the acoustic background spectrum**. In *ACM MobiSys* (pp. 155-168). ACM.

[UbiComp-12] Li, F., Zhao, C., Ding, G., Gong, J., Liu, C., & Zhao, F. (2012, September). **A reliable and accurate indoor localization method using phone inertial sensors**. In *ACM UbiComp* (pp. 421-430). ACM.

[UPINLBS-12] Trehard, G., Lamy-Perbal, S., & Boukallel, M. (2012, October). **Indoor infrastructure-less solution based on sensor augmented smartphone for pedestrian localisation**. In *2012 IEEE UPINLBS* (pp. 1-7). IEEE.

[IEEE-15] Chen, L. W., Shih, H. W., Tsai, M. F., & Deng, D. J. (2015). **Finding lane positions of vehicles: Infrastructure-less cooperative lane positioning based on vehicular sensor networks**. *IEEE Vehicular Technology Magazine*, *10*(4), 70-80.

[Sensors-15] Galván-Tejada, C., García-Vázquez, J., Galván-Tejada, J., Delgado-Contreras, J., & Brena, R. (2015). **Infrastructure-less indoor localization using the microphone, magnetometer and light sensor of a smartphone**. *Sensors*, *15*(8), 20355-20372.

[MobiSys-16] Khan, T. A., Chakraborty, T., & Islam, A. B. M. (2016, June). **Poster: Infrastructure independent indoor localization for post-disaster rescue mission**. In *ACM MobiSys* (pp. 42-42). ACM.

[IEEE-16] Yang, Z., & Ganz, A. (2016, May). **Infrastructure-less and calibration-free RFID-based localization algorithm for victim tracking in mass casualty incidents**. In *2016 IEEE Symposium on Technologies for Homeland Security (HST)* (pp. 1-4). IEEE.

[ICASSP-17] Hamidi-Rad, S., Lyons, K., & Goela, N. (2017, March). **Infrastructure-less indoor localization using light fingerprints**. In *2017 IEEE ICASSP* (pp. 5995-5999). IEEE.

[CSUR-19] Winter, S., Tomko, M., Vasardani, M., Richter, K. F., Khoshelham, K., & Kalantari, M. (2019). **Infrastructure-Independent Indoor Localization and Navigation**. *ACM CSUR*, *52*(3), 61.

