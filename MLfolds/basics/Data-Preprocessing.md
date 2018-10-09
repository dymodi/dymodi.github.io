---
layout: post
title: Data Preprocessing
date: Oct. 18, 2017
author: Yi DING
---

In this post, we introduce the basic process of data preprocessing (or data clearning). Data preprocessing is not a negligible and this topic is well discussed in the slides from [Indiana](https://www.cs.indiana.edu/~predrag/classes/2010springi211/week6_m.pdf) and [WashU](http://www.cs.wustl.edu/~zhang/teaching/cs514/Spring11/Data-prep.pdf). 

## Normalizing
Normalizing is the process of scaling the vector length to unit. Normalizing is an important step accodring to paper [1]. **sklearn** has provided the [normalize](http://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.normalize.html) to scale input vectors individually to unit norm (vector length).

## Missing Data

Missing data is a very common problem for practical data. Pandas have a [discussion](https://pandas.pydata.org/pandas-docs/stable/missing_data.html) on working with missing data.

## Removing Outliers

Whether we should/need remove the outliers from the dataset is a tricky problem. Some comments [here](https://stats.stackexchange.com/questions/200534/is-it-ok-to-remove-outliers-from-data/200923) argue that outliers should not be removed from the data or we can conduct a sensitivity analysis given the existence of those outliers or not.

Some methods to remove the outliers from the data is summarized [here](http://d-scholarship.pitt.edu/7948/1/Seo.pdf).

A good practice is first make a **boxplot** of the data to have  general image of the data.

### Standard Deviation
A very simple method is to assume a normal distribution of all the samples and remove the outliers located beyond $$3\sigma$$ away from the mean $$\mu$$, where $$\sigma$$ is the standard derivation of the sample data. That is 

$$X =\{ x>\mu-3\sigma \text{ and }x < \mu+3\sigma | x\in X_{\text{raw}} \}$$

### Boxplot

The boxplot is another very helpful method since it makes no distributional assumptions nor does it depend on a mean or standard deviation.

According to [WashU](http://www.cs.wustl.edu/~zhang/teaching/cs514/Spring11/Data-prep.pdf), clustering is a good method to detect the outliers in the dataset.
According to a [paper](http://pmg.it.usyd.edu.au/outliers.pdf), k-means can be a practical clustering method.
**sklearn** has provide the [KMeanas class](http://scikit-learn.org/stable/modules/generated/sklearn.cluster.KMeans.html) to achieve K-Means clustering quickly.

[Local Outlier Factor (LOF)](http://scikit-learn.org/stable/modules/outlier_detection.html#local-outlier-factor) is another classical method to perform outlier detection on moderately high dimensional datasets.

## Ref.
[1] Guyon, I., & Elisseeff, A. (2003). **An introduction to variable and feature selection**. Journal of machine learning research, 3(Mar), 1157-1182.
