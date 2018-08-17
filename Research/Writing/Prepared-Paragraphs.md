---
layout: post
title: Prepared Paragraphs
date: June 30, 2018
author: Yi DING
---

In this post, I summarize some prepared parts that can be used in future papers.

Since some of the contents are from other papers, please remember to adjust before referring.

[TOC]

## General Contents

### Introduction - System Work

We present the first systematic work to design, implement, and evaluate a carpool service, called coRide, in a large-scale taxicab network intended to reduce total mileage for less gas consumption. -- Desheng, coRide

In this paper, we propose an indoor localization system called “Guoguo”, and further improve its performance in terms of coverage, accuracy, update rate, and sound pollution.

### Introduction - Contribution

Propose a simple yet accurate representation of practical instant delivery system, which for the first time …

This is the first in-depth work to investigate the effect of long preparing-time at the rider side in the delivery system. A novel XXX is proposed …


### Challenges  - Uniqueness of the specific system

**Why this problem cannot be solve by existing methods?**

[5] Based on real-world multi-source data, we identify two new challenges for FHV dispatching: ... As a result, the state-of-the-art taxi dispatching techniques cannot be applied to FHV systems.

### Solution - Basic Design and Advanced Design

"For the sake of clarity in presentation, we begin our design with a simplified assumption that it takes at most time $$\tau$$ to transmit one packet between two nodes successfully. We will address the practical issues related to packet loss and queuing delays in Section IV."

### Evaluation - Baseline

（Heuristic和最优解的比较）"Compared to the MIP solver, our heuristic is superior in both the solution times and the quality of the obtained solutions if the CPU time is limited"

### Link between Paragraphs and Topics

Along this line, there are two major challenges for solving the XX problem. First, ... Second, ... In the follow- ing section, we will introduce our solutions for the above two challenges, respectively.




## Specific Contents

### Reinforcement Learning

Reinforcement learning algorithms balance exploration and exploitation. Exploration is trying different things to see if they are in face better than what has been tried before. Exploitation is trying the things that have worked best in the past.  

Standard supervised learning algorithms don't perform this balance. They generally are purely exploitative. (Bayesian algorithms implicitly balance exploration and exploitation by integrating over the posterior.)

### Time Dependent Network

[1] We first transform the "duty-cycle-aware broadcast problem" into a shortest path problem in a time-coverage graph. Assume that the network topology and the active/dormant patterns are known, this graph problem is solvable through a centralized dynamic programming algorithm.

关于Time-Converage Graph的内容也可以借鉴这篇文章中的叙述。

### TSP with Time-Dependent Service Times

（TSP最优不是TSP-TS最优）[2] This observation implies that a TSP solution may not be optimal for the TSP-TS even when all customers have the same service time function and waiting does not provide any reduction in the total service time. Moreover, it shows that our problem may not correspond to the TSP even when all customers have the same quadratic service time func- tion (with a unique minimum).

（Time-Dependent TSP和TSP-TS不是一个问题）[2] In the TSP literature, time-dependency is usually addressed in terms of travel times. The interested reader is referred to Gouveia and Voß (1995) who present a classification of formulations proposed for the time-dependent TSP. Picard and Queyranne (1978), Vander Wiel and Sahinidis (1996),and Bigras, Gamache, and Savard (2008) con- sider a time-dependent TSP in which the travel time between any two nodes depends on the time period of the day.

### Pros and Cons of Real BLE Beacons

(Indoor localization via calibration) is time consuming, labor intensive, vulnerable to environmental changes, and the process requires certain pedigree on the surveyor that may deem the fingerprinting techniques impractical to be deployed over large areas (e.g., shoppingmalls, multi-storey offices/residences, etc.) 
-- Hossain, A. K. M. M., & Soh, W. (2015). A survey of calibration-free indoor positioning systems. Computer Communications, 66, 1–13


### Pros and Cons of Crowdsourcing

[6], check urban sensing part.

% Monetary incentives are hard to solve

However, users’ motivation and long-term engagement is still an unsolved question for crowdsourcing \cite{Zheng2014}. Even with monetary incentives, the pricing is a difficult problem to handle. Overpricing would result in heavy financial burden, whereas underpricing could lead to task “starvation” because of unavailability of the workers willing to participate \cite{Singla2013}. 

% Monetary incentives may lead to cheating

Quality control is one of major issues arise in crowdsourcing \cite{Kittur2013} . It has been widely reported that counterproductive contributions might be bought in by either well-intentioned “eager beavers” \cite{Bernstein2010}, or intentional cheaters \cite{Eickhoff2013}, \ref{Buchholz2011}.

