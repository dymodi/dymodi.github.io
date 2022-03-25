---
layout: single
title: "Markov Decision Processes"
permalink: /blog/MLfolds/deep-learning/Markov-Decision-Processes/
classes: wide
author_profile: true
use_math: true
date: 18/11/12
---

An Introduction to Markov Decision Processes (MDP) can be found [here](https://www.cs.rice.edu/~vardi/dag01/givan1.pdf) and [here](https://towardsdatascience.com/reinforcement-learning-demystified-markov-decision-processes-part-1-bf00dda41690). MDP is the baisc and kernel of reinforcement learning. If you know something about control theory, you may find it is a typical control problem with control object, states, input, output.

MDP is usually used to solve the following problems:

* Decision making problem (routing, dispatching)
* ?



**Python Libraries**

?



**Definition**

A Markov Decision Process (MDP) model contains:

* A set of possible world states $$S$$
* A set of possible actions $$A$$
* A real valued reward function $$R(s,a)$$ 
* A description (model) $$T$$ of each action’s effects in each state.

**Representing Actions**

Deterministic Actions: $$T:S\times A\to S$$

Stochastic Actions: $$T:S\times A\to \text{Prob}(S)$$

**Representing Solutions**

A policy $$\pi$$ is a mapping from $$S$$ to $$A$$

**Value Functions**

A value function $$V_{\pi}:S\to\mathfrak R$$ represents the expected objective value obtained following policy $$\pi$$ from each state in $$S$$.

**Observability**

When we assume the full observability, the new state resulting from executing an action will be known to the system.

**Evaluating a Policy**

Given discount factor $$\gamma$$, we want to maximize the total reward

$$G_t=R_{t+1}+\gamma R_{t+2}+\gamma^2R_{t+3}+ \cdots =\sum_{k=0}^{\infty}\gamma^kR_{t+k+1}$$

