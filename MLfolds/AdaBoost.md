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

Specifically, the algorithm is as follows:

----
Given: $$(x_1, y_1),...(x_m,y_m)$$ where $$x_i \in \mathscr X$$, $$y\in\{-1,+1\}$$


----

## Some comments

### Learning Speed
Robert E. Schapire's [Explaining AdaBoost](http://rob.schapire.net/papers/explaining-adaboost.pdf) provides some insight on the the AdaBoost topic. As we know, the "weak learners" in AdaBoost is suppposed to be "slightly better" than random guess. Based on this assumption, called *weak learning condition*, it can be proven that training error of AdaBoost’s final hypothesis decreases to zero very rapidly; in fact, in just $$O(\log m)$$ rounds (ignoring all other parameters of the problem), the final hypothesis will perfectly fit the training set .

## Ref.
The slides, blogs and paper below are referrd in writing this blog.

[Explaining AdaBoost](http://rob.schapire.net/papers/explaining-adaboost.pdf)

[Boosting and AdaBoost for Machine Learning - Jason Brownlee](https://machinelearningmastery.com/boosting-and-adaboost-for-machine-learning/)

[AdaBoost - Jiri Matas and Jan Sochman](http://www.robots.ox.ac.uk/~az/lectures/cv/adaboost_matas.pdf)

[1] Freund, Y., & Schapire, R. E. (1995, March). **A desicion-theoretic generalization of on-line learning and an application to boosting**. In European conference on computational learning theory (pp. 23-37). Springer, Berlin, Heidelberg.