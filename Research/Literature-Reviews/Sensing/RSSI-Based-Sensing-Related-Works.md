---
author: Yi DING
layout: post
title: Related Works of RSSI-based Sensing
date: April 29, 2019
---

**Taxonomy**

* RSSI-based Features: 
  * Time related features (e.g., period of slope)
  * Statistical features (e.g, peak, mean, variance)
  * Frequency related features (e.g. low-pass filter, high-pass filter, spectral energy, entropy)
  * Edge features (e.g., rising edge, falling edge)
  * Histogram (i.e., the signal distribution)
  * Correlation (e.g., spearman, Pearson)
  * Distance (e.g., manhattan, euclidean)
* Sensing Objects: Localization, Presence Detection (Coarse-grained), Activity Recognition (Fine-grained)
* Methods: Filtering (with threshold), ML (e.g. KNN, SVM, Bayesian Network), Wavelet Transform
* Another taxonomy can be "Device-based" and "Device-free"

**Comments**

* Tracking Human Queues[MobiSys14] has a very detailed description of what are derived from RSSI raw data and used as feature for following sensing.

* Although [MobiCom15-Understanding] is a CSI based work, there is a good survey on the RSSI-based human activity recognition topic. But the survey here is to citing some RSSI-based works and show their performance defects compared with (author's) CSI-based work.

* There is also a survey on RSSI-based sensing in [IMWUT17-Detecting] and [MobiCom15-Keystroke].

**Special Topics**

* Challenges, *MobiCom07*
  * RSSI-based features: Statistical features (Moving average, Moving variance)
  * Sensing Object: Localization
  * Method: Filtering (with threshold)
* IODetector, *SenSys12*
  * RSSI-based features: Statistical features (RSSI variation)
  * Sensing Object: Localization
* Leveraging RF-channel fluctuation for activity recognition Active, *MoMM13*
  * RSSI-based features: Statistical features , Frequency related features
  * Sensing Object: Activity Recognition
  * Method: KNN

<p align = "center">
<img src="figures/LeveragingRFchannel_MoMM13.png"  alt="RSSI Features" height="350">
</p>

* Predicting Length of Stay at WiFi Hotspots, *INFOCOM13*
  * RSSI-based features: Statistical features (e.g, peak, mean, variance)
  * Sensing Object: Presence Detection
  * Method: ML (SVM) 
* Tracking Human Queues, *MobiSys14*
  * RSSI-based features: Time related features, Statistical features
  * Sensing Objects: Presence Detection
  * Method: Filtering, ML (Bayesian Network)
  * Three features are extracted from raw RSSI data: (1) Longest period of negative slopes in the trace; (2) Stable RSS & largest RSS value during service; (3) Largest change of RSS in the trace. 

<p align = "center">
<img src="figures/TrackingHumanQueues_MobiSys14.png"  alt="RSSI Features" height="400">
</p>

(Figure from the Paper)

* The Telepathic Phone, *PerCom14*
  * RSSI-based features: Statistical features (peak value, mean, variance)
  * Methods: ML (KNN)
* RF-Sensing of Activities, *TMC14*
  * RSSI-based features: Statistical features (peak value, mean, variance), Frequency related features (energy, entropy)
  * Sensing Objects: Activity Recognition
  * Methods: ML (KNN)
* UbiBreathe, *MobiHoc15*
  * RSSI-based features: Frequency related features (e.g. low-pass filter, high-pass filter)
  * Sensing Objects: Activity Recognition
  * Method: Wavelet Transform
* WiGest: *INFOCOM15*
  * RSSI-based features: Edge features (e.g., rising edge, falling edge)
  * Sensing Objects: Activity Recognition
  * Methods: Wavelet Transform
* Inferring Person-to-person Proximity Using WiFi Signals, *IMWUT17*
  * RSSI-based features: Correlation (spearman and pearson correlation of RSSI from two APs), Distance (manhattan and euclidean RSSI from two APs).
  * Sensing Objects: Presence Detection


## Ref.

[MobiCom07] Youssef, M., Mah, M., & Agrawala, A. (2007, September). **Challenges: device-free passive localization for wireless environments**. In *MobiCom*(pp. 222-229). ACM.

[SenSys12] Zhou, P., Zheng, Y., Li, Z., Li, M., & Shen, G. (2012, November). **IODetector: A generic service for indoor outdoor detection**. In *SenSys* (pp. 113-126). ACM.

[MoMM13] Sigg, S., Shi, S., Buesching, F., Ji, Y., & Wolf, L. (2013, December). **Leveraging RF-channel fluctuation for activity recognition: Active and passive systems, continuous and RSSI-based signal features**. In *MoMM*(p. 43). ACM.

[INFOCOM13] Manweiler, J., Santhapuri, N., Choudhury, R. R., & Nelakuditi, S. (2013, April). **Predicting length of stay at wifi hotspots**. In *IEEE INFOCOM* (pp. 3102-3110). IEEE.

[MobiSys14] Wang, Y., Yang, J., Chen, Y., Liu, H., Gruteser, M., & Martin, R. P. (2014, June). **Tracking human queues using single-point signal monitoring.** In *MobiSys* (pp. 42-54). ACM.

[PerCom14] Sigg, S., Blanke, U., & Tröster, G. (2014, March). **The telepathic phone: Frictionless activity recognition from wifi-rssi.** In *PerCom* (pp. 148-155). IEEE.

[TMC14] Sigg, S., Scholz, M., Shi, S., Ji, Y., & Beigl, M. (2014). **RF-sensing of activities from non-cooperative subjects in device-free recognition systems using ambient and local signals**. *IEEE TMC*, *13*(4), 907-920.

[MobiCom15-Keystroke] Ali, K., Liu, A. X., Wang, W., & Shahzad, M. (2015, September). **Keystroke recognition using wifi signals**. In *MobiCom* (pp. 90-102). ACM.

[MobiCom15-Understanding] Wang, W., Liu, A. X., Shahzad, M., Ling, K., & Lu, S. (2015, September). **Understanding and modeling of wifi signal based human activity recognition**. In *MobiCom*(pp. 65-76). ACM.

[INFOCOM15] Abdelnasser, H., Youssef, M., & Harras, K. A. (2015, April). **Wigest: A ubiquitous wifi-based gesture recognition system**. In *INFOCOM* (pp. 1472-1480). IEEE.

[MobiHoc15] Abdelnasser, H., Harras, K. A., & Youssef, M. (2015, June). **UbiBreathe: A ubiquitous non-invasive WiFi-based breathing estimator**. In *MobiHoc*(pp. 277-286). ACM.

[IMWUT17-Detecting] Ohara, K., Maekawa, T., & Matsushita, Y. (2017). **Detecting state changes of indoor everyday objects using Wi-Fi channel state information**. *IMWUT*, *1*(3), 88.

[IMWUT17-Inferring] Sapiezynski, P., Stopczynski, A., Wind, D. K., Leskovec, J., & Lehmann, S. (2017). **Inferring person-to-person proximity using WiFi signals**. *IMWUT*, *1*(2), 24.
