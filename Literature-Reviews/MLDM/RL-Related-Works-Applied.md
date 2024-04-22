---
author: Yi DING
layout: post
title: Related Works of Reinforcement Learning (Applied)
permalink: /Literature-Reviews/MLDM/Related-Works-of-Reinforcement-Learning-Applied/
date: Sep. 24, 2020
---

**Key Words:** Reinforcement Learning

**Taxonomy**

* **Applications**: Game play / Traffic Light Control / Fleet mangement / Order Dispatch / Bike Reposition / Community Detection / Metro Network Expansion / Paraphrasing / Search Aggregation / User Profiling
* Single-agent / Multi-agent
* Basic algorithms: MDP / DQN / Actor-Critic / Hierarchical RL
* With Simulator / No Simulator

**Comments**

* Applied track contains paper from KDD, WWW.
* Possible variations:

**Individual Papers**

* IntelliLight, *[KDD-2018-Intellilight]*
  * Taxonomy: Traffic Light Control, 
  * Contributions: (1) Real-world data; (2) Policy interpretations; (3) New learning method (phase-gated);
* Efficient Large-Scale Fleet Management, *[KDD-2018-Didi-Fleet-Management]*
  * Taxonomy: Fleet mangement, Multi-agent, DQN & Actor-Critic, With simulator
  * Contributions: (1) Proper design of agent, reward and state; (2) Contextual multi-agent RL framework is proposed based on both DQN and Actor-Critic; (3) Simulator developed; 
* Order Dispatch in On-Demand Ride-Hailing Platforms, *[KDD-2018-Didi-Order-Dispatch]*
  * Taxonomy: Order Dispatch, Multi-agent, MDP, With simulator
  * Contribution: (1) New order dispatch algorithm that optimizes long-term platform efficiency (instant passenger satisfaction + the expected future gain); (2) Problem formulation (one of first work for RL in large-scale real-time systems); (3) Practical issues considered (computational efficiency).
* Dynamic Bike Reposition, *[KDD-2018-Bike-Reposition]*
  * Taxonomy: Bike Reposition, Multi-agent, DQN, With simulator
  * Contribution: (1) New clustering algorithm; (2) Simulator; (3) A Spatial-Temporal RL model (new state, DQN); (4) Real-world data;
* Efficient and Effective Express, *[KDD-2019-JD]*
  * Taxonomy: Order Dispatch, Multi-agent ,With Simulator, (Cooperative) DQN
  * Contribution: (1) City partition; (2) New clustering algorithm; (3) New RL model (Contextual Cooperative RL); (4) Real-world data;
* Spatio-Temporal Capsule-based RL for Mobility-on-Demand Network Coordination, *[WWW-2019-Order-Dispatch]*
  * Taxonomy: Order Dispatch, Single-agent, No Simulator (?), DQN
  * Contribution: (1) ST-RL formulation; (2) ST capsule NN;
* Aggregating E-commerce Search Results from Heterogeneous Sources via Hierarchical RL, *[WWW-2019-Search-Aggregation]*
  * Taxonomy: Search Aggregation, Hierarchical RL
  * Contribution: (1) Hierarchical RL formulation; 
* Learning Heuristics for Community Detection with GAN, *[KDD-2020-Community-Detection]*
  * Taxonomy: Community Detection
* City Metro Network Expansion with Reinforcement Learning, *[KDD-2020-Metro-Expansion]*
  * Taxonomy: Metro Network Expansion, 
  * Contributions: (1) Incorporate social equity concernsl; (2) Formulate metro network expansion as a RL problem; (2) Real-world data;
* Unsupervised Paraphrasing via Deep Reinforcement Learning, *[KDD-2020-Paraphrasing]*
  * Taxonomy: Paraphrasing
* Incremental Mobile User Profiling, *[KDD-2020-User-Profiling]*
  * Taxonomy: User Profiling
  * Contributions: (1) New criteria for evaluating user profiling accuracy; (2) RL formulation; (3) RL+Knowledge Grahp; (4) Real-world data; (5) Generalization;

## Ref.

[KDD-2018-Intellilight] Wei, Hua, Guanjie Zheng, Huaxiu Yao, and Zhenhui Li. "**Intellilight: A reinforcement learning approach for intelligent traffic light control**." In *Proceedings of the 24th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*, pp. 2496-2505. 2018.

[KDD-2018-Didi-Fleet-Management] Lin, Kaixiang, Renyu Zhao, Zhe Xu, and Jiayu Zhou. "**Efficient large-scale fleet management via multi-agent deep reinforcement learning**." In *Proceedings of the 24th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*, pp. 1774-1783. 2018.

[KDD-2018-Didi-Order-Dispatch] Xu, Zhe, Zhixin Li, Qingwen Guan, Dingshui Zhang, Qiang Li, Junxiao Nan, Chunyang Liu, Wei Bian, and Jieping Ye. "**Large-scale order dispatch in on-demand ride-hailing platforms: A learning and planning approach.**" In *Proceedings of the 24th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*, pp. 905-913. 2018.

[KDD-2018-Bike-Reposition] Li, Yexin, Yu Zheng, and Qiang Yang. "**Dynamic bike reposition: A spatio-temporal reinforcement learning approach.**" In *Proceedings of the 24th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*, pp. 1724-1733. 2018.

[KDD-2019-JD] Li, Yexin, Yu Zheng, and Qiang Yang. "**Efficient and Effective Express via Contextual Cooperative Reinforcement Learning**." In *Proceedings of the 25th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*, pp. 510-519. 2019.

[WWW-2019-Order-Dispatch] He, Suining, and Kang G. Shin. "**Spatio-temporal capsule-based reinforcement learning for mobility-on-demand network coordination.**" In *The World Wide Web Conference*, pp. 2806-2813. 2019.

[WWW-2019-Search-Aggregation] Takanobu, Ryuichi, Tao Zhuang, Minlie Huang, Jun Feng, Haihong Tang, and Bo Zheng. "**Aggregating e-commerce search results from heterogeneous sources via hierarchical reinforcement learning**." In *The World Wide Web Conference*, pp. 1771-1781. 2019.

[KDD-2020-Community-Detection] Zhang, Yao, Yun Xiong, Yun Ye, Tengfei Liu, Weiqiang Wang, Yangyong Zhu, and Philip S. Yu. "**SEAL: Learning Heuristics for Community Detection with Generative Adversarial Networks.**" In *Proceedings of the 26th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*, pp. 1103-1113. 2020.

[KDD-2020-Metro-Expansion] Wei, Yu, Minjia Mao, Xi Zhao, Jianhua Zou, and Ping An. "**City Metro Network Expansion with Reinforcement Learning**." In *Proceedings of the 26th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*, pp. 2646-2656. 2020.

[KDD-2020-Paraphrasing] Siddique, A. B., Samet Oymak, and Vagelis Hristidis. "**Unsupervised Paraphrasing via Deep Reinforcement Learning.**" In *Proceedings of the 26th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*, pp. 1800-1809. 2020.

[KDD-2020-User-Profiling] Wang, Pengyang, Kunpeng Liu, Lu Jiang, Xiaolin Li, and Yanjie Fu. "**Incremental Mobile User Profiling: Reinforcement Learning with Spatial Knowledge Graph for Modeling Event Streams**." In *Proceedings of the 26th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*, pp. 853-861. 2020.