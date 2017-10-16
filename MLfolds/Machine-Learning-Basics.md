--- 
layout: post
title: Machine Learning Basics
date: Oct. 16, 2017
author: Yi DING
---

In this post, we review some basic knowledge of machine learning. The frame of this post comes from the homework of Professor Arindam Banerjee’s Machine Learning course at University of Minnesota.

## Datasets
* Boston: The Boston housing dataset comes prepackaged with scikit-learn. The dataset has 506 points, 13 features, and 1 target (response) variable. You can find more information about the dataset [here](https://archive.ics.uci.edu/ml/datasets/Housing). 

    While the original dataset is for a regression problem, we will create two classification datasets for the example. Note that you only need to work with the response $$r$$ to create these classification datasets.

    i. Boston50: Let $$\tau 50$$ be the median (50th percentile) over all $$r$$ (response) values. Create
a 2-class classification problem such that $$y=1$$ if $$r≥\tau 50$$ and $$y=0$$ if $$r<\tau 50$$. By
construction, note that the class priors will be $$p(y = 1) \approx 1$$ , $$p(y = 0) \approx 1/2$$.

    ii. Boston75: Let $$\tau75$$ be the 75th percentile over all $$r$$ (response) values. Create a 2-class
classification problem such that $$y = 1$$ if $$r ≥ \tau 75$$ and $$y = 0$$ if $$r < \tau 75$$. By construction,
note that the class priors will be $$p(y = 1)\approx 1$$, $$p(y = 0)\approx 3$$.

* Digits: The Digits dataset comes prepackaged with scikit-learn. The dataset has 1797 points, 64 features, and 10 classes corresponding to ten numbers 0,1,...,9. The dataset was (likely) created from [this dataset](http://archive.ics.uci.edu/ml/datasets/Pen-Based+Recognition+of+Handwritten+Digits). 
