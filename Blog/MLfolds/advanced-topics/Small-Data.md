---
layout: single
title: "Small Data"
permalink: /blog/MLfolds/advanced-topics/Small-Data/
classes: wide
author_profile: true
use_math: true
date: 21/2/22
---

In some cases, a large amount of labeled data is unavailable. Therefore, some methods are proposed to solve the "small data" machine learning problems.

## Few-Shot Learning

Few-shot learning tries to let the model classify new data that has seen only a few training samples. An extreme example is "one-shot" learning.

* Data-level approaches: Data augmentation, GAN;
* Parameter-level approaches:  Regularization techniques, Meta-learning

### Meta-Learning

A good tutorial can be found [here](https://www.borealisai.com/en/blog/tutorial-2-few-shot-learning-and-meta-learning-i/).

In meta-learning, we use the knowledge from other ***unrelated*** (but similar?) models and tasks to help learn our model. The key idea is since different tasks (training and testing set, e.g., cat/dog, tree/car)  are fed to the model (network), the model must learn how to classify different categories generally, instead of differentiating specific categories.

The approaches for meta-learning mainly rely on the utilization of prior knowledge either on similarity, learning, or data.

