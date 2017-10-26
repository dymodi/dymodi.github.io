--- 
layout: post
title: Data Inconsistency Related Works
date: Oct. 26, 2017
author: Yi DING
---

[comment]: # (This is a review for data inconsistency)

In paper [1],  conditional functional dependencies (CFDs) is used to detect the errors in the data. The basic idea is that CFD makes some assertions on the data. The violations is detected by checking weather the data comply with  the CFD. For example, the CFD claims that in a dataset, if a employee is in country "UK" and city "London", then his/her salary should be higher than "1000", we then check this CFD on the dataset and find the violations.

In paper [2], a term is added to the commonly used Bayesian technique that represents the probabilistic estimate corresponding to the event that the data is not spurious conditioned upon the data and the true state.

In paper [3], spatial inconsistency and temporal inconsistency is defined. CFD is also mentioned in this paper. However, this paper is not well written and organized.

A more complete and elegant summary can of spatial and temporal inconsistency can be found in [4].

Similar as [1], paper [5] has a detailed description of CFD on distributed data.

In paper [6], a likelihood maximization method combined with machine learning is proposed to repair the error data. Similar idea is also discussed in paper [7].

Paper [8] provides another idea that inconsistency can be resolved through preferences on data sources.


## Ref.
[1] Fan, W., Li, J., & Tang, N. (2014). **Incremental detection of inconsistencies in distributed data**. IEEE Transactions on Knowledge and Data Engineering, 26(6), 1367-1383. 
[Google Scholar](https://scholar.google.com.hk/scholar?hl=zh-CN&as_sdt=0%2C5&q=Incremental+Detection+of+Inconsistencies+in+Distributed+Data&btnG=)
[IEEE Xplore](http://ieeexplore.ieee.org.ezp1.lib.umn.edu/document/6228094/)

[2] Kumar, M., Garg, D. P., & Zachery, R. A. (2006, June). **A generalized approach for inconsistency detection in data fusion from multiple sensors**. In American Control Conference, 2006 (pp. 6-pp). IEEE.
[Google Scholar](https://scholar.google.com.hk/scholar?hl=zh-CN&as_sdt=0%2C5&q=A+generalized+approach+for+inconsistency+detection+in+data+fusion+from+multiple+sensors&btnG=)
[IEEE Xplore](http://ieeexplore.ieee.org.ezp1.lib.umn.edu/stamp/stamp.jsp?arnumber=1656526)

[3] Yadav, R. K., & Naaz, K. A. (2015, December). Efforts toward Research and Development on Inconsistencies and Analytical Tools of Big Data. In Computational Intelligence and Communication Networks (CICN), 2015 International Conference on (pp. 845-850). IEEE.
[Google Scholar](https://scholar.google.com.hk/scholar?hl=zh-CN&as_sdt=0%2C5&q=Efforts+toward+Research+and+Development+on+Inconsistencies+and+Analytical+tools+of+Big+Data+&btnG=)
[IEEE Xplore](http://ieeexplore.ieee.org.ezp1.lib.umn.edu/stamp/stamp.jsp?arnumber=7546215)

[4] Zhang, D. (2013, July). Inconsistencies in big data. In Cognitive Informatics & Cognitive Computing (ICCI* CC), 2013 12th IEEE International Conference on (pp. 61-67). IEEE.
[Google Scholar](https://scholar.google.com.hk/scholar?hl=zh-CN&as_sdt=0%2C5&q=Inconsistencies+in+Big+Data+&btnG=)
[IEEE Xplore](http://ieeexplore.ieee.org.ezp1.lib.umn.edu/stamp/stamp.jsp?arnumber=6622226)

[5] Fan, W., Geerts, F., Ma, S., & Müller, H. (2010, March). Detecting inconsistencies in distributed data. In Data Engineering (ICDE), 2010 IEEE 26th International Conference on (pp. 64-75). IEEE.

[6] Yakout, M., Berti-Équille, L., & Elmagarmid, A. K. (2013, June). **Don't be SCAREd: use SCalable Automatic REpairing with maximal likelihood and bounded changes**. In Proceedings of the 2013 ACM SIGMOD International Conference on Management of Data (pp. 553-564). ACM.
[Google Scholar](https://scholar.google.com.hk/scholar?hl=zh-CN&as_sdt=0%2C5&q=Don%E2%80%99t+be+SCAREd%3A+Use+SCalable+Automatic+REpairing+with+Maximal+Likelihood+and+Bounded+Changes&btnG=)
[ACM](http://delivery.acm.org.ezp2.lib.umn.edu/10.1145/2470000/2463706/p553-yakout.pdf?ip=134.84.192.102&id=2463706&acc=ACTIVE%20SERVICE&key=70F2FDC0A279768C%2E3D342327617A783A%2E4D4702B0C3E38B35%2E4D4702B0C3E38B35&CFID=822493076&CFTOKEN=21338678&__acm__=1509013463_13d1a1a89a5ea68854da3286fd932f49#URLTOKEN#)

[7] Zhang, A., Song, S., & Wang, J. (2016, June). Sequential data cleaning: a statistical approach. In Proceedings of the 2016 International Conference on Management of Data (pp. 909-924). ACM.

[8] De Giacomo, G., Lembo, D., Lenzerini, M., & Rosati, R. (2004, June). Tackling inconsistencies in data integration through source preferences. In Proceedings of the 2004 international workshop on Information quality in information systems (pp. 27-34). ACM.