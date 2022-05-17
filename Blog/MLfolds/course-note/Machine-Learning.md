---
layout: single
title: "Machine Learning"
permalink: /blog/MLfolds/course-note/ml/
classes: wide
author_profile: true
use_math: true
date: 22/05/15
---

This is a learning note of ["Machine Learning "](https://www.coursera.org/learn/machine-learning) from Andrew Ng.

## Week 1 Introduction

### Introduction

#### What is Machine Learning?

#### Supervised Learning

#### Unsupervised Learning

Clustering

Non-clustering: Cocktail Party Algorithm.

### Model and Cost Function

#### Model Representation

Training Set -> Learning Algorithm -> $$h$$

#### Cost Function

### Parameter Learning

#### Gradient Descent

$$\theta_j = \theta_j - \alpha  \frac{\partial}{\partial \theta_j} J(\theta)$$ 

here $$\alpha$$ is the learning rate.

Note: all $$\theta$$ are updated simultaneously.

#### Gradient Descent for Linear Regression

"Batch" Gradient Descent: Use all the training samples at each step.

## Week 2 Linear Regression with Multiple Variables

### Multivariate Linear Regression

$$h(\theta)=\theta^Tx$$

#### Gradient Descent in Practice I - Feature Scaling

Idea: make sure the features are on similar scale. (e.g., $$-1\le x_i\le 1$$)

Mean normalization: replace $$x_i$$ with $$x_i-\mu_i$$ to make features have approximately zero average.

#### Gradient Descent in Practice II - Learning Rate

If $$J(\theta)$$ increases or fluctuates, you should use a smaller $$\alpha$$.

Plot the # iteration v.s. $$J(\theta)$$ helps.

#### Features and Polynomial Regression

The example of house selling, area (frontage*depth) is a more important feature compared to frontage and depth.

More features from a single feature: $$x, x^2, x^3, etc.$$

<span style="color:Red">Here is a fundamental issue, we know y is relate to x, but we don't know how, so try  $x^2$ or $\sqrt{x}$ can be a good idea. </span> 