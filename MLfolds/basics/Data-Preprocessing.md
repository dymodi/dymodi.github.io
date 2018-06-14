---
layout: post
title: Data Preprocessing
date: Oct. 18, 2017
author: Yi DING
---

In this post, we introduce the basic process of data preprocessing (or data clearning). Data preprocessing is not a negligible and this topic is well discussed in the slides from [Indiana](https://www.cs.indiana.edu/~predrag/classes/2010springi211/week6_m.pdf) and [WashU](http://www.cs.wustl.edu/~zhang/teaching/cs514/Spring11/Data-prep.pdf). 

## Normalizing
Normalizing is the process of scaling the vector length to unit. Normalizing is an important step accodring to paper [1]. **sklearn** has provided the [normalize](http://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.normalize.html) to scale input vectors individually to unit norm (vector length).

## Removing Outliers
A very simple method is to assume a normal distribution of all the samples and remove the outliers located beyond $$3\sigma$$ away from the mean $$\mu$$, where $$\sigma$$ is the standard derivation of the sample data. That is 

$$X =\{ x>\mu-3\sigma \text{ and }x < \mu+3\sigma | x\in X_{\text{raw}} \}$$

According to [WashU](http://www.cs.wustl.edu/~zhang/teaching/cs514/Spring11/Data-prep.pdf), clustering is a good method to detect the outliers in the dataset.
According to a [paper](http://pmg.it.usyd.edu.au/outliers.pdf), k-means can be a practical clustering method.
**sklearn** has provide the [KMeanas class](http://scikit-learn.org/stable/modules/generated/sklearn.cluster.KMeans.html) to achieve K-Means clustering quickly.

[Local Outlier Factor (LOF)](http://scikit-learn.org/stable/modules/outlier_detection.html#local-outlier-factor) is another classical method to perform outlier detection on moderately high dimensional datasets.

## Ref.
[1] Guyon, I., & Elisseeff, A. (2003). **An introduction to variable and feature selection**. Journal of machine learning research, 3(Mar), 1157-1182.
