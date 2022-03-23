---
author: Yi DING
layout: post
title: Related Works of Privacy in Sensing
date: Feb. 26, 2021

---

**Key Words:** IMU Privacy

**Taxonomy**

* Sensor Types: Generic, IMU, Accelerometers, IMU on Vehicle
* Solutions: Access Control Policy

**Comments**

* Location privacy is discussed in another survey, here we focus on privacy of other sensors.
* There are many works on accelerometers-based user identification (biometric/gait) since 2005.

**Papers**

* Identifying People from Gait Pattern with Accelerometers, *[Biometric 2005]*
  * Taxonomy: Accelerometers
  * Contributions:
    * (1) Propose that accelerometers data can be use for human identification 
* Driver Classification and Driving Style Recognition using Inertial Sensors, *[IEEE IV 2013]*
  * Taxonomy: IMU on Vehicle
  * Contributions:
    * (1) Show that using IMU data on the vehicle can differentiate different drivers.
* World-driven access control for continuous sensing, *[ACM CCS 2014]*
  * Taxonomy: Generic, Access Control Policy
  * Contributions:
    * (1) An access control model that utilize policies and context detection methods to protect privacy automatically instead of letting the users to manully control each sensors' permission.
    * (2) Crystallize the challenges in continuous sensing privacy.
* Motion Sensor-based Privacy Attack on Smartphones, *[arXiv 2020]*
  * Taxonomy: Accelerometers
  * Contributions:
    * (1) Propose that "speech information (e.g., gender, identity) can be attacked from smartphone accelerometers".
* Your Tattletale Gait - Privacy Invasiveness of IMU Gait Data, *[IEEE/IAPR IJCB 2020]*
  * Taxonomy: IMU
  * Contributions: 
    * (1) Show that IMU data can be used as a biometric by observing human movement (gait). 
    * (2) Show that the location of the sensor (wrist/pocket) impact the effect of privacy invasions. 
    * (3) Use an opinion survey of 566 participants to show people's perceive on diiferent types of biometrics (e.g., weight is more important than age/gender).
* Collecting Survey and Smartphone Sensor Data With an App, *[Social Science Computer Review 2020]*
  * Taxonomy: Generic
  * Contributions:
    * Come to the following conclustions through large-scale (4,300 invitee, 650 participants) survey
      * (1) People were just as willing to share such extensive digital trace data as they were in studies;
      * (2) Participants hardly differentiated between the different data requests made;
      * (3) Once participants gave consent, they did not tend to revoke it;
      * (4) Explanations regarding data collection and data usage are often not read carefully.
* 

## Ref.

[Biometric 2005] Ailisto, Heikki J., Mikko Lindholm, Jani Mantyjarvi, Elena Vildjiounaite, and Satu-Marja Makela. "Identifying people from gait pattern with accelerometers." In *Biometric Technology for Human Identification II*, vol. 5779, pp. 7-14. International Society for Optics and Photonics, 2005.

[IEEE IV 2013] Van Ly, Minh, Sujitha Martin, and Mohan M. Trivedi. "Driver classification and driving style recognition using inertial sensors." In *2013 IEEE Intelligent Vehicles Symposium (IV)*, pp. 1040-1045. IEEE, 2013.

[ACM CCS 2014] Roesner, Franziska, David Molnar, Alexander Moshchuk, Tadayoshi Kohno, and Helen J. Wang. "World-driven access control for continuous sensing." In *Proceedings of the 2014 ACM SIGSAC Conference on Computer and Communications Security*, pp. 1169-1181. 2014.

[IEEE/IAPR IJCB 2020] Rasnayaka, Sanka, and Terence Sim. "Your Tattletale Gait Privacy Invasiveness of IMU Gait Data." In *2020 IEEE International Joint Conference on Biometrics (IJCB)*, pp. 1-10. IEEE.

[Social Science Computer Review 2020] Kreuter, Frauke, Georg-Christoph Haas, Florian Keusch, Sebastian Bähr, and Mark Trappmann. "Collecting survey and smartphone sensor data with an app: Opportunities and challenges around privacy and informed consent." *Social Science Computer Review* 38, no. 5 (2020): 533-549.