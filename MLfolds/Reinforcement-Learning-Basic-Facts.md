--- 
layout: post
comments: true
title: Basic Facts on Reinforcement Learning
date: Oct. 20, 2017
author: Yi DING
---

This is a post that summarizes some basic facts on reinforcement learning. The materials comes from [Sergey Levine's Course at Berkeley](http://rll.berkeley.edu/deeprlcourse/) and ...

## Basic Concepts (Lecture 1)
Reinforcement Learning (RL):
* Agent makes **actions**(**decision**) to the environment.
* Agent gets **observations** and **rewards** as the concequences of its **actions**.

Deep Learning:
* Usually refers to multi-layer neural network.
* Provide **end to end** learning (not manually pipeline).

Characteristics:
* No direct supervision
* Actions have consequences
* Attempting, try and gather errors.

The reinforcement learning problem **is** the AI problem!

When should we formulate the problem as a RL problem depends on whether we should worry abou the sequential decision making. Typical applications are: robotics, autonomous driving, language, business operations and finance.

##  (Lecture 2)
Terminology & Notation:

$$s_t$$ - state

$$o_t$$ - observation

$$a_t$$ - action

$$\pi_\theta(a_t\|o_t)$$ - policy

$$\pi_\theta(a_t\|s_t)$$ - policy (fully observed)


**Comments:**
It seems that the RL problem is highly like a **control** problem where we have a "time step" and a "feedback" from outputs of the controlled system.

Also note that the state and action here are the same as $$x_t$$ and $$u_t$$ in optimal control.


