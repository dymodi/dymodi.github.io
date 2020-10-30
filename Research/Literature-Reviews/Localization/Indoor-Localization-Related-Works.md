---
layout: post
title: Related Works of Indoor Localization
date: June 18, 2019
author: Yi DING
---



**Taxonomy**

* Communication Technology
  * Communication Modality: Wi-Fi / BLE / Acoustic / Vision / Light / UWB / Infrared / EMF / mmWave / Multiple
  * Localization Methods: Model-based / Fingerprinting
  * Research Focus: Localization Algoirtihm / Anchor / Evaluation
  * Scale: Small (Room Level) / Large (Building Level) / Ubiquitous (Multiple Building or City Level)
  * Target Type: Device-based / Device-free
  * Granularity: Room Level / Meters / Decimeters / Centimeter



**Comments**

* Many VLP (Visiable Light Positioning) conducts modification on light fixture, hence can be viewed as frontier works on anchorlization.



**Special Topics**

* Localization over Large-Scale 802.11, *MobiCom 04*,  `haeberlen2004practical`
  * Taxonomy: Wi-Fi, Fingerprinting, Localization Methods, Large (Building Level), Room Level
  * Pros: Less time in fingerprinting;
  
* Metropolitan-scale Wi-Fi Localization, *MobiSys 05*, `cheng2005accuracy`
  * Taxonomy: Wi-Fi, Evaluation, Ubiquitous, 
  * Pros: Metropolitan-scale coverage
  * Cons: Lower accuracy
  
* EZ: Indoor Localization without Pain, *MobiCom 10*, `chintalapudi2010indoor`
  * Taxonomy: Wi-Fi, Localization Algorithm, 
  * Pros: No need for physical layout, i.e. the position of AP is unknown; No need for calibration
  * Cons: Dense deployment of AP
  * Assumptions: universal LDPL equation (as constraints), occasional location fix (entrance, window)
  
* Adaptive GPS Duty Cycling and Radio Ranging, *SenSys10*
  * This is not a indoor localization paper, but provide a very good description on the relation between RSSI and distance as shown in the following
  
    <p align = "center">
    <img src="figures/RSSI-Distance-Relation.png"  alt="RSSI Features" height="350">
    </p>
  
* LiFS: Locating in Fingerprint Space, *MobiCom 12*, `yang2012locating`
  * Taxonomy: Wi-Fi,  Fingerprinting, Localization Algoirtihm, Large-Scale,
  * Pros: Reduced fingerprinting workload, Large scale;
  
* Zee: Zero-Effort Crowdsourcing, *MobiCom 12*, `rai2012zee`
  * Taxonomy: Wi-Fi, Fingerprinting, Localization Algorithm, Large Scale
  * Pros: No need for site-specific calibration, No assumption on phone position
  * Assumptions: Map available showing pathways and barriers
  
* UnLoc: Unsupervised Indoor Localization, *MobiSys 12*, `wang2012no`
  - Taxonomy: Multiple, Anchor, Meters Level,
  - Signal landmarks in the building as anchors
  - Dead reckoning using to locate between anchors
  - Cons: Device diversity not considered, Landmark not available at everywhere
  
* Guoguo: Acousitc Fingraind Indoor Localization, *MobiSys 13*, `liu2013guoguo`
  * Taxonomy: Acoustic, Model-based, Localization Algorithm + Anchor, Small Scale
  
* Social-Loc: Improving Indoor Localization with Social Sensing, *SenSys 13*, `jun2013social`
  * Taxonomy: Multiple, Localization Algoirtihm, Small-Scale
  
* Ubicarse: Indoor Localization With Zero Start-up Cost, *MobiCom 14*, `kumar2014accurate`
  - Taxonomy: Wi-Fi+Carmera, Model-based, Localization Algorithm,
  - Assume AP location is known
  
* Modellet: Diversity in Data Density and Environmental Locality, *MobiCom 14*, `li2014experiencing`
  * Taxonomy: Fingerprinting, Localization Algorithm, Ubiquitous,
  * Pros: Can handle diversity in training data density and environment condition for real-world deployment
  * Cons: Device diversity is not considered; still relies on fingerprint. (which is impossible in real large scale problem)
  
