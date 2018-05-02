---
layout: post
title: Semi-Supervised Methods
date: May. 2, 2018
author: Yi DING
---

## Self-training

According to [1], **self-training** is a wrapper-algorithm that repeatedly uses a supervised learning method in the following manner. A supervised classifier is first trained with a small amount of labeled data. The classifier is then used to classify the un-labeled data. In each iteration, a part of the unlabeled data is labeled according to a current decision function. Typically, the most confident predictions are added to the labeled train-ing set. The classifier is then re-trained and the self-training procedure is repeated.



## Co-training



## Active Learning

According to [1], active learning aims at detecting the most informative unlabeled samples and queries a user to label them.



## Ref

[1] Stikic, M., Van Laerhoven, K., & Schiele, B. (2008, September). **Exploring semi-supervised and active learning for activity recognition**. In *Wearable computers, 2008. ISWC 2008. 12th IEEE international symposium on* (pp. 81-88). IEEE.