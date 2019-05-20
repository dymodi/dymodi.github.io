---
author: Yi DING
layout: post
title: Related Works of Energy Efficient Sensing
date: May 10, 2019
---



**Taxonomy**

* Energy saving solution: Compressing, Sensor (GPS) management, OS optimization
* Applications: Wildlife monitoring, GPS localization, Context sensing

**Comments**

* A common method is to use other (e.g. cheap) sensors to detect the user states and only turn on other sensors when necessary.

**Special Topics**

* EEMSS: A Framework of Energy Efficient Mobile Sensing, *MobiSys09*
  * Taxonomy: Sensor management
  * Solution: Detect user states and only turn on all sensor after transition.
* SenseLess: Less is More, *MobiHeld09*
  * Taxonomy: Sensor management
  * Solution: Use the less expensive sensors more often, and use the more expensive sensors less frequently. 
* a-Loc: Energy-Accuracy Trade-off for Continuous Mobile Device Location, *MobiSys10*
  * Taxonomy: Sensor management
  * Solution: Adaptes sensor energy (accuracy) to application (accuracy) needs and sensor characteristics.
* RAPS: Energy-Efficient Rate-Adaptive GPS-based Positioning, *MobiSys10*
  * Taxonomy: GPS management
  * Solution: Detect user states and only turn on GPS when necessary.
  * Application: GPS localization
* Improving Energy Efficiency of Location Sensing, *MobiSys10*
  * Taxonomy: Sensor management (Substitution/Suppression), OS optimization (synchronizes  location sensing requests from multiple running applications)
  * Application: Localization
* Adaptive GPS Duty Cycling and Radio Ranging, *SenSys10*
  * Taxonomy: Sensor management (Duty cycling)
  * Application: Wildlife monitoring, GPS localization
* SenSLoc: Sensing Everyday Places and Paths using Less Energy, *SenSys10*
  * Taxonomy: Sensor management (based on mobility)
  * Application: Context sensing
* Jigsaw: Continuous Sensing Engine, *SenSys10*
  * Taxonomy: Sensor management (pipline based on mobility and behavior)
* 
* Energy Efficient GPS Acquisition with Sparse-GPS, *IPSN14*
  * Taxonomy: Compressing
  * Application: Wildlife monitoring, GPS localization


## Ref.

[IPSN14] Misra, P., Hu, W., Jin, Y., Liu, J., de Paula, A. S., Wirström, N., & Voigt, T. (2014, April). **Energy efficient gps acquisition with sparse-gps**. In *IPSN* (pp. 155-166). IEEE.

[MobiSys09] Wang, Y., Lin, J., Annavaram, M., Jacobson, Q. A., Hong, J., Krishnamachari, B., & Sadeh, N. (2009, June). **A framework of energy efficient mobile sensing for automatic user state recognition**. In *MobiSys* (pp. 179-192). ACM.

[MobiHeld09] Ben Abdesslem, F., Phillips, A., & Henderson, T. (2009, August). **Less is more: energy-efficient mobile sensing with senseless**. In *Proceedings of the 1st ACM workshop on Networking, systems, and applications for mobile handhelds*(pp. 61-62). ACM.

[MobiSys10-aLoc] Lin, K., Kansal, A., Lymberopoulos, D., & Zhao, F. (2010, June). **Energy-accuracy trade-off for continuous mobile device location**. In *MobiSys* (pp. 285-298). ACM.

[MobiSys10-RAPS] Paek, J., Kim, J., & Govindan, R. (2010, June). **Energy-efficient rate-adaptive GPS-based positioning for smartphones**. In *MobiSys* (pp. 299-314). ACM.

[SenSys10-Adaptive] Jurdak, R., Corke, P., Dharman, D., & Salagnac, G. (2010, November). **Adaptive GPS duty cycling and radio ranging for energy-efficient localization**. In *SenSys* (pp. 57-70). ACM.

[SenSys10-SensLoc] Kim, D. H., Kim, Y., Estrin, D., & Srivastava, M. B. (2010, November). **Sensloc: sensing everyday places and paths using less energy**. In *SenSys* (pp. 43-56). ACM

[SenSys10-Jigsaw] Lu, H., Yang, J., Liu, Z., Lane, N. D., Choudhury, T., & Campbell, A. T. (2010, November). **The Jigsaw continuous sensing engine for mobile phone applications**. In *SenSys* (pp. 71-84). ACM.

[MobiSys10-Improving] Zhuang, Z., Kim, K. H., & Singh, J. P. (2010, June). **Improving energy efficiency of location sensing on smartphones**. In *MobiSys* (pp. 315-330). ACM.

[MobiCom11] Rachuri, K. K., Mascolo, C., Musolesi, M., & Rentfrow, P. J. (2011, September). **Sociablesense: exploring the trade-offs of adaptive sampling and computation offloading for social sensing**. In *MobiCom* (pp. 73-84). ACM.