* Jigsaw: Indoor Floor Plan Reconstruction, *MobiCom 14*, `gao2014jigsaw`
  * Taxonomy: Vision, Anchor, Large Scale	
  * Cons: Need input images
  
* Luxapose: Indoor Positioning with Visible Light, *MobiCom 14*, `kuo2014luxapose`
  * Taxonomy: Light, Model-based, Localization Algorithm+Anchor, Decimeter, Small-Scale
  * Cons: Need image capture periodically
  
* SAIL: Single Access Point-Based Indoor Localization, *MobiSys 14*, `mariakakis2014sail`
  * Taxonomy: Wi-Fi, Localization Algorithm, Model-based, Large-Scale, Meters Level,
  * Pros: Only need single AP, 
  
* EchoTag: Indoor Location Tagging with Smartphones, *MobiCom 15*, `tung2015echotag`
  * Taxonomy: Acoustic, Localization Algorithm + Anchor, 
  
* ToneTrack: Frequency-Agile Radios for Indoor Localization, *MobiCom 15*, `xiong2015tonetrack`
  * Taxonomy: Wi-Fi, Localization Algorithm, Small-scale
  
* PIXEL: Light-weight Indoor Positioning with Visible Light, *MobiSys 15*, `yang2015wearables`
  * Taxonomy: Light, Localization Algorithm, Small Scale
  * Pros: Light-weight that can run on resource-constrianed platforms
  
* INTRI: Contour-based Trilateration for Indoor Fingerprinting Localization, *SenSys 15*, `he2015contour`
  * Taxonomy: Wi-Fi, Localization Algorithm, Large-Scale
  
* SpinLight: High Accuracy and Robust Light Positioning System, *SenSys 15*, `xie2015spinlight`
  * Taxonomy: Light, Localization Algorithm + Anchor, Small Scale, Centimeter
  * Pros: 2D+3D localization
  * Cons: Light sensor needed
  
* Towards Truly Ubiquitous Indoor Localization on a Worldwide Scale, *SIGSPATIAL 15*, `youssef2015towards`
  * Taxonomy: Ubiquitous, 
  * Pros and Cons: Challenges and only challenges.
  
* LiFS: Low Human-Effort, Device-Free Localization, *MobiCom 16*, `wang2016lifs`
  * Taxonomy: Wi-Fi, Model-based, Small-Scale
  * Pros: No offline training
  * Cons: Known AP location
  
* LiTell: Robust Indoor Localization Using Unmodified Light Fixtures, *MobiCom 16*, `zhang2016litell`
  * Taxonomy: Light, Large-Scale, Localization Algorithm, Fingerprinting
  * Pros: No hardware modifications;
  
* NAVIQ: In-door WiFi-Beacon Navigation System Without Exact Location, *MobiSys 16*
  * Taxonomy: Navigation, BLE, 
  
* Pulsar: Ubiquitous Visible Light Localization, *MobiCom 17*, `zhang2017pulsar`
  * Taxonomy: Light, Localization Methods, (claimed to be) Ubiquitous 
  * Pros: No modification on light fixtures
  
* CELLI: Indoor Positioning Using Polarized Sweeping Light Beams, *MobiSys 17*, `wei2017celli`
  * Taxonomy: Light, Centimeter, Anchor+Localization Algorithm 
  * Pros: Only needs one transmitter and one sensor
  
* iLAMP: High-Precision Visible Light Localization, *MobiSys 17*, `zhu2017enabling`
  * Taxonomy: Light, Large-Scale, Localization Algorithm
  
* SmartLight: 3D Indoor Localization Using a Single LED Lamp, *SenSys 17*, `liu2017smartlight`
  * Taxonomy: Light, Small-Scale, Decimeter
  * Pros: Locates large number of sensors
  * Cons: LED light modification needed
  
* RainbowLight: Low Cost Ambient Light Positioning System, *MobiCom 18*, `li2018rainbowlight`  
  * Taxonomy: Light, Localization Algorithm, 
  
* EMF: Localization and Mapping with Power Network Electromagnetic Field, *MobiCom 18*, `lu2018simultaneous`  
  * Taxonomy: EMF, Anchor+Localization Algorithm
  
* ZhaoTian: Augmenting Indoor Inertial Tracking with Polarized Light, *MobiSys 18*, `tian2018augmenting`  
  * Taxonomy: Light+IMU, Anchor+Localization Algorithm
  
