---
layout: single
title: "Related Works of HAR (Human Activity Recognition) and Transportation Mode"
permalink: /Literature-Reviews/Sensing/Human-Activity-Recognition-Related-Works/
classes: wide
author_profile: true
date: 19/12/19
---

"Transportation/Mobiliy Mode" and "Activity Recognition" are two very related topics, since many studies consider "Walk/Run" as activities.

In this survey, I mainly focus on courier-related activities/mobilities (e.g. walk/riding) while ignoring other activities/mobilities (e.g. car/bus/keystroke).

**Keyword**

* Activity Recognition

* Transportation/Mobiliy Mode


**Taxonomy**

* Data Source: CDR, IMU, Acc.
* Sampling Rate: 100Hz, 5/16/50/100Hz, 10Hz, 
* Methods: ML, HMM, 

**Comments**

* *Sampling Rate* is one of the key barriers when applying the methods

**Papers**

* ISWC12: Energy Efficiency
  * Acc., 5/16/50/100Hz, ML
  * Trade-off between sampling frequence and classification performance.
<div class="row">
  <div class="column">
  <img 
       src="/Literature-Reviews/Sensing/figures/SamplingRateEnergyTradeoff_ISWC12.png"
       alt="SamplingRateEnergyTradeoff_ISWC12" 
       class="align-center"
       style="height: 5em;" > 
  </div>
  <div class="column">
    <img 
       src="/Literature-Reviews/Sensing/figures/DifferentSamplingRatePeformance_ISWC12.png"  
       alt="DifferentSamplingRatePeformance_ISWC12"
       class="align-center"
       style="height: 5em;" >
    </div>
</div>

<p>
  <img 
       src="/Literature-Reviews/Sensing/figures/SamplingRateEnergyTradeoff_ISWC12.png"
       alt="SamplingRateEnergyTradeoff_ISWC12" 
       class="align-center"
       style="height: 5em;" >  <img 
       src="/Literature-Reviews/Sensing/figures/DifferentSamplingRatePeformance_ISWC12.png"  
       alt="DifferentSamplingRatePeformance_ISWC12"
       class="align-center"
       style="height: 5em;" >
</p>


* SenSys13: Accelerator
  * Taxonomy: Accelerator, 100Hz, ML+HMM, 

* SenSys15: Device Heterogeneities
  * In-depth study of device heterogeneities on activity recognition.

* TBD17: Activity-based
  * Taxonomy: CDR, 

* MobiCom18: Closting Gap
  * Taxonomy: IMU, 10Hz, 

##  Ref.

[ISWC12] Yan, Z., Subbaraju, V., Chakraborty, D., Misra, A., & Aberer, K. (2012, June). **Energy-efficient continuous activity recognition on mobile phones: An activity-adaptive approach**. In *ISWC* (pp. 17-24). Ieee.

[SenSys13] Hemminki, S., Nurmi, P., & Tarkoma, S. (2013, November). **Accelerometer-based transportation mode detection on smartphones**. In *ACM SenSys* (pp. 1-14).

[SenSys15] Stisen, A., Blunck, H., Bhattacharya, S., Prentow, T. S., Kjærgaard, M. B., Dey, A., ... & Jensen, M. M. (2015, November). **Smart devices are different: Assessing and mitigatingmobile sensing heterogeneities for activity recognition**. In *ACM SenSys* (pp. 127-140).

[TBD17] Jiang, S., Ferreira, J., & Gonzalez, M. C. (2017). **Activity-based human mobility patterns inferred from mobile phone data: A case study of Singapore.** *IEEE Transactions on Big Data*, *3*(2), 208-219.

[MobiCom18] Shen, S., Gowda, M., & Roy Choudhury, R. (2018, October). **Closing the gaps in inertial motion tracking**. In *ACM MobiCom* (pp. 429-444).