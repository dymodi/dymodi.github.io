---
layout: post
title: Data Mining Cheat Sheet
date: May 8, 2018
author: Yi DING
---

This cheat sheet works for two purposes: for CSci 5523 final exam and for introductory data mining study.  Related chapters can be found in the book [Introduction to Data Mining (Second Edition)](https://www-users.cs.umn.edu/~kumar001/dmbook/index.php).

### Chap 1 Introduction



### Chap 2 Data
#### Measures of Similiarities and Dissimiliarites
Euclidean - Takes the magnitude of absolute differences into account.
Correlarion - Not interested in absolute magnitudes, more of linear relation, symmetric.
Jaccard - Binary, asymmetric.

### Chap 3 Basic Classification

#### Decision Tree

Advantages:

* Inexpensive to construct
* Extremely fast at classifying unknown records
* Easy to interpret for small-sized trees
* Robust to noise (especially when methods to avoid overfitting are employed)
* Can easily handle redundant or irrelevant attributes (unless the attributes are interacting)

Disadvantages: 

* Space of possible decision trees is exponentially large. Greedy approaches are often unable to find the best tree.
* Does not take into account interactions between attributes
* Each decision boundary involves only a single attribute

### Chap 3 Overfitting

Model Selection

- Using Validation Set
- Incorporating Model Complexity
  - Optimistic Error (Training Error)
  - Pessimistic Error 
    - For a decision tree, $e_{pessimistic}=e_{train}+\Omega*\frac{k}{N_{train}}$
- Estimating Statistical Bounds

Similarities and differences between MDL and pessimistic error:

* Similarities: They are both additive methods.
* MDL penalize all nodes while pessimistic error only penalize leaf nodes.

### Chap 4 Imbalanced Classes

**Confusion Matrix**

|                  |              | **Predicted Class** | **Predicted Class** |
| ---------------- | ------------ | ------------------- | ------------------- |
|                  |              | + (Positive)        | - (Negative)        |
| **Acutal Class** | + (Positive) | TP                  | FN                  |
| **Acutal Class** | - (Negative) | FP                  | TN                  |

$$\text{Accuracy} = \frac{TP+TN}{TP+TN+FP+FN}$$

$\text{Precision}=\frac{TP}{TP+FP}$

$\text{Recall}=\frac{TP}{TP+FN}$

$\text{F-measure}=\frac{2TP}{2TP+FP+FN}$

$FPR = \alpha = \frac{FP}{TN+FP}$

$FNR = \beta = \frac{FN}{FN+TP}$



### Chap 4 Classification

NB will not have good performance if the attributes are correlated.

KNN will not have good performance if there are too much noise attribute.

RIPPER will have good performance on skewed data, it has different rules for different class.

SVM will be good when there are large amount of attributes while only a part of them are relevant to discrimination.



### Chap 5 Association Analysis

Number of possible rules: $R=3^d-2^{d+1}+1$
Example:
{Milk, Diaper} => {Beer}
$s = \frac{\sigma (\text{Milk, Diaper, Beer})}{|T|}$

$c = \frac{\sigma(\text{Milk, Diaper, Beer})}{\sigma(\text{Milk, Diaper})}$

An itemset X is closed if none of its immediate supersets has the same support as the itemset X. 

An itemset is maximal frequent if it is frequent and  none of its immediate supersets is frequent.

h-confidence({A,B,D}) = $\min \{ \frac{s({A,B,D})}{s(A)}, \frac{s({A,B,D})}{s(B)}, \frac{s({A,B,D})}{s(C)}\}$

Sequence Mering Procedure

A sequence $s^{(1)}$ is merged with another sequence $s^{(2)}$ only if the subsequence obtained by dropping the first event in $s^{(1)}$ is indentical to the subsequence obtained by dropping the last event in $s^{(2)}$.






### Chap 8 Cluster Analysis

Clustering entropy: aggragated: low entropy; spread: high entropy.

$$SSE \equiv \sum_C \sum_{i\in C} \parallel x_i - m_C\parallel ^2$$



### Chap 9 Anomaly Detection

**Proximity-based**: $k$-nearest neighbor

**Density-based**: LOF

Pattern matching 




### Chap 10 Avoiding False Discoveries
#### Statistical Testing 
**Null hypothesis**: A statement that we want to disprove.
**Test statistic $R$**: A random variable, for which we know or can determine a distribution if $H_0$ is true. 

#### Significance Testing
lf the $p$-value is sufficiently small, we reject the null hypothesis, $H_0$ and say that the result is statistically significant.
A threshold on the p-value is called the significance level, $α$.

Type I Error ($α$): Error of incorrectly rejecting the null hypothesis for a result.  

​	Formally, $α$ = P(R ∈ Critical Region | H0) 

Type II Error ($β$): Error of falsely calling a result as not significant when the alternative hypothesis is true. 

​	Formally, $β$ = P(R ∉ Critical Region | H1) 

Power: which is the probability of the critical region under H1, i.e., 1−β 

A large $p$-value may not be trustworthy.

Effect size measures the magnitude of the effect or characteristic being evaluated, and is often the magnitude of the test statistic. 



