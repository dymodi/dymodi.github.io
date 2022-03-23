---
layout: single
title: "Related Works of Indoor Outdoor Detection"
permalink: /Literature-Reviews/Localization/Indoor-Outdoor-Detection-Related-Works/
classes: wide
author_profile: true
date: 19/7/2
---

In this surve, we only focus on indoor / outdoor detection.

**Key Words**

* IODetector, Indoor / Outdoor

**Taxonomy**

* Sensors: Light, Cellular, Magnetic, Acceleration, Proximity, Sound, Wi-Fi
* Solution: Threshold, ML, Active Probe, GPS-aided

**Comments**

* 

**Individual  Paper**

* IODetector, *SenSys12*
  - Taxonomy: Accelerometer, Cell RSS, Light, Magnetic
  - Light, cell RSS and magnetic field have different distributions indoor and outdoor.
* CoTrain: A Semi-Supervised Learning Approach for Robust Indoor-Outdoor Detection, *SenSys14*
  - Taxonomy: Accelerometer, Cell RSS, Light, Magnetic
  - Semi-Supervised Learning let the IODetector adapts to new environment quickly.
* Sound based indoor and outdoor environment detection, *ICT15*
  * Taxonomy: Sound, Active Probe
  * Works like radar, generate signal and got feedback from environment of different  reverberation.
* Bluedetect, *Sensors16*
  * Taxonomy: iBeacon, GPS-aided
  * iBeacon hardware placed at landmark as boundary, GPS signal works as trigger in semi-outdoor.
* Indoor-Outdoor Detection Using a Smart Phone Sensor, *Sensors16*
  * Taxonomy: Cellular RSSI, ML
* Detecting Indoor / Outdoor Places Using WiFi, *IEEE-Sensors16*
  * Taxonomy: Wi-Fi, ML
* SenseIO, *IEEE-Sensors18*
  * Taxonomy: Accelerators, Wi-Fi, Light, Cellular,proximity, Threshold







##  Ref.

[SenSys12-IODetector] Zhou, P., Zheng, Y., Li, Z., Li, M., & Shen, G. (2012, November). **IODetector: A generic service for indoor outdoor detection**. In *SenSye* (pp. 113-126). ACM.

[SenSys14-CoTrain] Radu, V., Katsikouli, P., Sarkar, R., & Marina, M. K. (2014, November). **A semi-supervised learning approach for robust indoor-outdoor detection with smartphones**. In *SenSys*(pp. 280-294). ACM

[ICT15] Sung, R., Jung, S. H., & Han, D. (2015). **Sound based indoor and outdoor environment detection for seamless positioning handover**. *ICT Express*, *1*(3), 106-109.

[Sensors16-Bluedetect] Zou, H., Jiang, H., Luo, Y., Zhu, J., Lu, X., & Xie, L. (2016). **Bluedetect: An ibeacon-enabled scheme for accurate and energy-efficient indoor-outdoor detection and seamless location-based service**. *Sensors*, *16*(2), 268.

[Sensors16-Phone] Wang, W., Chang, Q., Li, Q., Shi, Z., & Chen, W. (2016). **Indoor-outdoor detection using a smart phone sensor.** *Sensors*, *16*(10), 1563.

[IEEE-Sensors16-WiFi] Canovas, O., Lopez-de-Teruel, P. E., & Ruiz, A. (2016). **Detecting indoor/outdoor places using WiFi signals and AdaBoost**. *IEEE sensors journal*, *17*(5), 1443-1453.

[IEEE-Sensors18-SenseIO] Ali, M., ElBatt, T., & Youssef, M. (2018). **SenseIO: Realistic ubiquitous indoor outdoor detection system using smartphones**. *IEEE Sensors Journal*, *18*(9), 3684-3693.