* MonoLoco: Multipath Triangulation: WiFi Localization and Orientation, *MobiSys 18*, `soltanaghaei2018multipath`
  * Taxonomy: Wi-Fi, Localization Algorithm, Decimeter-level, Small Scale
  * Pros: Only need single AP

* Widar2.0: Passive Human Tracking with a Single Wi-Fi Link, *MobiSys 18*, `qian2018widar2`
  * Taxonomy: Wi-Fi, Localization Algorithm
  * Pros: Only need one single Wi-Fi link

* mWaveLoc: Accurate 3D Localization for 60 GHz Networks, *SenSys 18*
  * Taxonomy: mmWave, Centimeter-level, 
  * Pros: High accuracy
  
* Toward Reliable Localization by Unequal AoA Tracking, *MobiSys19*  
  * Taxonomy: Wi-Fi, AoA


## Ref.

[MobiCom04] Andreas Haeberlen, Eliot Flannery, Andrew M. Ladd, Algis Rudys, Dan S. Wallach, and Lydia E. Kavraki. 2004. **Practical Robust Localization over Large-Scale 802.11 Wireless Networks Andreas**. In *ACM MobiCom*, 60–61.

[MobiSys05] Yu-Chung Cheng, Yatin Chawathe, Anthony LaMarca, and John Krumm. 2005. **Accuracy characterization for metropolitan-scale Wi-Fi localization**. In *ACM MobiSys*, 233. 

[MobiCom10-EZ] Krishna Chintalapudi. 2010. **Indoor Localization Without the Pain**. In *ACM MobiCom*, 173–184.

[SenSys10-Adaptive] Jurdak, R., Corke, P., Dharman, D., & Salagnac, G. (2010, November). **Adaptive GPS duty cycling and radio ranging for energy-efficient localization**. In *SenSys* (pp. 57-70). ACM.

[MobiCom12-LiFS] Zheng Yang, Chenshu Wu, and Yunhao Liu. 2012. **Locating in Fingerprint Space : Wireless Indoor Localization with Little Human Intervention**. In *ACM MobiCom*, 269–280.

[MobiCom12-Zee] Anshul Rai. 2012. **Zee : Zero-Effort Crowdsourcing for Indoor Localization Categories and Subject Descriptors**. In *ACM MobiCom*, 293–304.

[MobiSys12-UnLoc] He Wang, S Sen, and Ahmed Elgohary. 2012. **No need to war-drive: Unsupervised indoor localization**. *ACM MobiSys*, 197–210. 

[MobiSys13-Guoguo] Kaikai Liu, Xinxin Liu, and Xiaolin Li. 2013. **Guoguo: Enabling Fine-grained Indoor Localization via Smartphone**. *ACM MobiSys*, 235. 

[MobiCom14-Modellet] Li, L., 2014, **Experiencing and handling the diversity in data density and environmental locality in an indoor positioning service**. In *ACM MobiCom* 59-470

[MobiCom14-Ubicarse] Swarun Kumar, Stephanie Gil, Dina Katabi, and Daniela Rus. 2014. **Accurate Indoor Localization With Zero Start-up Cost**. In *ACM MobiCom*, 483–494.

[MobiCom14-Jigsaw] Ruipeng Gao, Mingmin Zhao, Tao Ye, Fan Ye, Yizhou Wang, Kaigui Bian, Tao Wang, and Xiaoming Li. 2014. **Jigsaw : Indoor Floor Plan Reconstruction via Mobile Crowdsensing**. In *ACM MobiCom*, 249–260.

[MobiCom14-Luxapose] Ye-Sheng Kuo, Pat Pannuto, Ko-Jen Hsiao, and Prabal Dutta. 2014. **Luxapose: Indoor Positioning with Mobile Phones and Visible Light.** In *ACM MobiCom*, 447–458.

[SenSys15-INTRI:] Suining He, Tianyang Hu, and S.-H Gary Chan. 2015. **Contour-based Trilateration for Indoor Fingerprinting Localization**. In *ACM SenSys*. 

[SIGCOMM15-SpotFi] Manikanta Kotaru, Kiran Joshi, Dinesh Bharadia, and Sachin Katti. 2015. **SpotFi: Decimeter Level Localization Using WiFi**. In *ACM SIGCOMM*, 269–282. 

