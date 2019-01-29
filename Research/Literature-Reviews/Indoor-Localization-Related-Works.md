---
layout: post
title: Related Works of Indoor Localization
date: June 18, 2019
author: Yi DING
---



**Taxonomy**

* Communication Technology
  * Communication Modality: Wi-Fi / BLE / Acoustic / Vision / Light / UWB / Infrared / EMF / Multiple
  * Localization Methods: Model-based / Fingerprinting
  * Research Focus: Localization Algoirtihm / Anchor / Evaluation
  * Scale: Small (Room Level) / Large (Building Level) / Ubiquitous (Multiple Building or City Level)
  * Target Type: Device-based / Device-free
  * Granularity: Room Level / Meters / Decimeters



**Special Topics**

* Localization over Large-Scale 802.11, *MobiCom 04* 
  * Taxonomy: Wi-Fi, Fingerprinting, Localization Methods, Large (Building Level), Room Level
  * Pros: Less time in fingerprinting;
* Metropolitan-scale Wi-Fi Localization, *MobiSys 05*
  * Taxonomy: Wi-Fi, Evaluation, Ubiquitous, 
  * Pros: Metropolitan-scale coverage
  * Cons: Lower accuracy
* EZ: Indoor Localization without Pain, *MobiCom 10*
  * Taxonomy: Wi-Fi, Localization Algorithm, 
  * Pros: No need for physical layout, i.e. the position of AP is unknown; No need for calibration
  * Cons: Dense deployment of AP
  * Assumptions: universal LDPL equation (as constraints), occasional location fix (entrance, window)
* LiFS: Locating in Fingerprint Space, *MobiCom 12*
  * Taxonomy: Wi-Fi,  Fingerprinting, Localization Algoirtihm, Large-Scale,
  * Pros: Reduced fingerprinting workload, Large scale;
* Zee: Zero-Effort Crowdsourcing, *MobiCom 12*
  * Taxonomy: Wi-Fi, Fingerprinting, Localization Algorithm, Large Scale
  * Pros: No need for site-specific calibration, No assumption on phone position
  * Assumptions: Map available showing pathways and barriers
* UnLoc: Unsupervised Indoor Localization, *MobiSys 12*
  - Taxonomy: Multiple, Anchor, Meters Level,
  - Signal landmarks in the building as anchors
  - Dead reckoning using to locate between anchors
  - Cons: Device diversity not considered, Landmark not available at everywhere
* Guoguo: Acousitc Fingraind Indoor Localization, *MobiSys 13*
  * Taxonomy: Acoustic, Model-based, Localization Algorithm + Anchor, Small Scale
* Social-Loc: Improving Indoor Localization with Social Sensing, *SenSys 13*
  * Taxonomy: Multiple, Localization Algoirtihm, Small-Scale
* Ubicarse: Indoor Localization With Zero Start-up Cost, *MobiCom 14*
  - Taxonomy: Wi-Fi+Carmera, Model-based, Localization Algorithm,
  - Assume AP location is known
* Modellet: Diversity in Data Density and Environmental Locality, *MobiCom 14*
  * Taxonomy: Fingerprinting, Localization Algorithm, Ubiquitous,
  * Pros: Can handle diversity in training data density and environment condition for real-world deployment
  * Cons: Device diversity is not considered; still relies on fingerprint. (which is impossible in real large scale problem)
* Jigsaw: Indoor Floor Plan Reconstruction, *MobiCom 14*
  * Taxonomy: Vision, Anchor, Large Scale	
  * Cons: Need input images
* Luxapose: Indoor Positioning with Visible Light, *MobiCom 14*
  * Taxonomy: Light, Model-based, Localization Algorithm+Anchor, Decimeter, Small-Scale
  * Cons: Need image capture periodically
* SAIL: Single Access Point-Based Indoor Localization, *MobiSys 14*
  * Taxonomy: Wi-Fi, Localization Algorithm, Model-based, Large-Scale, Meters Level,
  * Pros: Only need single AP, 
* EchoTag: Indoor Location Tagging with Smartphones, *MobiCom 15*
  * Taxonomy: Acoustic, Localization Algorithm + Anchor, 
* ToneTrack: Frequency-Agile Radios for Indoor Localization, *MobiCom 15*
  * Taxonomy: Wi-Fi, Localization Algorithm, Small-scale
