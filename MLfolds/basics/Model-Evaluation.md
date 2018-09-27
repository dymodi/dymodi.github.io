---
layout: post
title: Model Evaluation
date: Nov. 2, 2017
author: Yi DING
---

sklearn has provide a vast nunmber of [tools](http://scikit-learn.org/stable/modules/model_evaluation.html) for model evaluation.



## Generic Measures

**Confusion Matrix**

|                  |      | **Predicted Class**		  |**Predicted Class**|
| ---------------- | ---- | --------------- | ---- |
|                  |      | + (Positive) | - (Negative) |
| **Acutal Class** | + (Positive) | TP              | FN   |
| **Acutal Class** | - (Negative) | FP              | TN   |

**Accuracy**

[Accuracy](https://developers.google.com/machine-learning/crash-course/classification/accuracy) : Overall, how often is the classifier correct?. It is one (most basic) metric for evaluating classification models,

$$\text{Accuracy} = \frac{\text{Number of correct predictions}}{\text{Total number of predictions}}$$

$$\text{Accuracy} = \frac{TP+TN}{TP+TN+FP+FN}$$

**True Positive Rate (TPR), Recall**: 

$$\text{Recall} = \frac{TP}{TP+FN}$$

**Precision**: When it predicts yes, how often is it correct?

$$\text{Precision} = \frac{TP}{TP+FP}$$

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



## Metrics for Regression

Plot of Predicted vs. Real

**Residual Plots**

**Mean Squared Error (MSE)**

$$\text{MSE}=\frac1n\sum^n_{i=1}(Y_i-\hat Y_i)^2 $$

**Mean Absolute Error (MAE)**

$$\text{MSE}=\frac1n\sum^n_{i=1}\left|Y_i-\hat Y_i\right|^2 $$

