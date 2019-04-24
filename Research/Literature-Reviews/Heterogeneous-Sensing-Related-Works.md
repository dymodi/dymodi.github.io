---
author: Yi DING
layout: post
title: Related Works of Heterogeneous Sensing
date: April 23, 2019
---

**Taxonomy**

* Heterogeneity types: device, operating system, data density, user, environment,
* Solution types: deep NN, ANN, transfer learning, approximate actual radio map, clustering, interpolation

**Comments**

* A common cons is limited heterogeneity
* No real world application is conducted no feedback from real world applications.

**Special Topics**

* Modellet: Experiencing and Handling the Diversity, *MobiCom 14*
  * Taxonomy: date density, environment, approximate actual radio map
  * Cons:
    * Limited heterogeneity (13 deployment venues)
    * Device diversity is not considered.
* Smart Devices are Different, *SenSys 15*
  * Taxonomy: device, operaiting system, clustering+interpolation
  * Pros: Very solid experiments.
  * Cons: 
    * Limited heterogeneity (36 devices, 9 users); 
    * Environment diversity is not considered (actually only accelerator related heterogeneities are considered).
* DeepSense, *WWW17*
  * Taxonomy: user, deep NN
  * Pros: Solid experiments, 
  * Cons:
    * Limited heterogeneity (20 mobile phones, 9 users, 6 activities)
* CrossSense: Cross-Site and Large-Scale WiFi Sensing, *MobiCom 18*
  * Taxonomy: user, environment, ANN+transfer learning,
  * Pros: Solid experiments and rich results
  * Cons: 
    * Limited heterogeneity (100 users, 40 gestures, 1.2 million wireless activity samples)
    * Training user needed;
    * Training user needs to do the same thing in both training and deployment environment;

## Ref.

[MobCom14] Li, L., Shen, G., Zhao, C., Moscibroda, T., Lin, J. H., & Zhao, F. (2014, September). **Experiencing and handling the diversity in data density and environmental locality in an indoor positioning service**. In *MobiCom* (pp. 459-470). ACM.

[SenSys15] Stisen, A., Blunck, H., Bhattacharya, S., Prentow, T. S., Kjærgaard, M. B., Dey, A., ... & Jensen, M. M. (2015, November). **Smart devices are different: Assessing and mitigatingmobile sensing heterogeneities for activity recognition**. In *SenSys* (pp. 127-140). ACM.

[WWW17] Yao, S., Hu, S., Zhao, Y., Zhang, A., & Abdelzaher, T. (2017, April). **Deepsense: A unified deep learning framework for time-series mobile sensing data processing**. In *WWW* (pp. 351-360). International World Wide Web Conferences Steering Committee.

[MobiCom18] Zhang, J., Tang, Z., Li, M., Fang, D., Nurmi, P., & Wang, Z. (2018, October). **CrossSense: Towards Cross-Site and Large-Scale WiFi Sensing**. In *MobiCom* (pp. 305-320). ACM.