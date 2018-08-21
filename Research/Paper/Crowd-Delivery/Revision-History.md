---
layout: post
title: Revision History of Crowd Delivery Paper
date: June. 26, 2018
author: Yi DING
---

Here we reply to the weaknesses indicated by the reviewers from SenSys.



### Revision guidelines

? ? ? ? ?
	Explain how to resolve the "station to door" problem. (R1-Q2-1)
	Add more about " mobility patterns for the delivery purpose" since it is listed in the 3rd contribution.

INTRODUCTION
	Keep the scenario since nobody argue it's inappropriate.
	Keep focusing on public transport and make it as an innovation. (R1-Q1, R2-Q0, )
	Keep the consideration of time constraints.

MOTIVATION
	Add explanation or hypothesis on the obervation of trans and non-trans trips. (R2-Q4-1)
	Remove the overclaim about the detour, focus on the **public transport**. (R1-Q2-1)

HOW HITCHHIKING DELIVERY WORKS

	Improve the system figure.

DELIVERY TIME ESTIMATION

	Clearer mathematical notation. (R2-Q3-3)
	
	Add discussion on the amount of needed historical data and how long the estimation takes. Discuss the situation where participate rate vairies. (R1-Q3-2)
	
	Reconsider the setting of parcipating rate. (R1-Q3-5)
	
	Add explanation on K-S test result. (R1-Q3-6)
	
	Add explanation on Fig 6 and 7. (R2-Q1-1)
	
	Add explicit explanation on waiting time. (R2-Q3-1)

ROUTING WITH CONSTRAINTS

	Clearer mathematical notation. (R2-Q3-3)
	
	Adjust the algorithm part. (to improve the technical novelty) (R1-Q3-1, R2-Q1)
	
	Remove the specific content on MATLAB nad intlinprog(). (R1-Q3-1)
	
	Add more clear explanation of the dispatching mechanism, especially why we design the route when courier comes. (R1-Q3-3)
	
	Add the complexity analysis of the online dispatching algorithm. (R1-Q3-4)
	
	Add more discussion and justification on the Pre parameter. Or we can find a way to skip the discussion on Pre. (R2-Q1-3, R2-Q3-2) 
	
	Change the price rate to variable and check the performance in the evaluation section. (R2-Q1-2)
	
	Improve the description of " Approximation of the Modified CSP Problem" subsection. (R2-Q2-4)

PERFORMANCE EVALUATION

	Find and compare with some well-known baslines. (R2-Q2)
	
	Add greedy as baseline and consider removing the heuristic baseline. (R2-Q1-4)
	
	Keep large scale simulation and small scale in-field experiment. (R1-Q1)
	
	Re consider the setting of parcipating rate. (R1-Q3-5)
	
	Reconsider the experiment setting and result. (R1-Q3-7)
	
	Add price rate as an dimension. (R2-Q1-2)
	
	Reconsider the delivery rate metric. Add explanation on the delivery time constraint. (R2-Q1-5)
	
	Add more contents on the transfer and non-transfer comparision. (R2-Q3-5)

RELATED WORK



Typos and ambiguous presentations

	For example, there is a symbol “a” in the example in Section 5.2. But I cannot find "a" in the corresponding figure (Figure 9). There is a typo of the first sentence in Section 4.2, the symbol “tR^i” is not defined.



### Comments details

**Reviewer A, RevExp 2, OveMer 1**

Strengths:

1. Using public transport to delivery package with time guarantee is interesting.

2. Reasonable theoretical analysis is provided.

Weaknesses:

1. **No real supporting example applications.** 

   Re: Hard to implemente such a large system in real world.

2. **Some important design considerations and assumptions appear to be not reasonable or unrealistic.** 

   1. In Section 2.3, the authors argue “a detour is needed in current crowd delivery designs” and claim that “the detour can be eliminate by delivering the package via public transport and picking up from a station instead of from the front door of the house.” The detour is eliminated in hitchhiking delivery because the users are required to change the delivery address from home to the station, which indeed increases inconvenience to the users. The detour problem is avoided instead of being solved. A detour is inevitable if we don't require the users change delivery address. Hence, the claimed benefit of hitchhiking is not reasonable. Actually, I think using public transport as a new way to accomplish crowd delivery is good enough to motivate this work. The authors should not overclaim the advantage of doing so. 

      Re:  1. Remove the overclaim about the detour, focus on the **public transport**
      	2. Explain how to resolve the "station to door" problem.

