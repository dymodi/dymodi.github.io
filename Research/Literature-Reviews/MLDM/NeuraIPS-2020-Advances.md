---
author: Yi DING
layout: post
title: NeuraIPS 2020 Advances
date: Nov. 12, 2020
---

Personal summary and notes based on a glance through all [2020 NeuraIPS papers](https://proceedings.neurips.cc/paper/2020).

**New Key Words**

* Coresets [Coresets-1, 2, 3 ];
  
  * Coreset is a small data-set that can represent the characteristics of the orginal large data-set.
* Agnostic Learning [Agnostic-1,2]
  
  * The core idea seems to be that the learning objective is hard to grasp. For example, label distribution unknown in test set.

**Related Applications (Transportation/Mobility/Sensor/IoT/Cyber-Physical-System/On-Device-Learning)**

* Vehicle Routing with RL. [Reinforcement-1]
* Traffic Light Control with RL. [Reinforcement-2]
* Dynamic Community Detection [Graph-5]
* Sensor Coordination [Reinforcement-4]
* MCUNet: Tiny Deep Learning on IoT Devices [IoT-1]
* STLnet: Signal Temporal Logic Enforced Multivariate RNN [Recurrent-1] (*John Stankovic's work*)
* On-Device Learning [IoT-2]

**Interesting Ideas**

* "Neural Networks Fail to Learn Periodic Functions and How to Fix It" [Activations-1]
* "Hateful Memes Challenge" [Challenge-1]
* "Play MOBA Games." [Reinforcement-2]
* "What is being transferred in transfer learning?." [Transfer-1]
* "Interior Point Solving for LP-based prediction+optimisation" [Math-1]
* "Learning from Aggregate Observations"(*single lable for multiple instances*) [Aggregate-1]

**Advances in Existing Field**

* Graph Learning.
  * Pointer Graph Networks (PGN) [Graph-1]
  * Natural Graph Networks [Graph-2]
  * Hierarchical Graph [Graph-3]
  * Graph Meta Learning via Local Subgraphs [Graph-4]
  * Subgraph Neural Networks [Graph-6]
  * Robust Aggregation [Graph-7]
  * Random Walk Graph Neural Networks [Graph-8]
  * [Open Graph Benchmark](https://ogb.stanford.edu/) [Graph-9]
* Autoencoder
  * Variational Autoencoder: the encoded variable is not a value but a probability. [VAE-1,2]
* BERT
  * Dynamic BERT with Adaptive Width and Depth [BERT-1]

**Key Works** (occurrences calculated from [text analyzer](https://www.online-utility.org/text/analyzer.jsp) of paper titles)

* Neural Network(s) (143)
* Reinforcement Learning (94)
* Deep Learning (33)
* Meta Learning (29)
* Graph Neural Networks (26)
* Deep Neural Networks (23)
* Representation Learning (20)
* Optimal Transport (16)
* Contrastive Learning (16)
* Semi-Supervised (14)



## Ref.

[Activations-1] Ziyin, Liu, Tilman Hartwig, and Masahito Ueda. "Neural Networks Fail to Learn Periodic Functions and How to Fix It." Advances in Neural Information Processing Systems 33 (2020).

[Aggregate-1] Zhang, Yivan, Nontawat Charoenphakdee, Zhenguo Wu, and Masashi Sugiyama. "Learning from Aggregate Observations." *arXiv preprint arXiv:2004.06316* (2020).

[Agnostic-1] Cortes, Corinna, Mehryar Mohri, Javier Gonzalvo, and Dmitry Storcheus. "Agnostic Learning with Multiple Objectives." *Advances in Neural Information Processing Systems* 33 (2020).

[Agnostic-2] Natesan Ramamurthy, Karthikeyan, Bhanukiran Vinzamuri, Yunfeng Zhang, and Amit Dhurandhar. "Model Agnostic Multilevel Explanations." *Advances in Neural Information Processing Systems* 33 (2020).

[BERT-1] Hou, Lu, Zhiqi Huang, Lifeng Shang, Xin Jiang, Xiao Chen, and Qun Liu. "Dynabert: Dynamic bert with adaptive width and depth." *Advances in Neural Information Processing Systems* 33 (2020).

[Challenge-1] Kiela, Douwe, Hamed Firooz, Aravind Mohan, Vedanuj Goswami, Amanpreet Singh, Pratik Ringshia, and Davide Testuggine. "The Hateful Memes Challenge: Detecting Hate Speech in Multimodal Memes." *arXiv preprint arXiv:2005.04790* (2020).

[Coresets-1] Manousakas, Dionysis, Zuheng Xu, Cecilia Mascolo, and Trevor Campbell. "Bayesian Pseudocoresets." *Advances in Neural Information Processing Systems* 33 (2020).

[Coresets-2] Mirzasoleiman, Baharan, Kaidi Cao, and Jure Leskovec. "Coresets for Robust Training of Deep Neural Networks against Noisy Labels." *Advances in Neural Information Processing Systems* 33 (2020).

[Coresets-3] Huang, Lingxiao, K. Sudhir, and Nisheeth Vishnoi. "Coresets for Regressions with Panel Data." *Advances in Neural Information Processing Systems* 33 (2020).

[Graph-1] Velickovic, Petar, Lars Buesing, Matthew C. Overlan, Razvan Pascanu, Oriol Vinyals, and Charles Blundell. "Pointer graph networks." *stat* 1050 (2020): 11.

[Graph-2] de Haan, Pim, Taco S. Cohen, and Max Welling. "Natural graph networks." *Advances in Neural Information Processing Systems* 33 (2020).

[Graph-3] Elmahdy, Adel, Junhyung Ahn, Changho Suh, and Soheil Mohajer. "Matrix Completion with Hierarchical Graph Side Information." *Advances in Neural Information Processing Systems* 33 (2020).

[Graph-4] Huang, Kexin, and Marinka Zitnik. "Graph Meta Learning via Local Subgraphs." *Advances in Neural Information Processing Systems* 33 (2020).

[Graph-5] Dall'Amico, Lorenzo, Romain Couillet, and Nicolas Tremblay. "Community detection in sparse time-evolving graphs with a dynamical Bethe-Hessian." *arXiv preprint arXiv:2006.04510* (2020).

[Graph-6] Alsentzer, Emily, Samuel Finlayson, Michelle Li, and Marinka Zitnik. "Subgraph neural networks." *Advances in Neural Information Processing Systems* 33 (2020).

[Graph-7] Geisler, Simon, Daniel Zügner, and Stephan Günnemann. "Reliable Graph Neural Networks via Robust Aggregation." *Advances in Neural Information Processing Systems* 33 (2020).

[Graph-8] Nikolentzos, Giannis, and Michalis Vazirgiannis. "Random Walk Graph Neural Networks." *Advances in Neural Information Processing Systems* 33 (2020).

[Graph-9] Hu, Weihua, Matthias Fey, Marinka Zitnik, Yuxiao Dong, Hongyu Ren, Bowen Liu, Michele Catasta, and Jure Leskovec. "Open graph benchmark: Datasets for machine learning on graphs." *arXiv preprint arXiv:2005.00687* (2020).

[IoT-1] Lin, Ji, Wei-Ming Chen, Yujun Lin, Chuang Gan, and Song Han. "Mcunet: Tiny deep learning on iot devices." *Advances in Neural Information Processing Systems* 33 (2020).

[IoT-2] Bistritz, Ilai, Ariana Mann, and Nicholas Bambos. "Distributed Distillation for On-Device Learning." *Advances in Neural Information Processing Systems* 33 (2020).

[Math-1] Mandi, Jayanta, and Tias Guns. "Interior Point Solving for LP-based prediction+ optimisation." *Advances in Neural Information Processing Systems* 33 (2020).

[Reinforcement-1] Delarue, Arthur, Ross Anderson, and Christian Tjandraatmadja. "Reinforcement Learning with Combinatorial Actions: An Application to Vehicle Routing." *Advances in Neural Information Processing Systems* 33 (2020).

[Reinforcement-2] Ye, Deheng, Guibin Chen, Wen Zhang, Bo Yuan, Bo Liu, Jia Chen, Zhao Liu et al. "Towards Playing Full MOBA Games with Deep Reinforcement Learning." *Advances in Neural Information Processing Systems* 33 (2020).

[Reinforcement-3] Oroojlooy, Afshin, Mohammadreza Nazari, Davood Hajinezhad, and Jorge Silva. "AttendLight: Universal Attention-Based Reinforcement Learning Model for Traffic Signal Control." *Advances in Neural Information Processing Systems* 33 (2020).

[Reinforcement-4] Xu, Jing, Fangwei Zhong, and Yizhou Wang. "Learning Multi-Agent Coordination for Enhancing Target Coverage in Directional Sensor Networks." *Advances in Neural Information Processing Systems* 33 (2020).

[Recurrent-1] Ma, Meiyi, Ji Gao, Lu Feng, and John Stankovic. "STLnet: Signal Temporal Logic Enforced Multivariate Recurrent Neural Networks." *Advances in Neural Information Processing Systems* 33 (2020).

[Transfer-1] Neyshabur, Behnam, Hanie Sedghi, and Chiyuan Zhang. "What is being transferred in transfer learning?." *Advances in Neural Information Processing Systems* 33 (2020).

[VAE-1] Cemgil, Taylan, Sumedh Ghaisas, Krishnamurthy Dvijotham, Sven Gowal, and Pushmeet Kohli. "The Autoencoding Variational Autoencoder." Advances in Neural Information Processing Systems 33 (2020).

[VAE-2] Vahdat, Arash, and Jan Kautz. "Nvae: A deep hierarchical variational autoencoder." *Advances in Neural Information Processing Systems* 33 (2020).