\bibitem{Kittur2013} Kittur, A., Nickerson, J. V., Bernstein, M., Gerber, E., Shaw, A., Zimmerman, J., … Horton, J. (2013). The future of crowd work. *Proceedings of the 2013 Conference on Computer Supported Cooperative Work - CSCW* ’*13*, 1301.

\bibitem{Bernstein2010} Bernstein, M. S., Little, G., Miller, R. C., Hartmann, B., Ackerman, M. S., Karger, D. R., ... & Panovich, K. (2010, October). Soylent: a word processor with a crowd inside. In *Proceedings of the 23nd annual ACM symposium on User interface software and technology* (pp. 313-322). ACM.

\cite{Eickhoff2013} Eickhoff, Carsten, and Arjen P. de Vries. "Increasing cheat robustness of crowdsourcing tasks." *Information retrieval* 16.2 (2013): 121-137.

\ref{Buchholz2011} Buchholz, Sabine, and Javier Latorre. "Crowdsourcing preference tests, and how to detect cheating." *Twelfth Annual Conference of the International Speech Communication Association*. 2011.

### Beacon System 

"We build a large scale real world indoor localization system basede on iBeacon protocol. In building this system, we met the following pracitcal problems and address them with novel methods."

### NP-hard and Approximate Algorithm

[3] To improve *coRide’*s efficiency in mileage reduction, we formulate an NP-hard route calculation problem
under different practical constraints. We then provide (1) an optimal algorithm using Linear Programming, (2) a 2-approximation algorithm with a polynomial complexity, and (3) its corresponding online version with a linear complexity. 

[4] Many combinatorial optimization problems are NP hard, and there is no efficient general algorithm to solve this class of prob- lems in polynomial time. A typical approach is to use a heuristic algorithm to find an approximate solution. Commonly used meth- ods include hill-climbing methods, genetic algorithms, simulated annealing algorithms, etc. By balancing the accuracy and the per- formance, we choose a hill-climbing method to solve the problem.

### Difference with DARP

One of the major differences of our work compared with DARP related research is that large scale real world experiments are conducted and some practical problems are observed and solved.



### Ref.

[1] Wang, F., & Liu, J. (2009). Duty-cycle-aware broadcast in wireless sensor networks. In *IEEE INFOCOM* (pp. 468–476). https://doi.org/10.1109/INFCOM.2009.5061952

[2] Taş, D., Gendreau, M., Jabali, O., & Laporte, G. (2016). The traveling salesman problem with time-dependent service times. *European Journal of Operational Research*, *248*(2), 372–383. https://doi.org/10.1016/j.ejor.2015.07.048

[3] Zhang, D., He, T., Zhang, F. A. N., Lu, M., Liu, Y., Lee, H., & Son, S. H. (2016). Carpooling Service for Large-Scale Taxicab Networks. *ACM Transactions on Sensor Networks*, *12*(3), 1–35. https://doi.org/10.1145/2897517

[4] Zhang, L., Hu, T., Min, Y., Wu, G., Zhang, J., Feng, P., … Ye, J. (2017). A Taxi Order Dispatch Model based On Combinatorial Optimization. *ACM SIGKDD*, 2151–2159. https://doi.org/10.1145/3097983.3098138

[5] Xie, X., Zhang, F., & Zhang, D. (2018). PrivateHunt : Multi-Source Data-Driven Dispatching in For-Hire. In *ACM Ubicomp* (Vol. 2, pp. 1–26).

[6] Zheng, Y., Capra, L., Wolfson, O., & Yang, H. (2014). Urban Computing: Concepts, Methodologies, and Applications. *ACM Transactions on Intelligent Systems and Technology*, *5*(3), 1–55. https://doi.org/10.1145/2629592

\bibitem{Zheng2014} Zheng, Y., Capra, L., Wolfson, O., \& Yang, H. (2014). Urban Computing: Concepts, Methodologies, and Applications. ACM Transactions on Intelligent Systems and Technology, 5(3), 1–55. <https://doi.org/10.1145/2629592>

\bibitem{Singla2013} Singla, A., & Krause, A. (2013). Truthful incentives in crowdsourcing tasks using regret minimization mechanisms. *Proceedings of the 22nd International Conference on World Wide Web - WWW* ’*13*, 1167–1178. https://doi.org/10.1145/2488388.2488490