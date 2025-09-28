---
layout: single
title: "Fall'25: CS 6301 Special Topics in CS: Machine Learning in Mobile Computing"
permalink: /teaching/fall25-cs6301/
author_profile: true
classes: wide
date: Sep. 1, 2025
---

## Course Info

**Instructor: Yi Ding**

**Office:** ECSS 4.703 

**Office hours:** by appointment 

**Email:** yi.ding@utdallas.edu

**Lecture:** 4:00 pm - 5:15 pm, Monday/Wednesday

**Location**: CR 1.202

**[Syllabus](https://dox.utdallas.edu/syl156169)**



## Course Description

Machine learning is transforming the way mobile and embedded systems perceive and interact with the world. Empowered by rich data from sensors embedded in our phones, wearables, vehicles, and infrastructure, mobile computing is becoming increasingly intelligent, context-aware, and human-centric.

In this course, we explore how **sensing technologies, machine learning techniques,** and **mobile systems** jointly enable applications in wireless sensing, multimodal fusion, on-device learning, and adaptive edge intelligence. Topics include RF-based sensing (e.g., Wi-Fi, Bluetooth, GPS, satellite), acoustic and visual sensing, inertial and environmental sensing, signal tokenization and feature modeling, mobile system optimization, privacy-preserving learning, and the use of foundation models in mobile and sensing scenarios.

Students are expected to:

(i) read and present research papers from top-tier conferences (e.g., MobiCom, SenSys, UbiComp, NeurIPS), </br>
(ii) participate actively in in-class discussions and invited talks from academia and industry, and </br>
(iii) design, implement, and present a **final project** that explores new ideas in mobile sensing and machine learning.


## Course Learning Objectives

By the end of this course, you will be able to

1. **Understand** the core principles of applying machine learning techniques to mobile and embedded systems, including sensing modalities, signal processing, and on-device learning.
2. **Explain** state-of-the-art research and system designs in mobile sensing, multimodal data fusion, edge intelligence, and federated learning.
3. **Evaluate** the  trade-offs and constraints in mobile and resource-constrained environments (e.g., latency, energy, privacy), and how they affect the deployment of machine learning models.
4. **Design** and **propose** intelligent mobile sensing systems that integrate machine learning, signal modeling, and system-level optimization.
5. **Implement** prototypes or simulations using real-world or simulated sensor data, employing tools such as Python, PyTorch/TensorFlow, and edge deployment toolkits.
6. **Communicate** technical insights effectively through paper presentations, invited talk discussions, and final project demos.



## Required Texts

No books are required. All the materials will be online.



## Course Schedule (Tentative)

<details markdown=block>
<summary>W1: Course Introduction & Guidance on Paper Reading and Presentation (08/25, 08/27)</summary>

* Lecture: Course Introduction & Logistics

</details>


<details markdown=block>
<summary>Topic 1: Sensing: Wi-Fi & Bluetooth (09/22)</summary>

* Topic1-Paper1 [Ding, Jian, et al. "Cost-effective soil carbon sensing with wi-fi and optical signals." *Proceedings of the 30th Annual International Conference on Mobile Computing and Networking*. 2024.](https://dl.acm.org/doi/pdf/10.1145/3636534.3690675)
* Topic1-Paper2 [Li, Chenning, et al. "Wi-fi see it all: generative adversarial network-augmented versatile wi-fi imaging." *Proceedings of the 18th Conference on Embedded Networked Sensor Systems*. 2020.](https://dl.acm.org/doi/pdf/10.1145/3384419.3430725?casa_token=b7ochCDSOyQAAAAA:veLiQNzzpNOi-Zrl4r7N7kmYH8m6TFzF95gDVFpNf4aYTdevHy6nqKm8t-5e2K0s5imfX6PECEO4LA)
* Topic1-Paper3 [Ni, Jiazhi, et al. "Experience: Pushing indoor localization from laboratory to the wild." *Proceedings of the 28th Annual International Conference on Mobile Computing And Networking.* 2022.](https://dl.acm.org/doi/pdf/10.1145/3495243.3560546)
* Topic1-Paper4 [Li, Xin, et al. "Uwb-fi: Pushing wi-fi towards ultra-wideband for fine-granularity sensing." *Proceedings of the 22nd Annual International Conference on Mobile Systems, Applications and Services.* 2024.](https://dl.acm.org/doi/pdf/10.1145/3643832.3661889)
* Topic1-Paper5 [Adib, Fadel, and Dina Katabi. "See through walls with WiFi!." *Proceedings of the ACM SIGCOMM 2013 conference on SIGCOMM.* 2013.](https://dl.acm.org/doi/pdf/10.1145/2486001.2486039)
* Topic1-Paper6 [Wang, Yuxi, Kaishun Wu, and Lionel M. Ni. "Wifall: Device-free fall detection by wireless networks." *IEEE Transactions on Mobile Computing* 16.2 (2016): 581-594.](https://web.archive.org/web/20160331162823id_/http://kaishunwu.com/uploads/soft/150201/wifall.pdf)

</details>


<details markdown=block>
<summary>Topic 2: Sensing: Motion & Environmental Sensors (IMU, Biochemical, etc.) (09/03, 09/10)</summary>

* Topic2-Paper1 [Xu, Huatao, et al. "Practically adopting human activity recognition." *Proceedings of the 29th Annual International Conference on Mobile Computing and Networking*. 2023.](https://dapowan.github.io/files/UniHAR.pdf)
* Topic2-Paper2 [Brooks, Jas, and Pedro Lopes. "Smell & paste: Low-fidelity prototyping for olfactory experiences." *Proceedings of the 2023 CHI Conference on Human Factors in Computing Systems.* 2023.](https://dl.acm.org/doi/pdf/10.1145/3544548.3580680)
* Topic2-Paper3 [Yin, Xiangyu, et al. "PTEase: objective airway examination for pulmonary telemedicine using commodity smartphones." *Proceedings of the 21st Annual International Conference on Mobile Systems, Applications and Services.* 2023.](https://dl.acm.org/doi/pdf/10.1145/3581791.3596854)
* Topic2-Paper4 [Zhou, Pengfei, et al. "Iodetector: A generic service for indoor outdoor detection." *Proceedings of the 10th acm conference on embedded network sensor systems*. 2012.](https://dl.acm.org/doi/pdf/10.1145/2426656.2426668?casa_token=Meh6AaTk37gAAAAA:2ZpLW3ycrngonKW4xe_fvX0PC1aXRiD818M6z9EyCNfkXF7Qoiw_1LdEMQEftrgJi8MGZombXA)
* Topic2-Paper5 [Xie, Zhiqing, et al. "TransFloor: Transparent floor localization for crowdsourcing instant delivery." *Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies 6.4* (2023): 1-30.](https://dl.acm.org/doi/pdf/10.1145/3569470)


</details>

<details markdown=block>
<summary>Topic 3: Sensing: Acoustic & Vision (09/24, 09/29)</summary>

* Topic3-Paper1 [Liang, Xiaoxuan, et al. "Sondar: Size and shape measurements using acoustic imaging." *Proceedings of the Twenty-fifth International Symposium on Theory, Algorithmic Foundations, and Protocol Design for Mobile Networks and Mobile Computing*. 2024.](https://dl.acm.org/doi/pdf/10.1145/3641512.3686359)
* Topic3-Paper2 [Cao, Shirui, et al. "Powerphone: Unleashing the acoustic sensing capability of smartphones." *Proceedings of the 29th Annual International Conference on Mobile Computing and Networking*. 2023.](https://dl.acm.org/doi/pdf/10.1145/3570361.3613270?casa_token=DGY_i9RKDbMAAAAA:6Ij6-maaT-kMcZIuBY134Im8wjqZ8RYWx_Vt9wJv91QzIZgycswb4bezhJZMH31KdoHKAiX3IS4tCA)
* Topic3-Paper3 [Zhang, Yongzhao, et al. "Acoustic sensing and communication using metasurface." *20th USENIX Symposium on Networked Systems Design and Implementation (NSDI 23).* 2023.](https://www.usenix.org/system/files/nsdi23-zhang-yongzhao.pdf)
* Topic3-Paper4 [Zhang, Yanbo, et al. "Face recognition in harsh conditions: An acoustic based approach." *Proceedings of the 22nd annual international conference on mobile systems, applications and services.* 2024.](https://wands.hk/papers/MobiSys_24_1.pdf)
* Topic3-Paper5 [Liu, Xuanyu, et al. "AcousAF: Acoustic Sensing-Based Atrial Fibrillation Detection System for Mobile Phones." *Companion of the 2024 on ACM International Joint Conference on Pervasive and Ubiquitous Computing.* 2024.](https://arxiv.org/pdf/2408.04912)
* Topic3-Paper6 [Li, Ke, et al. "Gazetrak: Exploring acoustic-based eye tracking on a glass frame." *Proceedings of the 30th Annual International Conference on Mobile Computing and Networking.* 2024.](https://dl.acm.org/doi/pdf/10.1145/3636534.3649376)

</details>


<details markdown=block>
<summary>Topic 4: Sensing: GPS & Satellite (09/29, )</summary>

* Topic4-Paper1 [Rathi, Raghav, and Zhenghao Zhang. "StarAngle: User Orientation Sensing with Beacon Phase Measurements of Multiple Starlink Satellites." *Proceedings of the 22nd ACM Conference on Embedded Networked Sensor Systems.* 2024.](https://dl.acm.org/doi/pdf/10.1145/3666025.3699367?casa_token=OCy40xytKEwAAAAA:w943Pb6yshPTiW8C0n4wLDo3ouhCZ2NRJOLhbqjC_f-3fTHiDCWSXVgbQoYrkngyXjy9MG6kYYu69Q)
* Topic4-Paper2 [Wang, Yunfan, et al. "Global localization of energy-constrained miniature rf emitters using low earth orbit satellites." *Proceedings of the 21st ACM Conference on Embedded Networked Sensor Systems.* 2023.](https://dl.acm.org/doi/pdf/10.1145/3625687.3625794?casa_token=nSHDsORfyOUAAAAA:xTFqJaibWBenULgGWq5Bht6N4g5tmVpiak_LfnJpyFO-9swQET3ZwEsHbiRV98MMe2DHCQHStZTkhA)
* Topic4-Paper3 [Ecola, Geneva, et al. "SARLink: Satellite Backscatter Connectivity using Synthetic Aperture Radar." *Proceedings of the 23rd ACM Conference on Embedded Networked Sensor Systems.* 2025.](https://dl.acm.org/doi/pdf/10.1145/3715014.3722061)
* Topic4-Paper4 [Li, Ruinan, et al. "Plug-and-play indoor GPS positioning system with the assistance of optically transparent metasurfaces." *Proceedings of the 30th Annual International Conference on Mobile Computing and Networking.* 2024.](https://dl.acm.org/doi/pdf/10.1145/3636534.3690667?casa_token=jQaogJjTfzIAAAAA:h6OGvB9lR1ZLmX_MqRVeNi1ecQrrbO4IBR4vjlj7dphLbFTQ6YAC0Mq5gF0APTZWGpt4z-Sp51W1PQ)
* Topic4-Paper5 [Dong, Huixin, et al. "Gpsmirror: Expanding accurate gps positioning to shadowed and indoor regions with backscatter." *Proceedings of the 29th Annual International Conference on Mobile Computing and Networking.* 2023.](https://dl.acm.org/doi/pdf/10.1145/3570361.3592511?casa_token=jMGFdgAJi3kAAAAA:N-OBFo_5k9MXHRqaCM-cdEuLdigmSezug6qH4bfNhpVtR-sG41KN_wNvQuy2mhrqY5ekwivQlHZCwg)
* Topic4-Paper6 [Hong, Zhiqing, et al. "Smallmap: Low-cost community road map sensing with uncertain delivery behavior." *Proceedings of the ACM on Interactive, Mobile, Wearable and Ubiquitous Technologies* 8.2 (2024): 1-26.](https://dl.acm.org/doi/pdf/10.1145/3659596)


</details>

<details markdown=block>
<summary>Topic 5: Sensing: Multi-Modality</summary>

* Topic5-Paper1 [Liu, Yang, et al. "SPATIUM: A Context-Aware Machine Learning Framework for Immersive Spatiotemporal Health Understanding." *Proceedings of the 23rd Annual International Conference on Mobile Systems, Applications and Services.* 2025.](https://dl.acm.org/doi/pdf/10.1145/3711875.3736686)


</details>

<details markdown=block>
<summary>Topic 6: Learning: Mobile AI Efficiency </summary>


</details>

<details markdown=block>
<summary>Topic 7: Learning: On-Device Learning & Model Compression</summary>


</details>

<details markdown=block>
<summary>Topic 8: Learning: Federated Learning & Mobile Systems</summary>


</details>

<details markdown=block>
<summary>Topic 9: Learning: Foundation Models for Sensing & Mobile AI</summary>


</details>

<details markdown=block>
<summary>Topic 10: Mobile AI Applications</summary>


</details>



<br>

## Invited Talks

* Sep. 8, 2025, [Zhiqing Hong (Rutgers, UB Berkeley)](http://www.zhiqinghong.one/): [Understanding Human Behavior with IMU Sensing & Wearable AI](https://utdallas.box.com/s/gukytibeuw460xdomgo9xxnzhvfchat1)





