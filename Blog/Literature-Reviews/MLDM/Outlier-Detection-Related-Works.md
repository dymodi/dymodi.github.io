---
layout: post
title: Related Works of Outlier Detection
date: May. 3, 2018
author: Yi DING
---

[1] is one of the most cited paper in the anomaly detection field. Different key assumptions are used in different methods to differentiate between normal and anomalous behavior. According to [1], outliers detection methods can be categorized into **classification-based**, **nearest neighbor-based**, **clustering-based**, and **statistical techniques**. **Contextual anomaly**[1], or conditonal anomaly, is an interesting type of anomalies that only can be determined as anomaly under certain circumstances. **Collective anomaly**[1], is used to describe a type of anomalies that each instance itself is not an anomaly while the gathering of some instances are to become anomalies.

Based on the extent to which the labels are available, anomaly detection techniques can operate in one of the following three modes: *Supervised Anomaly Detection*, *Semisupervised Anomaly Detection* and *Unsupervised Anomaly Detection*.

**Fraud detection**, as one of the main applications of outlier detection, has be discussed in detail in [1].

Distance to $$k^\text{th}$$ nearest neighbor and **Local Outlier Factor (LOF)** are both nearest neighbor-based techniques.

Outlier detection methods based on **clustering** usually have the assumptions that normal data and anomalies belong to different cluster, and (or) their clusters have different properties in density or scale.

In statistical techniques, one methods is to assume the data is generated from a **Gaussian distribution**. The parameters are estimated using Maximum Likelihood Estimates (MLE). The distance of a data instance to the estimated mean is the anomaly score for that instance. 

Anomaly detection using regression has been extensively investigated for time-series data.




## Ref.
[1] Chandola, V., Banerjee, A., & Kumar, V. (2009). **Anomaly detection: A survey**. *ACM computing surveys (CSUR)*, *41*(3), 15.


