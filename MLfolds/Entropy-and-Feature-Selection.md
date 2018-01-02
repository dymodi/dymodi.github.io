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

Entropy is the variable to define the uncertainty of an event (or a set of features):

$$H\[X\] = - \sum _x \text{Pr} (X = x) \log _2 \text{Pr} (X = x)$$