[SIGSPATIAL15] Youssef, M. (2015, November). **Towards truly ubiquitous indoor localization on a worldwide scale**. In Proceedings of the 23rd SIGSPATIAL International Conference on Advances in Geographic Information Systems (p. 12). ACM.

[MobiCom16-LiFS] Ju Wang, Hongbo Jiang, Jie Xiong, Kyle Jamieson, Xiaojiang Chen, Dingyi Fang, and Binbin Xie. 2016. **LiFS: Low Human-Effort, Device-Free Localization with Fine-Grained Subcarrier Information**. In *ACM MobiCom*, 243–256. 

[MobiCom16-LiTell] Chi Zhang and Xinyu Zhang. 2016. **LiTell: indoor localization using unmodified light fixtures**. In *ACM MobiCom*, 481–482. 

[MobiSys16-NAVIQ] Huang, Q. 2016,. **Poster: Simplified In-door WiFi-Beacon Navigation System Without Exact Location**. In *ACM MobiSys* 33-33

[MobiCom17-Pulsar] Chi Zhang and Xinyu Zhang. 2017. **Pulsar: Towards Ubiquitous Visible Light Localization**. In *ACM MobiCom*, 208–221. 

[MobiSys17-CELLI] Yu-Lin Wei, Chang-Jung Huang, Hsin-Mu Tsai, and Kate Ching-Ju Lin. 2017. **CELLI: Indoor Positioning Using Polarized Sweeping Light Beams**. In *ACM MobiSys*, 136–147. 

[MobiSys17-iLAMP] Shilin Zhu and Xinyu Zhang. 2017. **Enabling High-Precision Visible Light Localization in Today’s Building**s. In *ACM MobiSys*, 96–108. 

[SenSys17-SmartLight] Song Liu and Tian He. 2017. **SmartLight: Light-weight 3D Indoor Localization Using a Single LED Lamp**. In *ACM SenSys*, 11:1--11:14. 

[MobiCom18-RainbowLight] Lingkun Li, Pengjin Xie, and Jiliang Wang. 2018. **Demo : RainbowLight : Design and Implementation of a Low Cost Ambient Light Positioning System**. In *ACM MobiCom*, 807–809.

[MobiCom18-EMF] Chris Xiaoxuan Lu, Yang Li, Peijun Zhao, Changhao Chen, Linhai Xie, Hongkai Wen, Rui Tan, and Niki Trigoni. 2018. **Simultaneous Localization and Mapping with Power Network Electromagnetic Field**. In *ACM MobiCom*, 607–622. 

[SenSys18-Salma] Bernhard Großwindhager, Michael Rath, Josef Kulmer, Mustafa S. Bakr, Carlo Alberto Boano, Klaus Witrisal, and Kay Römer. 2018. **Salma: UWB-based single-Anchor Localization System using Multipath Assistance**. *ACM SenSys* October (2018), 132–144. 

[MobiSys18-ZhaoTian] Zhao Tian, Yu-Lin Wei, Wei-Nin Chang, Xi Xiong, Changxi Zheng, Hsin-Mu Tsai, Kate Ching-Ju Lin, and Xia Zhou. 2018. **Augmenting Indoor Inertial Tracking with Polarized Light**. In *ACM MobiSys*. 

[MobiSys18-MonoLoco] Elahe Soltanaghaei, Avinash Kalyanaraman, and Kamin Whitehouse. 2018. **Multipath Triangulation: Decimeter-level WiFi Localization and Orientation with a Single Unaided Receiver**. In *ACM MobiSys*

[MobiSys18-Widar2.0] Kun Qian, Chenshu Wu, Yi Zhang, Guidong Zhang, Zheng Yang, Yunhao Liu, and Yun-Hao Liu. 2018. **Widar2.0: Passive Human Tracking with a Single Wi-Fi Link**. In *ACM MobiSys*, 12. 

[SenSys18-mWaveLoc] Ioannis Pefkianakis and Kyu-Han Kim. 2018. **Accurate 3D Localization for 60 GHz Networks**. In *ACM SenSys*, 120–131. 

[MobiSys19]Tai, T. C., Lin, K. C. J., & Tseng, Y. C. (2019, June). Toward Reliable Localization by Unequal AoA Tracking. In *MobiSys* (pp. 444-456). ACM.