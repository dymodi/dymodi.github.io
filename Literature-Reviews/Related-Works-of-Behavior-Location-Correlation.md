---
author: Yi DING
layout: post
title: Related Works of Behavior Location Correlation
date: Nov. 26,  2018
---

**Key Words**: 

* Location-based social networks (LBSNs)
* Geo-Social Correlation



In LBSNs, researchers focus on the correlation between users' spatial location (check-in behavior) and social networks (Twitter texts, etc.)

A related works is utilizing user's social information in improving location prediction performance [1, 2, 3, 4]. 



## Differences

There are two main differences:

1. In LBSNs, the user's locations are analyzed and predicted in a social network view. Specifically, features they utilzed are previous check-in or friends check-in. However, we analyze and detect the user's location based on the user's own behavior. This is made possible since more behevior are conducted on the cellphone end like payment and navigation. That is, massive data can be collected on user behavior.
2. Since the application is to provide anchor, the frequence of our prediction on user's location is much higher than that in LBSNs, leading to a problem of lacking labels in training.





## Ref.

[1] E. Cho, S. Myers, and J. Leskovec. **Friendship and mobility: user movement in location-based social networks**. In *KDD*, pages 1082–1090. ACM, 2011.

[2] H. Gao, J. Tang, and H. Liu. **Exploring social-historical ties on location-based social networks**. In ICWSM, 2012.

[3] Chang, J., & Sun, E. (2011, July). **Location 3: How users share and respond to location-based data on social networking sites**. In *Proceedings of the Fifth International AAAI Conference on Weblogs and Social Media* (pp. 74-80). AAAI Press.

[4] Huiji Gao, Jiliang Tang, and Huan Liu. 2012. **gSCorr: modeling geo-social correlations for new check-ins on location-based social networks**. In *CIKM*, 1582. DOI:https://doi.org/10.1145/2396761.2398477