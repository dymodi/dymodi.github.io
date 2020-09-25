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
  * **Constrained RL**: for problems with conflicting requirements.
  * **Hierarchical RL**: for long-horizon problems with sparse and delayed rewards.
  * 
  * 
  * Network pruning (in case of long train time)
  * Model transfer
  * Adaptive time step length

**Individual Papers**

* Human-level control through deep reinforcement learning, *Nature 2015 DQN*
  * Taxonomy: Game play, Single-agent, DQN
  * Contributions: DQN.
* Constrained Reinforcement Learning Has Zero Duality Gap, *NeuraIPS 2019 Constrained*
  * Contributions: Theoretical support for solving constrained RL with primal-dual methods.
* Hierarchical RL with Advantage-Based Auxiliary Rewards, *NeuraIPS 2019 Hierarchical*
  * Contributions: Auxiliary rewards for low-level skill training based on the advantage function of the high-level policy in HRL.
* Multi-View Reinforcement Learning, *NeuraIPS 2019 Multi-View*
  * Contributions: Agents share common dynamics but adhere to different observation models.
* Regret Minimization for RL with Vectorial Feedback and Complex Objectives, *NeuraIPS 2019 Regret*
  * Contributions: Regret Minimization for RL with Vectorial Feedback (Reward)
* A Structured Prediction Approach for Generalization in Cooperative Multi-Agent RL, *NeuraIPS 2019 Structured*
  * Opportunity: Intrinsic notion of locality (e.g., geographic proximity) such that interactions between agents and tasks are locally limited in multi-agent RL.
  * Contributions: A novel structured prediction approach to assign agents to tasks.
  * Applications: Game play.

## Ref.

[Nature-2015-DQN] Mnih, Volodymyr, Koray Kavukcuoglu, David Silver, Andrei A. Rusu, Joel Veness, Marc G. Bellemare, Alex Graves et al. "**Human-level control through deep reinforcement learning**." *nature* 518, no. 7540 (2015): 529-533.

[NeuraIPS-2019-Constrained] Paternain, Santiago, Luiz Chamon, Miguel Calvo-Fullana, and Alejandro Ribeiro. "**Constrained reinforcement learning has zero duality gap**." In *Advances in Neural Information Processing Systems*, pp. 7555-7565. 2019.

[NeuraIPS-2019-Hierarchical] Li, Siyuan, Rui Wang, Minxue Tang, and Chongjie Zhang. "**Hierarchical Reinforcement Learning with Advantage-Based Auxiliary Rewards.**" In *Advances in Neural Information Processing Systems*, pp. 1409-1419. 2019.

[NeuraIPS-2019-Multi-view] Li, Minne, Lisheng Wu, W. A. N. G. Jun, and Haitham Bou Ammar. "**Multi-view reinforcement learning**." In *Advances in neural information processing systems*, pp. 1420-1431. 2019.

[NeuraIPS-2019-Regret] Cheung, Wang Chi. "**Regret Minimization for Reinforcement Learning with Vectorial Feedback and Complex Objectives.**" In *Advances in Neural Information Processing Systems*, pp. 726-736. 2019.

[NeuraIPS-2019-Structured] Carion, Nicolas, Nicolas Usunier, Gabriel Synnaeve, and Alessandro Lazaric. "**A structured prediction approach for generalization in cooperative multi-agent reinforcement learning**." In *Advances in Neural Information Processing Systems*, pp. 8130-8140. 2019.

