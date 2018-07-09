---
layout: post
title: Prepared Paragraphs
date: June 30, 2018
author: Yi DING
---

In this post, I summarize some prepared parts that can be used in future papers.

Since some of the contents are from other papers, please remember to adjust before referring.



### Time Dependent Network

[1] We first transform the "duty-cycle-aware broadcast problem" into a shortest path problem in a time-coverage graph. Assume that the network topology and the active/dormant patterns are known, this graph problem is solvable through a centralized dynamic programming algorithm.

关于Time-Converage Graph的内容也可以借鉴这篇文章中的叙述。



### TSP with Time-Dependent Service Times

（TSP最优不是TSP-TS最优）[2] This observation implies that a TSP solution may not be optimal for the TSP-TS even when all customers have the same service time function and waiting does not provide any reduction in the total service time. Moreover, it shows that our problem may not correspond to the TSP even when all customers have the same quadratic service time func- tion (with a unique minimum).

（Time-Dependent TSP和TSP-TS不是一个问题）[2] In the TSP literature, time-dependency is usually addressed in terms of travel times. The interested reader is referred to Gouveia and Voß (1995) who present a classification of formulations proposed for the time-dependent TSP. Picard and Queyranne (1978), Vander Wiel and Sahinidis (1996),and Bigras, Gamache, and Savard (2008) con- sider a time-dependent TSP in which the travel time between any two nodes depends on the time period of the day.



### Beacon System 

"We build a large scale real world indoor localization system basede on iBeacon protocol. In building this system, we met the following pracitcal problems and address them with novel methods."



### NP-hard and Approximate Algorithm

[3] To improve *coRide’*s efficiency in mileage reduction, we formulate an NP-hard route calculation problem
under different practical constraints. We then provide (1) an optimal algorithm using Linear Programming, (2) a 2-approximation algorithm with a polynomial complexity, and (3) its corresponding online version with a linear complexity. 

[4] Many combinatorial optimization problems are NP hard, and there is no efficient general algorithm to solve this class of prob- lems in polynomial time. A typical approach is to use a heuristic algorithm to find an approximate solution. Commonly used meth- ods include hill-climbing methods, genetic algorithms, simulated annealing algorithms, etc. By balancing the accuracy and the per- formance, we choose a hill-climbing method to solve the problem.



### Basic Design and Advanced Design

"For the sake of clarity in presentation, we begin our design with a simplified assumption that it takes at most time $$\tau$$ to transmit one packet between two nodes successfully. We will address the practical issues related to packet loss and queuing delays in Section IV."



### Ref.

[1] Wang, F., & Liu, J. (2009). Duty-cycle-aware broadcast in wireless sensor networks. In *IEEE INFOCOM* (pp. 468–476). https://doi.org/10.1109/INFCOM.2009.5061952

[2] Taş, D., Gendreau, M., Jabali, O., & Laporte, G. (2016). The traveling salesman problem with time-dependent service times. *European Journal of Operational Research*, *248*(2), 372–383. https://doi.org/10.1016/j.ejor.2015.07.048

[3] Zhang, D., He, T., Zhang, F. A. N., Lu, M., Liu, Y., Lee, H., & Son, S. H. (2016). Carpooling Service for Large-Scale Taxicab Networks. *ACM Transactions on Sensor Networks*, *12*(3), 1–35. https://doi.org/10.1145/2897517

[4] Zhang, L., Hu, T., Min, Y., Wu, G., Zhang, J., Feng, P., … Ye, J. (2017). A Taxi Order Dispatch Model based On Combinatorial Optimization. *ACM SIGKDD*, 2151–2159. https://doi.org/10.1145/3097983.3098138