---
author: Yi DING
layout: post
title: Related Works of Heterogeneous Sensing
date: April 23, 2019
---

Heterogeneity is problem that widely met in research and applications. It is said in [SenSys12, IODetector] that "since the antenna gain may vary across different mobile phone models, it is hard to accurately map different RSS values to different environments." It is also said in [TMC14] that "environmental changes impact the transmission channel between devices". Similar conclusions can also been found in [SenSys12, CrowdMon], [iiWAS16].



**Taxonomy**

* Heterogeneity types: device, operating system, data density, user, environment,
* Solution types: deep NN, transfer learning, Fingerprinting, clustering, interpolation, Feature selection, 

**Comments**

* A common cons is limited heterogeneity
* No real world application is conducted no feedback from real world applications.

**Special Topics**

* Modellet: Experiencing and Handling the Diversity, *MobiCom 14*
  * Taxonomy: date density, environment, Fingerprinting
  * Cons:
    * Limited heterogeneity (13 deployment venues)
    * Device diversity is not considered.
* Smart Devices are Different, *SenSys 15*
  * Taxonomy: device, clustering+interpolation
  * Pros: Very solid experiments.
  * Cons: 
    * Limited heterogeneity (36 devices, 9 users); 
    * Environment diversity is not considered (actually only accelerator related heterogeneities are considered).
* DeepSense, *WWW17*
  * Taxonomy: user, deep NN
  * Pros: Solid experiments, 
  * Cons:
    * Limited heterogeneity (20 mobile phones, 9 users, 6 activities)
    * Mainly consider the heterogeneity of noisy measurement.
* CrossSense: Cross-Site and Large-Scale WiFi Sensing, *MobiCom 18*
  * Taxonomy: user, environment, transfer learning,
  * Pros: Solid experiments and rich results
  * Cons: 
    * Limited heterogeneity (100 users, 40 gestures, 1.2 million wireless activity samples)
    * Training user needed;
    * Training user needs to do the same thing in both training and deployment environment;
* Widar3.0: Zero-Effort Cross-Domain Gesture Recognition with Wi-Fi, *MobiSys19*
  * Taxonomy: user, environment, Feature selection
  * Pro: Find features independent of data domain
  * Cons: Device not considered.





## Ref.

[SenSys12-CrowdMon] Pushp, S., Min, C., Lee, Y., Liu, C. H., & Song, J. (2012, November). **Towards crowd-aware sensing platform for metropolitan environments**. In *SenSys* (pp. 335-336). ACM.

[SenSys12-IODetector] Zhou, P., Zheng, Y., Li, Z., Li, M., & Shen, G. (2012, November). **IODetector: A generic service for indoor outdoor detection**. In *SenSys* (pp. 113-126). ACM.

[MobCom14] Li, L., Shen, G., Zhao, C., Moscibroda, T., Lin, J. H., & Zhao, F. (2014, September). **Experiencing and handling the diversity in data density and environmental locality in an indoor positioning service**. In *MobiCom* (pp. 459-470). ACM.

[TMC14] Sigg, S., Scholz, M., Shi, S., Ji, Y., & Beigl, M. (2014). **RF-sensing of activities from non-cooperative subjects in device-free recognition systems using ambient and local signals**. *IEEE TMC*, *13*(4), 907-920.

[SenSys15] Stisen, A., Blunck, H., Bhattacharya, S., Prentow, T. S., Kjærgaard, M. B., Dey, A., ... & Jensen, M. M. (2015, November). **Smart devices are different: Assessing and mitigatingmobile sensing heterogeneities for activity recognition**. In *SenSys* (pp. 127-140). ACM.

[iiWAS16] Inomoto, H., Saiki, S., Nakamura, M., & Matsumoto, S. (2016, November). **Mission-oriented large-scale environment sensing based on analogy of military system**. In *iiWAS* (pp. 414-421). ACM.

[WWW17] Yao, S., Hu, S., Zhao, Y., Zhang, A., & Abdelzaher, T. (2017, April). **Deepsense: A unified deep learning framework for time-series mobile sensing data processing**. In *WWW* (pp. 351-360). International World Wide Web Conferences Steering Committee.

[MobiCom18] Zhang, J., Tang, Z., Li, M., Fang, D., Nurmi, P., & Wang, Z. (2018, October). **CrossSense: Towards Cross-Site and Large-Scale WiFi Sensing**. In *MobiCom* (pp. 305-320). ACM.

[MobiSys19] Zheng, Y., Zhang, Y., Qian, K., Zhang, G., Liu, Y., Wu, C., & Yang, Z. (2019, June). **Zero-Effort Cross-Domain Gesture Recognition with Wi-Fi**. In *MobiSys* (pp. 313-325). ACM.