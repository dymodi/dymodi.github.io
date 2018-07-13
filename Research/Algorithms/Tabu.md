---
layout: post
title: Tabu Search
date: July 11, 2018
author: Yi DING
---

Tabu Search is a meta-heuristic that guides a local heuristic search procedure to explore the solution space beyond local optimality [1].

A very impressive [introduction of Tabu search](https://www.coursera.org/lecture/discrete-optimization/ls-8-iterated-location-search-metropolis-heuristic-simulated-annealing-tabu-BtJDc) (and other discrete optimization methods) are provided by Prof. Pascal Van Hentenryck.

In tabu search, each solution $$x$$ has an associated neighborhood $$N(x)\sub X$$ , and each solution $$x'\in N(x)$$ is reached from $$x$$ by an operation called a *move*.

* Cost function $$f(x)$$

* Initialization

* Short-Term Memory

* Long-Term Memory

  * Intensification: Store high-quality solutions and return to them periodically
  * Diversification: When the search is not producing improvement, make a big change of the current state.
  * Strategic oscillation: change the precentage of time spent in the feasible and infeasible regions.

* Aspiration

  * Sometimes one configuration is so good that even it is in the tabu list but we still want to accept it, we can use a technique called "aspiration" to take some extremely good configuration outside the tabu list.

  



The basic idea is to maintain a tabu list to avoid circulating around local minima by putting the previous steps in the tabu list.

One major problem is that sometime it is too costly to maintain all the visiting history hence a improvement is to maintain a short-term memory and only keep recent visits.

While sometimes it is still not efficient to keep the whole configuration (the whole $$x$$), then we can only keep the abstraction of the previous configurations. For example, we can only keep the swap operations in the when $$x$$ is a sequence.



### Ref

[1] Glover, F., & Martí, R. (1986). Tabu Search. *Tabu Search*, 1–16.

