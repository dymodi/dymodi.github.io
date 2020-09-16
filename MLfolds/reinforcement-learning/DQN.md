---
layout: post
title:  Deep Q-Network (DQN)
date: Sep. 15, 2020
author: Yi DING
---

An Introduction to Deep Q-Network (DQN) can be found [here](https://medium.com/@jonathan_hui/rl-dqn-deep-q-network-e207751f7ae4). 

**Q-learning** learns the action-value function $Q(s, a)$: how good to take an *action* at a particular *state*. Q is called the action-value function.

DQN is an approximation of the classic Q-learning algorithm by a neural network.



The advantages of DQN is:

* Capable of handling high-dimensional sensory inputs (states). [1]



## Ref.

[1] Mnih, V., Kavukcuoglu, K., Silver, D., Rusu, A.A., Veness, J., Bellemare, M.G., Graves, A., Riedmiller, M., Fidjeland, A.K., Ostrovski, G. and Petersen, S., 2015. Human-level control through deep reinforcement learning. *nature*, *518*(7540), pp.529-533.

