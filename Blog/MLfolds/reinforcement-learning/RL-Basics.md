---
layout: single
title: "Reinforcement Learning Basics"
permalink: /blog/MLfolds/reinforcement-learning/RL-Basics/
classes: wide
author_profile: true
use_math: true
date: 20/9/25
---

A long introduction to RL is presented [here](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html), I select and modifed some content here in the following.

## Basic Concepts

The agent is acting in an **environment**. How the environment reacts to certain actions is defined by a **model** which we may or may not know. The model defines the reward function and transition probabilities.

* When **we know the model**, optimal solution can be achieved via dynamic programming.

* When we don't know the model, we can choose (1) learn the model explicitly; (2) do model-free RL.

The agent can stay in one of many **states** ($$s\in \mathcal S$$) of the environment, and choose to take one of many **actions** ($$a\in \mathcal A$$) to switch from one state to another. Which state the agent will arrive in is decided by transition probabilities between states ($$\mathcal P$$). Once an action is taken, the environment delivers a **reward** ($$r\in \mathcal R$$) as feedback [1].

The agent’s **policy** $$\pi (s)$$ provides the guideline on what is the optimal action to take in a certain state with <span style="color:red">**the goal to maximize the total rewards**</span>. A value function $$V(s)$$ represents the expected objective value obtained following policy $$\pi$$ from each state in $$s$$. In other words, the value function quantifies how good a state is. Both policy and value functions are what we try to learn in reinforcement learning.

## Basic Components

**Value Function**

The future reward, also known as **return**, is a total sum of discounted rewards going forward. 

$$G_t=R_{t+1}+\gamma R_{t+2}+\gamma^2R_{t+3}+ \cdots =\sum_{k=0}^{\infty}\gamma^kR_{t+k+1}$$

The **state-value** of a state s is the expected return if we are in this state at time $$t, \mathcal S=s$$ 

$$V_{\pi}(s) = \mathbb{E}_{\pi}[G_t \vert S_t = s]$$

Similarly, we define the **action-value** (“Q-value”) of a state-action pair as:

$$Q_{\pi}(s, a) = \mathbb{E}_{\pi}[G_t \vert S_t = s, A_t = a]$$

The difference between action-value and state-value is the action **advantage** function (“A-value”):

$$A_{\pi}(s, a) = Q_{\pi}(s, a) - V_{\pi}(s)$$

## Approaches

### Dynamic Programming

When the model is fully known, following Bellman equations, we can use Dynamic Programming to iteratively evaluate value functions and improve policy.

### Monte-Carlo Methods

Monte-Carlo (MC) methods use a simple idea: It learns from episodes of raw experience without modeling the environmental dynamics. MC use the observed mean return as an approximation of the expected return. To compute the empirical return $$G_t$$, MC methods need to learn from **complete** episodes $$S_1, A_1, R_2, \dots, S_T$$, and all the episodes must eventually terminate.

### Temporal-Difference Learning

Similar to Monte-Carlo methods, Temporal-Difference (TD) Learning is model-free and learns from episodes of experience. However, TD learning can learn from **incomplete** episodes and hence we don’t need to track the episode up to termination. 

**SARSA**

**Q-Learning**

**Deep Q-Network (DQN)**

### Policy Gradient

All the above methods aim to learn the state/action value function and then to select actions accordingly (with maximum $$G_t$$). Policy Gradient methods instead learn the policy directly with a parameterized function respect to $$\theta$$, $$\pi(a \vert s; \theta)$$.

**Actor-Critic**

If the value function is learned in addition to the policy, we would get Actor-Critic algorithm.

- **Critic**: updates value function parameters w and depending on the algorithm it could be action-value $$Q(a \vert s; w)$$ or state-value $$V(s; w)$$.
- **Actor**: updates policy parameters θ, in the direction suggested by the critic, $$\pi(a \vert s; \theta)$$.

## Ref.

[1] Lilian Weng, **A (Long) Peek into Reinforcement Learning**, [Blog](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html).

