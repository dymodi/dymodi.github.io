---
author: Yi DING
layout: post
title: Related Works of Reinforcement Learning (Theoretic)
date: Sep. 25, 2020
---

**Key Words:** Reinforcement Learning

**Taxonomy**

**Comments**

* Theoretic track contains work from Nature and NeuraIPS
* Possible variations: 
  * **Multi-Agent RL**: 
    * Challenges: Generating diversified behaviors for each individual agent when receiving only a team reward. 
  * **Constrained RL**: for problems with conflicting requirements.[NeuraIPS-2019-Constrained, NeuraIPS-2019-Convex-Constraints]
  * **Hierarchical RL**: for long-horizon problems with sparse and delayed rewards.
  * **Multi-Objective RL**: for problem with multiple competing objectives whose relative importance is unknown.
    * Strengths:  Alleviates dependence on scalar reward design.
    * Weaknesses: The epected return of a policy can change significantly with varying preferences, making it challenging to learn a single model to produce optimal policies under different preference conditions
  * **Multi-View RL**: for agents share common dynamics but adhere to different observation models.
  * 
  * Network pruning (in case of long train time)
  * Model transfer
  * Adaptive time step length
* Problem features and corrpesonding solutions:
  * Multiple objectives: as 

**Individual Papers**

* Human-level control through deep reinforcement learning, *Nature 2015 DQN*
  * Taxonomy: Game play, Single-agent, DQN
  * Contributions: DQN.
* Common Knowledge Reinforcement Learning, *NeuraIPS 2019 Common Knowledge*
  * Contributions: A hierarchical policy tree for different groups of agents with condition common knowledge.
* Constrained Reinforcement Learning Has Zero Duality Gap, *NeuraIPS 2019 Constrained*
  * Contributions: Theoretical support for solving constrained RL with primal-dual methods.
* Generalized Algorithm for Multi-Objective RL, *NeurIPS-2019-Multi-Objective*
  * Contributions: A generalized version of the Bellman equation to learn a single parametric representation for optimal policies over the space of all possible preferences.
* Hierarchical RL with Advantage-Based Auxiliary Rewards, *NeuraIPS 2019 Hierarchical*
  * Contributions: Auxiliary rewards for low-level skill training based on the advantage function of the high-level policy in HRL.
* Interval timing in deep reinforcement learning agents
  * Contributions: Understanding how RL represents time.
* Multi-View Reinforcement Learning, *NeuraIPS 2019 Multi-View*
  * Contributions: Agents share common dynamics but adhere to different observation models.
* Regret Minimization for RL with Vectorial Feedback and Complex Objectives, *NeuraIPS 2019 Regret*
  * Contributions: Regret Minimization for RL with Vectorial Feedback (Reward)
* RL with Convex Constraints: *NeuraIPS 2019 Convex Constraints*
  * Contributions: An algorithmic scheme that can handle a wide class of constraints in RL tasks.
* Structured Prediction Approach for Generalization in Cooperative Multi-Agent RL, *NeuraIPS 2019 Structured*
  * Opportunity: Intrinsic notion of locality (e.g., geographic proximity) such that interactions between agents and tasks are locally limited in multi-agent RL.
  * Contributions: A novel structured prediction approach to assign agents to tasks.
  * Applications: Game play.

## Ref.

[Nature-2015-DQN] Mnih, Volodymyr, Koray Kavukcuoglu, David Silver, Andrei A. Rusu, Joel Veness, Marc G. Bellemare, Alex Graves et al. "**Human-level control through deep reinforcement learning**." *nature* 518, no. 7540 (2015): 529-533.

[NeuraIPS-2019-Common-Knowledge] de Witt, Christian Schroeder, Jakob Foerster, Gregory Farquhar, Philip Torr, Wendelin Boehmer, and Shimon Whiteson. "**Multi-agent common knowledge reinforcement learning**." In *Advances in Neural Information Processing Systems*, pp. 9927-9939. 2019.

[NeuraIPS-2019-Constrained] Paternain, Santiago, Luiz Chamon, Miguel Calvo-Fullana, and Alejandro Ribeiro. "**Constrained reinforcement learning has zero duality gap**." In *Advances in Neural Information Processing Systems*, pp. 7555-7565. 2019.

[NeuraIPS-2019-Convex-Constraints] Miryoosefi, Sobhan, Kianté Brantley, Hal Daume III, Miro Dudik, and Robert E. Schapire. "Reinforcement learning with convex constraints." In *Advances in Neural Information Processing Systems*, pp. 14093-14102. 2019.

[NeuraIPS-2019-Hierarchical] Li, Siyuan, Rui Wang, Minxue Tang, and Chongjie Zhang. "**Hierarchical Reinforcement Learning with Advantage-Based Auxiliary Rewards.**" In *Advances in Neural Information Processing Systems*, pp. 1409-1419. 2019.

[NeurIPS-2019-Multi-Objective] Yang, Runzhe, Xingyuan Sun, and Karthik Narasimhan. "**A generalized algorithm for multi-objective reinforcement learning and policy adaptation**." In Advances in Neural Information Processing Systems, pp. 14636-14647. 2019.

[NeuraIPS-2019-Multi-View] Li, Minne, Lisheng Wu, W. A. N. G. Jun, and Haitham Bou Ammar. "**Multi-view reinforcement learning**." In *Advances in neural information processing systems*, pp. 1420-1431. 2019.

[NeuraIPS-2019-Regret] Cheung, Wang Chi. "**Regret Minimization for Reinforcement Learning with Vectorial Feedback and Complex Objectives.**" In *Advances in Neural Information Processing Systems*, pp. 726-736. 2019.

[NeuraIPS-2019-Structured] Carion, Nicolas, Nicolas Usunier, Gabriel Synnaeve, and Alessandro Lazaric. "**A structured prediction approach for generalization in cooperative multi-agent reinforcement learning**." In *Advances in Neural Information Processing Systems*, pp. 8130-8140. 2019.

[NeruaIPS-2019-Timing] Deverett, Ben, Ryan Faulkner, Meire Fortunato, Gregory Wayne, and Joel Z. Leibo. "**Interval timing in deep reinforcement learning agents**." In *Advances in Neural Information Processing Systems*, pp. 6689-6698. 2019.

