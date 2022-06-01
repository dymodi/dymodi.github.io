---
layout: single
title: "Hyperparameter Tuning on UCI Human Activity Example"
permalink: /blog/MLfolds/deep-learning/hyperpara-tuning-on-uci-human-activity/
classes: wide
author_profile: true
use_math: true
date: 22/6/1
---

This blog shows how to tune the hyperparameters (e.g., batch size, learning rate, # of nodes in each layer)  with the [UCI Human Activity Example](https://www.kaggle.com/datasets/uciml/human-activity-recognition-with-smartphones).

The code can be found [here](https://github.com/dymodi/uci-activity/blob/master/src/model-nn.ipynb).

The model is a simple three-layer NN model, and the hidden layer has 100 nodes.

<p>
	<img src="/Blog/MLfolds/deep-learning/figures/uci-activity-tuning-100-nodes-model.png"
       alt="Hyperparameter-Tuning-on-UCI-Human-Activity-Example" 
       style="width: 40em;" 
       class="align-center">
</p>

I tried different combination of batch size (3, 10, 20) and learning rate (1e-2, 1e-3, 1e-4). The results are shown in the following.

<p>
	<img src="/Blog/MLfolds/deep-learning/figures/uci-activity-tuning-100-nodes.png"
       alt="Hyperparameter-Tuning-on-UCI-Human-Activity-Example" 
       style="width: 40em;" 
       class="align-center">
</p>

Based on the above results, we have the following observations:

* A **large learning rate** leads to a **faster** learning process and **larger variations** in loss values in the test set.
* A **smaller batch size** leads to a **faster** learning process.
* A **large learning rate** does not necessarily lead to smaller test loss.

Similar results can be observed when we set the hidden layer size to 50 and 200.

<p>
	<img src="/Blog/MLfolds/deep-learning/figures/uci-activity-tuning-50-nodes.png"
       alt="Hyperparameter-Tuning-on-UCI-Human-Activity-Example" 
       style="width: 40em;" 
       class="align-center">
</p>

<p>
	<img src="/Blog/MLfolds/deep-learning/figures/uci-activity-tuning-200-nodes.png"
       alt="Hyperparameter-Tuning-on-UCI-Human-Activity-Example" 
       style="width: 40em;" 
       class="align-center">
</p>