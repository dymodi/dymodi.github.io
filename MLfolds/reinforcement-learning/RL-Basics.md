---
layout: post
title: Reinforcement Learning Basics
date: Sep. 25, 2020
author: Yi DING
---

A long introduction to RL is presented [here](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html).

## Basic Concepts

The agent is acting in an **environment**. How the environment reacts to certain actions is defined by a **model** which we may or may not know. The model defines the reward function and transition probabilities.

* When **we know the model**, optimal solution can be achieved via dynamic programming.

* When we don't know the model, we can choose (1) learn the model explicitly; (2) do model-free RL.

The agent can stay in one of many **states** ($$s\in \mathcal S$$) of the environment, and choose to take one of many **actions** ($$a\in \mathcal A$$) to switch from one state to another. Which state the agent will arrive in is decided by transition probabilities between states ($$\mathcal P$$). Once an action is taken, the environment delivers a **reward** ($$r\in \mathcal R$$) as feedback [1].

The agent’s **policy** $$\pi (s)$$ provides the guideline on what is the optimal action to take in a certain state with <span style="color:red">**the goal to maximize the total rewards**</span>. A value function $$\mathcal {V}(s)$$ represents the expected objective value obtained following policy $$\pi$$ from each state in $$s$$. In other words, the value function quantifies how good a state is. Both policy and value functions are what we try to learn in reinforcement learning.

## Basic Components

**Value Function**

The future reward, also known as **return**, is a total sum of discounted rewards going forward. Let’s compute the return GtGt starting from time $$t$$:

$$G_t=R_{t+1}+\gamma R_{t+2}+\gamma^2R_{t+3}+ \cdots =\sum_{k=0}^{\infty}\gamma^kR_{t+k+1}$$

The **state-value** of a state s is the expected return if we are in this state at time $$t, \mathcal S=s$$ 

## Ref.

[1] Lilian Weng, **A (Long) Peek into Reinforcement Learning**, [Blog](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html).

