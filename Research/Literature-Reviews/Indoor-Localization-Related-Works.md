---
layout: post
title: Related Works of Indoor Localization
date: June 18, 2019
author: Yi DING
---



**Taxonomy**

* 
* Model-based



**Special Topics**

* EZ: Indoor Localization without Pain, [13], *MobiCom 10*
  * No need for physical layout, i.e. the position of AP is unknown
  * Assume universal LDPL equation (as constraints)
  * Assume occasional location fix (entrance, window)
* Zee: Zero-Effort Crowdsourcing, [14], *MobiCom 12*
  * No need for site-specific calibration
  * Assume map showing pathways and barriers
* Modellet: Diversity in Data Density and Environmental Locality, [11], *MobiCom 14*
  * Can handle diversity in training data density and environment condition for real-world deployment
  * Device diversity is not considered
  * Still relies on fingerprint. (which is impossible in real large scale problem)
* UnLoc: Unsupervised Indoor Localization [15], *MobiSys 12*
  * Signal landmarks in the building as anchors
  * Dead reckoning using to locate between anchors
  * Device diversity not considered
  * Landmark not available at everywhere
* Beacon system to collect data [6]



## Review for Each Paper





## Ref.

[MobiCom04] Andreas Haeberlen, Eliot Flannery, Andrew M. Ladd, Algis Rudys, Dan S. Wallach, and Lydia E. Kavraki. 2004. **Practical Robust Localization over Large-Scale 802.11 Wireless Networks Andreas**. In *ACM MobiCom*, 60–61.

[MobiSys05] Yu-Chung Cheng, Yatin Chawathe, Anthony LaMarca, and John Krumm. 2005. **Accuracy characterization for metropolitan-scale Wi-Fi localization**. In *ACM MobiSys*, 233. 

[MobiCom10-EZ] Krishna Chintalapudi. 2010. **Indoor Localization Without the Pain**. In *ACM MobiCom*, 173–184. 

[MobiCom12-Zee] Anshul Rai. 2012. **Zee : Zero-Effort Crowdsourcing for Indoor Localization Categories and Subject Descriptors**. In *ACM MobiCom*, 293–304.

[MobiCom12-LiFS] Zheng Yang, Chenshu Wu, and Yunhao Liu. 2012. **Locating in Fingerprint Space : Wireless Indoor Localization with Little Human Intervention**. In *ACM MobiCom*, 269–280.

[MobiSys12-UnLoc] He Wang, S Sen, and Ahmed Elgohary. 2012. **No need to war-drive: Unsupervised indoor localization**. *ACM MobiSys*, 197–210. 

[MobiSys13-Guoguo] Kaikai Liu, Xinxin Liu, and Xiaolin Li. 2013. **Guoguo: Enabling Fine-grained Indoor Localization via Smartphone**. *ACM MobiSys*, 235. 

[MobiCom14-Modellet] Li, L., 2014, **Experiencing and handling the diversity in data density and environmental locality in an indoor positioning service**. In *ACM MobiCom* 59-470

[MobiCom14-Ubicarse] Swarun Kumar, Stephanie Gil, Dina Katabi, and Daniela Rus. 2014. **Accurate Indoor Localization With Zero Start-up Cost**. In *ACM MobiCom*, 483–494.

[MobiCom14-Luxapose] Ye-Sheng Kuo, Pat Pannuto, Ko-Jen Hsiao, and Prabal Dutta. 2014. **Luxapose: Indoor Positioning with Mobile Phones and Visible Light.** In *ACM MobiCom*, 447–458.

[SenSys15] Suining He, Tianyang Hu, and S.-H Gary Chan. 2015. **Contour-based Trilateration for Indoor Fingerprinting Localization**. In *ACM SenSys*. 

[SIGCOMM15-SpotFi] Manikanta Kotaru, Kiran Joshi, Dinesh Bharadia, and Sachin Katti. 2015. **SpotFi: Decimeter Level Localization Using WiFi**. In *ACM SIGCOMM*, 269–282. 

[SIGSPATIAL15] Youssef, M. (2015, November). **Towards truly ubiquitous indoor localization on a worldwide scale**. In Proceedings of the 23rd SIGSPATIAL International Conference on Advances in Geographic Information Systems (p. 12). ACM.

[MobiSys16] Huang, Q. 2016,. **Poster: Simplified In-door WiFi-Beacon Navigation System Without Exact Location**. In *ACM MobiSys* 33-33

[SenSys18-Salma] Bernhard Großwindhager, Michael Rath, Josef Kulmer, Mustafa S. Bakr, Carlo Alberto Boano, Klaus Witrisal, and Kay Römer. 2018. **Salma: UWB-based single-Anchor Localization System using Multipath Assistance**. *ACM SenSys* October (2018), 132–144. 





