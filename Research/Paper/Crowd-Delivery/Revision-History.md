---
layout: post
title: Revision History of Crowd Delivery Paper
date: June. 26, 2018
author: Yi DING
---

Here we reply to the weaknesses indicated by the reviewers from SenSys.



### Revision guidelines

1. Keep focusing on public transport and make it as an innovation.
2. Keep the consideration of time constraints.
3. Keep large scale simulation and small scale in-field experiment.
4. Find and compare with some well-known baslines.
5. Remove the overclaim about the detour, focus on the **public transport**
6. Explain how to resolve the "station to door" problem.



### Comments details

**Reviewer A, RevExp 2, OveMer 1**

Strengths:

1. Using public transport to delivery package with time guarantee is interesting.

2. Reasonable theoretical analysis is provided.

Weaknesses:

1. No real supporting example applications. 

   Re: Hard to implemente such a large system in real world.

2. Some important design considerations and assumptions appear to be not reasonable or unrealistic. 

   1. In Section 2.3, the authors argue “a detour is needed in current crowd delivery designs” and claim that “the detour can be eliminate by delivering the package via public transport and picking up from a station instead of from the front door of the house.” The detour is eliminated in hitchhiking delivery because the users are required to change the delivery address from home to the station, which indeed increases inconvenience to the users. The detour problem is avoided instead of being solved. A detour is inevitable if we don't require the users change delivery address. Hence, the claimed benefit of hitchhiking is not reasonable. Actually, I think using public transport as a new way to accomplish crowd delivery is good enough to motivate this work. The authors should not overclaim the advantage of doing so. 

      Re:  1. Remove the overclaim about the detour, focus on the **public transport**
      	2. Explain how to resolve the "station to door" problem.

3. Limited technical novelty. 

4. Relatively weak relevance to the scope of interest of SenSys.




**Reviewer B, RevExp 1, OveMer 2**

Strengths:

1. The proposed idea could be disruptive: crowdsource the delivery of goods by piggybacking on top of standard commuters. 
2. The evaluation is based on large real data sets and the authors also perform a small-scale experiment.

Weaknesses:

1. Some of the constraints/parameters seem to be chosen to fit the model, not to fit realistic scenarios. Also some parameters are presented without a clear explanation. These points may affect the correctness of the approach.
2. The authors compare their approach with naive alternatives. 
3. Not a well written paper. Some of the notation and methods are not clear. There are several typos and grammatical errors.



**Reviewer C, RevExp 3, OveMer 3**

Strengths:

1. The work is novel, and reasonably well-evaluated both from the offline large data set and with some small scale in-field experiments.

Weaknesses:

1. Lack of significant real-world experimentation, weak connection with Sensys scope.