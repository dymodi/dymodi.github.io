---
layout: post
title: Model Evaluation
date: Nov. 2, 2017
author: Yi DING
---

## Generic Measures
**Accuracy**

$\text{Accuracy} = \frac{N_{y_\text{pred} == y_{\text{true}}}}{N_{\text{total}}}$


**Confusion Matrix**

|                  |      | **Predicted Class**		  |**Predicted Class**|
| ---------------- | ---- | --------------- | ---- |
|                  |      | +               | -    |
| **Acutal Class** | +    | TP              | FN   |
| **Acutal Class** | -    | FP              | TN   |

**ROC Curve**

[ROC curve](https://en.wikipedia.org/wiki/Receiver_operating_characteristic#ROC_space) is defined based on the confusion matrix focusing on TPR and FPR.

**Area Under the Curve , AUC**