* PIXEL: Light-weight Indoor Positioning with Visible Light, *MobiSys 15*
  * Taxonomy: Light, Localization Algorithm, Small Scale
  * Pros: Light-weight that can run on resource-constrianed platforms
* INTRI: Contour-based Trilateration for Indoor Fingerprinting Localization, *SenSys 15*
  * Taxonomy: Wi-Fi, Localization Algorithm, Large-Scale
* SpinLight: 



## Ref.

[MobiCom04] Andreas Haeberlen, Eliot Flannery, Andrew M. Ladd, Algis Rudys, Dan S. Wallach, and Lydia E. Kavraki. 2004. **Practical Robust Localization over Large-Scale 802.11 Wireless Networks Andreas**. In *ACM MobiCom*, 60–61.

[MobiSys05] Yu-Chung Cheng, Yatin Chawathe, Anthony LaMarca, and John Krumm. 2005. **Accuracy characterization for metropolitan-scale Wi-Fi localization**. In *ACM MobiSys*, 233. 

[MobiCom10-EZ] Krishna Chintalapudi. 2010. **Indoor Localization Without the Pain**. In *ACM MobiCom*, 173–184.

[MobiCom12-LiFS] Zheng Yang, Chenshu Wu, and Yunhao Liu. 2012. **Locating in Fingerprint Space : Wireless Indoor Localization with Little Human Intervention**. In *ACM MobiCom*, 269–280.

[MobiCom12-Zee] Anshul Rai. 2012. **Zee : Zero-Effort Crowdsourcing for Indoor Localization Categories and Subject Descriptors**. In *ACM MobiCom*, 293–304.

[MobiSys12-UnLoc] He Wang, S Sen, and Ahmed Elgohary. 2012. **No need to war-drive: Unsupervised indoor localization**. *ACM MobiSys*, 197–210. 

[MobiSys13-Guoguo] Kaikai Liu, Xinxin Liu, and Xiaolin Li. 2013. **Guoguo: Enabling Fine-grained Indoor Localization via Smartphone**. *ACM MobiSys*, 235. 

[MobiCom14-Modellet] Li, L., 2014, **Experiencing and handling the diversity in data density and environmental locality in an indoor positioning service**. In *ACM MobiCom* 59-470

[MobiCom14-Ubicarse] Swarun Kumar, Stephanie Gil, Dina Katabi, and Daniela Rus. 2014. **Accurate Indoor Localization With Zero Start-up Cost**. In *ACM MobiCom*, 483–494.

[MobiCom14-Jigsaw] Ruipeng Gao, Mingmin Zhao, Tao Ye, Fan Ye, Yizhou Wang, Kaigui Bian, Tao Wang, and Xiaoming Li. 2014. **Jigsaw : Indoor Floor Plan Reconstruction via Mobile Crowdsensing**. In *ACM MobiCom*, 249–260.

[MobiCom14-Luxapose] Ye-Sheng Kuo, Pat Pannuto, Ko-Jen Hsiao, and Prabal Dutta. 2014. **Luxapose: Indoor Positioning with Mobile Phones and Visible Light.** In *ACM MobiCom*, 447–458.

[SenSys15] Suining He, Tianyang Hu, and S.-H Gary Chan. 2015. **Contour-based Trilateration for Indoor Fingerprinting Localization**. In *ACM SenSys*. 

[SIGCOMM15-SpotFi] Manikanta Kotaru, Kiran Joshi, Dinesh Bharadia, and Sachin Katti. 2015. **SpotFi: Decimeter Level Localization Using WiFi**. In *ACM SIGCOMM*, 269–282. 

[SIGSPATIAL15] Youssef, M. (2015, November). **Towards truly ubiquitous indoor localization on a worldwide scale**. In Proceedings of the 23rd SIGSPATIAL International Conference on Advances in Geographic Information Systems (p. 12). ACM.

[MobiSys16] Huang, Q. 2016,. **Poster: Simplified In-door WiFi-Beacon Navigation System Without Exact Location**. In *ACM MobiSys* 33-33

[SenSys18-Salma] Bernhard Großwindhager, Michael Rath, Josef Kulmer, Mustafa S. Bakr, Carlo Alberto Boano, Klaus Witrisal, and Kay Römer. 2018. **Salma: UWB-based single-Anchor Localization System using Multipath Assistance**. *ACM SenSys* October (2018), 132–144. 





