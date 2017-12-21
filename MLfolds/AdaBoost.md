--- 
layout: post
title: AdaBoost
date: Dec. 21, 2017
author: Yi DING
---

[comment]: # (Some contents about AdaBoost and maybe GBDT)

## What is AdaBoost

AdaBoost is an algorithm for constructing a ”strong” classifier as linear combination

$$ f(x) = \sum_{t=1}^T \alpha_t h_t (x) $$

of "simple", "weak" classifiers $$h_t (x)$$

## Ref.
The slides, blogs and paper below are referrd in writing this blog.

[Boosting and AdaBoost for Machine Learning - Jason Brownlee](https://machinelearningmastery.com/boosting-and-adaboost-for-machine-learning/)

[AdaBoost - Jiri Matas and Jan Sochman](http://www.robots.ox.ac.uk/~az/lectures/cv/adaboost_matas.pdf)