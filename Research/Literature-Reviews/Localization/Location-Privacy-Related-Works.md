---
author: Yi DING
layout: post
title: Related Works of Location Privacy
date: Feb. 15, 2018
---
# Related Works of Location Privacy

A common conclusion is that user trace can be recovered from very little trace leakage, published mobility data has privacy vulnerabilities even with anonymization [MobiCom10, MobiCom11, SciRep13, WWW17].



Many Location-Privacy Protection Mechanisms (**LPPM**s) have been proposed on this topic [MobiSys14, KDD14, INFOCOM14, SIGSPATIAL15-PLACE].

Location Privacy is quantified in [IEEESSP11].

*k*-anonymity: is a property possessed by certain anonymized data.



**Detailed Reviews**

* MobiCom10: Privacy Vulnerability of Published Anonymous Mobility Traces

  * Summary: Even anonymous published mobility trace data has privacy vulnerabilities due to spatial-temporal correlations.

* Ubicomp10: Exploring End User Preferences for Location Obfuscation

  * Summary: Visualization and questionnaire survey on 32 GPS data, showing that privacy protection awarenesses is lacking among people

* MobiCom11: Anonymization of Location Data Does Not Work

  * Summary: As title indicates.

* IEEESSP11: Quantifying Location Privacy

  * Summary: Many LPPMs are proposed, but unified metric is missing to measure location privacy and performance of LPPMs. Metric is proposed in this paper.

* SciRep13: The privacy bounds of human mobility

  * Summary: Uniqueness in human mobility is bounded, it's easy to infer user trace.

* MobiSys14-EnCore: Private, Context-based Communication for Mobile Social Apps

  * Taxonomy: LPPM in application
  * Summary: New LPPM for social-networking APP,

* KDD14: Privacy Preserving Release of Spatio-temporal Density in Paris

  * Taxonomy: LPPM in data releasing
  * Summary: New LPPM is provided in data release with differential privacy.

* INFOCOM14-DLS: Achieving k-anonymity in Privacy-Aware Location-Based Services

  * Taxonomy: LPPM
  * Summary: Introducing dummy locations.

* SIGSPATIAL15-PLACE: Privacy-Preserving Inference of Social Relationships from Location Data

  * Taxonomy: LPPM in computing
  * Summary: An framework is envisioned to preserve the priivacy when inferring social relations.

* WWW17: User Privacy Is NOT Preserved in Aggregated Mobility Data

  * Summary: Same scope as [MobiCom10], [MobiCom1] and [SciRep13].

  



## Ref

[MobiCom10] Chris Y T Ma and David K Y Yau. 2010. **Privacy Vulnerability of Published Anonymous Mobility Traces**. In *ACM MobiCom*, 185–196.

[Ubicomp10] A.J. Bernheim Brush, John Krumm, and James Scott. 2010. **Exploring end user preferences for location obfuscation, location-based services, and the value of locatio**n. In *ACM Ubicomp*, 95.

[MobiCom11] Hui Zang and Jean Bolot. 2011. **Anonymization of Location Data Does Not Work: A Large-Scale Measurement Study** Hui. In *ACM MobiCom*, 299–318. 

[IEEESSP11] Reza Shokri, George Theodorakopoulos, Jean-Yves Le Boudec, and Jean-Pierre Hubaux. 2011. **Quantifying Location Privacy**. In *IEEE Symposium on Security and Privacy*

[SciRep13] Yves Alexandre De Montjoye, César A. Hidalgo, Michel Verleysen, and Vincent D. Blondel. 2013. **Unique in the Crowd: The privacy bounds of human mobility**. *Sci. Rep.* 3, (2013), 1–5.

[MobiSys14] Paarijaat Aditya and Peter Druschel. 2014. **EnCore : Private, Context-based Communication for Mobile Social Apps**. In *ACM MobiSys*, 135–148. 

[KDD14] Gergely Acs and Claude Castelluccia. 2014. **A case study: privacy preserving release of spatio-temporal density in Paris.** In *ACM SIGKDD*, 1679–1688. 

[INFOCOM14-DLS] Ben Niu, Qinghua Li, Xiaoyan Zhu, Guohong Cao, and Hui Li. 2014. **Achieving k-anonymity in privacy-aware location-based services**. In *IEEE INFOCOM*, 754–762.

[SIGSPATIAL15-PLACE] Cyrus Shahabi, Liyue Fan, Luciano Nocera, Li Xiong, and Ming Li. 2015. **Privacy-preserving inference of social relationships from location data**. In *ACM SIGSPATIAL*, 1–4. 

[WWW17] Fengli Xu, Zhen Tu, Yong Li, Pengyu Zhang, Xiaoming Fu, and Depeng Jin. 2017. **Trajectory Recovery From Ash: User Privacy Is NOT Preserved in Aggregated Mobility Data**. *WWW*, 1241–1250. 