3. **Limited technical novelty.** 

   1. The authors solve the constrained shortest path (CSP) problem by solving a Mixed Integer Linear Programming problem and only use a conventional method to solve it. In the proposed method of the modified CSP problem, the approximation solution is calculated by solving multiple standard CSP problem. The representative cumulative probability of delivery time, pRe, changes from 0.5 to 1.0 with a step size of 0.1. For each pRe, using the MATLAB function intlinprog() to get a solution. Then pRe is determined when the corresponding profit is best. Such a method is quite straight-forward, but not validated to be of real advantage. 

      Re: Adjust the algorithm part. Remove the specific content on MATLAB nad intlinprog().

   2. The estimation of delivery time is based on historical data. Then the proposed system suffers the cold start problem. The running time of public transport can change, especially when considering the dynamic number of participants in the proposed system. It is better to have discussion about the amount of needed historical data and how long the estimation takes.

      Re: Add discussion on the amount of needed historical data and how long the estimation takes. Discuss the situation where participate rate vairies.

   3. In Section 5.4, the online dispatching routes the package only when a courier is coming because more information of the courier can help with the accurate routing. But the authors don't provide any detail about the "more information". It is confusing why the routing can be more accurate when the courier comes. From Fig.10, it seems the solution of the routing problem is not affected by any specific courier.

      Re: Add more clear explanation of the dispatching mechanism, especially why we design the route when courier comes.

   4. For the online dispatching, the computational complexity is unclear. For each new coming courier, the system has to calculate whether any package matches this courier. When there are N packages, the system may solve the routing problem N times for each courier in the worst case. Then how long does the computation take? It is important because long waiting time will hurt the enthusiasm of couriers. How about calculating the optimal routing paths for each package in advance? Then only matching operation is needed when the new courier comes, which may shorten the waiting time.

      Re: Add the complexity analysis of the online dispatching algorithm.

   5. The participating rate is assumed to be known. However, in practice, the participating rate is hard to predict in each station. In Section 6.3.2, the authors claim that an overall participating rate can be obtained by asking the couriers register before using. But for different stations, the participating rate is different. Using an overall participating rate reduces the accuracy of delivery time estimation, leading to inaccurate routing decisions.

      Re: Reconsider the setting of parcipating rate.

   6. From the results in Table 1 and Table 2, the pass rate of K-S test decreases when the participating rate increases. It is confusing why more participants lead to less accurate estimation. Does it mean that the delivery time does not follow Normal distribution if the participating rate is high?

      Re: Add explanation on K-S test result.

   7. From the evaluation results, we find that about 20% packages fail to be delivered in the guaranteed time. The failure rate can be up to more than 60% when the participating rate is 0.01. Such performance is far from being satisfactory. The actual delivery delays of the unsuccessful deliveries should be provided. For example, for two-hours services, how many packages are delivered within ten-minutes overtime, and how many packages cannot be delivered even after 3 hours (the next service level with lower price).

      Re: Reconsider the experiment setting and result.

4. Relatively weak relevance to the scope of interest of SenSys.




**Reviewer B, RevExp 1, OveMer 2**

Strengths:

1. The proposed idea could be disruptive: crowdsource the delivery of goods by piggybacking on top of standard commuters. 
2. The evaluation is based on large real data sets and the authors also perform a small-scale experiment.

Weaknesses:

1. **Some of the constraints/parameters seem to be chosen to fit the model, not to fit realistic scenarios. Also some parameters are presented without a clear explanation. These points may affect the correctness of the approach.**

   Re: Improve writing and adjust design section.

   1. Based on Figs 6 and 7, the delay between the best case scenario and the worst case scenario is a bit more than 20 minutes. How relevant is this time difference for practical purposes? Would customers really care if their packets arrive 20 minutes later? I am aware that this figure only shows the delivery between two stations. It would be good to show how representative this particular points are.Based on Figs 6 and 7.

      Re: Add explanation on Fig 6 and 7.

   2. How do you determine the rates in Table 4? Wouldn't it be better to give variables and then see the effect of giving different prices?. Furthermore the authors seem to be paying a fixed rate for couriers independently of the travelled distance. This approach simplifies the problem but it is not realistic. This point should be clarified.

      Re: Change the rate to variable and check the performance in the evaluation section. 

   3. The justification for setting Pre>= 50%: "From a commercial view, the successful delivery rate should not be lower than half". How did you get that number? It doesn't sound right, I woud expect it to be higher (?) . Are all the results based on this unsubstantiated parameter?

      Re: Add more discussion and justification on the Pre parameter.

   4. The "Heuristic" algorithm seems way too naive. Why not compare the proposed method with a greedy approach that makes progress toward the destination, without performing any optimization? Such greedy approach would be simple to implement and it looks like the most obvious thing to do.

      Re: Add greedy as baseline and consider removing the heuristic baseline.

   5. I think that the metric used for Delivery rate is wrong (or at least is not well explained). Do you assume the delivery time to be a hard constraint? That would not be accurate. I would say that delivery time is a soft constraint, and thus, it would be better to measure lateness, rather than a binary decision.

      Re: Reconsider the delivery rate metric. Add explanation on the delivery time constraint.

2. **The authors compare their approach with naive alternatives.** 

   Re: Compare with well-know methods as base lines.

3. **Not a well written paper. Some of the notation and methods are not clear. There are several typos and grammatical errors.**

   1. The description of the waiting time was a bit difficult to understand because the authors seem to be calculating the Expected Waiting Time, but they don't mention that explicitly. The authors state simply "Waiting Time", which is not correct.

      Re: Add explicit explanation on waiting time.

   2. The description of Pre and its role are not clear. Perhaps an example would help. 

      Re: Add more discussion and justification on the Pre parameter

   3. The notation/presentation of the optimization problem is not clear. In general the paper should work on providing a clearer mathematical notation.

      Re: Clearer mathematical notation.

   4. Section 5.3 is not clear, please provide a better description and/or an example/figure to clarify your point.

      Re: Improve the description of " Approximation of the Modified CSP Problem" subsection.

   5. I like the empirical evaluation, but I think the authors should provide more details about key information. For example you mention that transfers are important, how many of these tests included transfers? what was the difference between the expected waiting time (based on data) and the measured waiting time, which I guess included convincing the commuters.

      Re: Add more contents on the transfer and non-transfer comparision.

4. Other comments

   1. Could you explain why the Transfer and Non-transfer curves in Fig 1 look so similar? Does this relation hold for all days? The results may be due to some special circumstances during that day or a bug processing the data. An explanation or hypothesis would help.

      Re: Add explanation or hypothesis on the obervation of trans and non-trans trips.

   2. 

**Reviewer C, RevExp 3, OveMer 3**

Strengths:

1. The work is novel, and reasonably well-evaluated both from the offline large data set and with some small scale in-field experiments.

Weaknesses:

1. Lack of significant real-world experimentation, weak connection with Sensys scope.