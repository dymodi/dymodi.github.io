--- 
layout: post
title: Related Works of Indoor Localization Correction
date: June 20, 2017
author: Yi DING
---

[comment]: # (This blog compose the RELATED WORK section of future paper)


In Paper [1], indoor localization can be achieved without site survey phase. The key is to exploit the user motions from the mobile phone to connect the independent radio signatures. The existing indoor localization methods are categorized as two ways: (1) Fingerprinting-based and (2) Model-based. (Actually, machine learning is a emerging method in recent years). However, in this method, the accurate floor plan has to be known beforehand.

In 2012 MobiSys paper [2], unsupervised indoor localization can be achieved from the observations that some positions with special identifiable signatures such as an elavator or a corridor-corner can serve as natural landmarks in the building. Although the performance of the method is demonstrated with Wi-Fi based localization, same idea can be used in BLE based localization if we can get other data from the device such as accelerometer and compass. However, this technology also needs to know the accurate floor plan of the building. How to detect and remove the wrong landmark is not discussed in the paper.

In 2017 PerCom papaer [3], human locomotion and map exploitation are utilized to compensate for the accumulated error when using inertial sensors for infrastratructure-free indoor localization. However, this method also relies on the accuracy of the POI information.


REFERENCE:

[1] Wu, C., Yang, Z., Liu, Y., & Xi, W. (2013). WILL: Wireless indoor localization without site survey. IEEE Transactions on Parallel and Distributed Systems, 24(4), 839-848.

[2] Wang, H., Sen, S., Elgohary, A., Farid, M., Youssef, M., & Choudhury, R. R. (2012, June). No need to war-drive: unsupervised indoor localization. In Proceedings of the 10th international conference on Mobile systems, applications, and services (pp. 197-210). ACM.

[3] Lin, X., Chang, X. W., & Liu, X. (2017, March). LocMe: Human locomotion and map exploitation based indoor localization. In Pervasive Computing and Communications (PerCom), 2017 IEEE International Conference on (pp. 131-140). IEEE.