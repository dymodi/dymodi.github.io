--- 
layout: post
title: Entropy and Feature Selection
date: Jan. 2, 2018
author: Yi DING
---

[comment]: # (Some contents about entropy and feature selection)

A short interesting article about "Entropy" is posted in Chinese [here](http://blog.csdn.net/dymodi/article/details/54171509).

This post is based on the content from [Lecture 4: Finding Informative Features - Cosma Shalizi](http://www.stat.cmu.edu/~cshalizi/350-2006/lecture-04.pdf).

In short, entropy and feature selection are both about information and uncertainty reduction.

## Entropy
Here we first define the information function $$I$$:

$$I(x) = -\log _b p(x)$$

when $$b=2$$, $$I(x)$$ has the unit *bit*. 

Entropy is the variable to define the uncertainty of an event (or a set of features) $$X$$:

$$H[X] = - \sum _x \text{Pr} (X = x) \log _2 \text{Pr} (X = x)$$


## Feature Selection
In machine learning, the uncertainty about the class $$C$$, in the absence of any other information, is just the entropy of $$C$$:

$$H[C] = - \sum _c \text{Pr} (C = c) \log _2 \text{Pr} (C = c)$$

If we have some observation $$x$$ of the feature of the feature $$X$$, the uncertainty will change based on Bayes' Rule:

$$\text{Pr}(C = c | X = x) = \frac{\text{Pr}(C=c, X=x)}{\text{Pr}(X=x)} = \frac{\text{Pr}(X=x|C=c)}{\text{Pr}(X=x)}\text{Pr}(C=c) $$

Hence, the uncertainty about $$C$$ is going to change and be given by the **conditional entropy**:

$$H[C|X=x] = - \sum _c \text{Pr} (C = c | X = c) \log _2 \text{Pr} (C = c | X = x)$$

The difference in entropies is how much uncertainty about $$C$$ is changed after seeing $$X = x$$. This change in uncertainty is also **information**:

