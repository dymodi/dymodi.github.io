---
layout: post
title: Reinforcement Learning Basics
date: Sep. 25, 2020
author: Yi DING
---

A long introduction to RL is presented [here](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html).

## Basic Concepts

The agent is acting in an **environment**. How the environment reacts to certain actions is defined by a **model** which we may or may not know. The agent can stay in one of many **states** ($$s\in \mathcal S$$) of the environment, and choose to take one of many **actions** (a\in \mathcal A) to switch from one state to another. Which state the agent will arrive in is decided by transition probabilities between states (\mathcal P). Once an action is taken, the environment delivers a **reward** (r\in \mathcal R) as feedback [1].

The model defines the reward function and transition probabilities.

When **we know the model**, optimal solution can be achieved via dynamic programming.

When we don't know the model, we can choose (1) learn the model explicitly; (2) do model-free RL.

## Basic Components





**Agent**

**State**

**Action**

**Reward**



## Ref.

[1] Lilian Weng, **A (Long) Peek into Reinforcement Learning**, [Blog](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html).

