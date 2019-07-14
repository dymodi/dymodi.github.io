---
author: Yi DING
layout: post
title: Related Works of Spatial Temporal Data Learning
date: July 14, 2019
---

**Taxonomy**

* Data: Parking, Trajectory, Taxi, Bike, Event (Collision, Crime, Taxi), Contextual (Map), Traffic (speed), Water quality
* Model: LSTM, Greedy, Deep (Convolutional) NN, Point process, Meta-learning, Transfer learning
* Application: Parking space, Trajectory compression, (Mobility) Event prediction, Taxi demand prediction, Traffic prediction, Water quality prediction

**Comments**

* Two typical framework in incorporating spatial and temporal relations:
  * Invidual processing through LSTM (temporal) and CNN (spatial) [AAAI18, WWW19].
  * Combined processing as video processing [KDD18-StepDeep].

**Individual Paper**

* Deep multi-view, *AAAI18*, *DiDi*
  * Taxonomy: LSTM + CNN, Taxi demand prediction
  * The key innovation is to consider spatial and temporal at the same time.
* Du-parking, *KDD18*, *Baidu*
  * Taxonomy: Parking data, LSTM, Parking space
* REST, Reference-based Framework for Spatio-temporal Trajectory Compression, *KDD18*
  * Taxonomy: Trajectory data, Greedy, Trajectory compression
* Stepdeep, *KDD18*
  * Taxonomy: Taxi data, Deep (Convolutional) NN, Mobility event prediction
  * The key innovation is to encode spatial-temporal correlation into 2 dimensions and make it into a video processing problem. Methods for image processing are used.
* DMPP, *KDD19*
  * Taxonomy: Event data, Contextual data, Point process, CNN, Event prediction
  * The key innovation is to incorporate contextual informationb (weather/map) into the simple point process to improve prediction performance.
* Urban Traffic Prediction, *KDD19-ST-MetaNet*
  * Taxonomy: Traffic (speed) data, Meta-learning, Traffic prediction
* Learning from Multiple Cities, *WWW19*, *Tencent*
  * Taxonomy: Taxi data, Bike data,  Transfer learning + Meta learning + ST-net, Traffic prediction, Water quality prediction



## Ref

[AAAI18] Yao, H., Wu, F., Ke, J., Tang, X., Jia, Y., Lu, S., ... & Li, Z. (2018, April). Deep multi-view spatial-temporal network for taxi demand prediction. In *AAAI*.

[KDD18-Du-parking] Rong, Y., Xu, Z., Yan, R., & Ma, X. (2018, July). Du-parking: Spatio-temporal big data tells you realtime parking availability. In *KDD* (pp. 646-654). ACM.

[KDD18-REST] Zhao, Y., Shang, S., Wang, Y., Zheng, B., Nguyen, Q. V. H., & Zheng, K. (2018, July). Rest: A reference-based framework for spatio-temporal trajectory compression. In *KDD* (pp. 2797-2806). ACM.

[KDD18-Stepdeep] Shen, B., Liang, X., Ouyang, Y., Liu, M., Zheng, W., & Carley, K. M. (2018, July). Stepdeep: a novel spatial-temporal mobility event prediction framework based on deep neural network. In *KDD* (pp. 724-733). ACM.

[KDD19-DMPP] Okawa, M., Iwata, T., Kurashima, T., Tanaka, Y., Toda, H., & Ueda, N. (2019). Deep Mixture Point Processes: Spatio-temporal Event Prediction with Rich Contextual Information. *KDD*.

[KDD19-ST-MetaNet] Urban Traffic Prediction from Spatio-Temporal Data Using Deep Meta Learning. *KDD*

[WWW19] Yao, H., Liu, Y., Wei, Y., Tang, X., & Li, Z. (2019, May). Learning from Multiple Cities: A Meta-Learning Approach for Spatial-Temporal Prediction. In *WWW* (pp. 2181-2191). ACM.

