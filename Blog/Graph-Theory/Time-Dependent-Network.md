---
layout: post
title: Time Dependent Network
date: July. 4, 2018
author: Yi DING
---

According to [1], Time-Dependent Networks (TDN) are used to model situations in which the cost of traversing an edge varies with time. While the general framework has many applications, the everyday problem of route planning on road networks is easily the most compelling.

## Model
We consider a bidirected network $$G( V, E, D)$$, with $$V = \{1, 2, . . . , n\}$$ being the set of nodes, $$E \subseteq V \times V$$ the set of links (with $$(i, k) \in E$$ implying $$(k, i) \in E$$), and $$D=\{d_{ik}(t) | (i, k) \in E\}$$ a set of time-dependent link delays, that is, $$d_{rk}(t)$$ is a strictly positive function of time defined for $$[0, ~0)$$ that describes the delay of a message over link $$(i, k)$$ at time $$t$$. 

## Ref

[1] Foschini, L., Hershberger, J., & Suri, S. (2011, January). On the complexity of time-dependent shortest paths. In *Proceedings of the twenty-second annual ACM-SIAM symposium on Discrete algorithms* (pp. 327-341). Society for Industrial and Applied Mathematics.