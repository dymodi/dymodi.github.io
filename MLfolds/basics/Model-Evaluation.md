---
layout: post
title: Model Evaluation
date: Nov. 2, 2017
author: Yi DING
---

## Generic Measures


**Confusion Matrix**

|                  |      | **Predicted Class**		  |**Predicted Class**|
| ---------------- | ---- | --------------- | ---- |
|                  |      | + (Positive) | - (Negative) |
| **Acutal Class** | + (Positive) | TP              | FN   |
| **Acutal Class** | - (Negative) | FP              | TN   |

**Accuracy**

[Accuracy](https://developers.google.com/machine-learning/crash-course/classification/accuracy) is one (most basic) metric for evaluating classification models.

$$\text{Accuracy} = \frac{\text{Number of correct predictions}}{\text{Total number of predictions}}$$

$$\text{Accuracy} = \frac{TP+TN}{TP+TN+FP+FN}$$

**ROC, AUC**

[ROC curve](https://en.wikipedia.org/wiki/Receiver_operating_characteristic#ROC_space) is defined based on the confusion matrix focusing on TPR and FPR. 

The most important advantage for ROC is that it can show the performance of the classifier for all possible thresholds(parameters), while accuracy can only shows the performance on for certain parameter.

Area Under the Curve, or AUC, is a numerical measure to evaluate the performance of classifier. A good illustration is:

<p align = "center">
<img src="http://gim.unmc.edu/dxtests/roccomp.jpg"  alt="ROC AUC">
</p>

Where we have the following guide:

- .90-1 = excellent (A)
- .80-.90 = good (B)
- .70-.80 = fair (C)
- .60-.70 = poor (D)
- .50-.60 = fail (F)

A good explanation of ROC and AUC can be found [here](http://www.dataschool.io/roc-curves-and-auc-explained/).

