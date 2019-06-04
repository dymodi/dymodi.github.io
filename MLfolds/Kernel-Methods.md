---
layout: post
title: Kernel Methods and Multiple Kernel Learning
date: May 31, 2019
author: Yi DING
---

This blog is based on [Wikipedia](https://en.wikipedia.org/wiki/Kernel_method).



The main difference between kernel methods and other machine learning methods is that, in other methods,  data needs to be first transformed into a **feature vector,** while in kernel methods, we only need a user-specified **kernel**, i.e., a [similarity function](https://en.wikipedia.org/wiki/Similarity_function) over pairs of data points.

Any [linear model](https://en.wikipedia.org/wiki/Linear_model) can be turned into a non-linear model by applying the kernel trick to the model: replacing its features (predictors) by a kernel function.

