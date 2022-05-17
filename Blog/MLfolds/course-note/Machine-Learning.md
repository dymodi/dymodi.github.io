---
layout: single
title: "Machine Learning"
permalink: /blog/MLfolds/course-note/ml/
classes: wide
author_profile: true
use_math: true
date: 22/05/15
---

This is a learning note on ["Machine Learning "](https://www.coursera.org/learn/machine-learning) from Andrew Ng.

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

Here $$\alpha$$ is the learning rate.

Note: all $$\theta$$ are updated simultaneously.

#### Gradient Descent for Linear Regression

"Batch" Gradient Descent: Use all the training samples at each step.

## Week 2 Linear Regression with Multiple Variables

### Multivariate Linear Regression

$$h(\theta)=\theta^Tx$$

#### Gradient Descent in Practice I - Feature Scaling

Idea: make sure the features are on a similar scale. (e.g., $$-1\le x_i\le 1$$)

Mean normalization: replace $$x_i$$ with $$x_i-\mu_i$$ to make features have approximately zero average.

#### Gradient Descent in Practice II - Learning Rate

If $$J(\theta)$$ increases or fluctuates, you should use a smaller $$\alpha$$.

Plot the # of iteration v.s. $$J(\theta)$$ helps.

#### Features and Polynomial Regression

In house selling, area (frontage*depth) is a more important feature than frontage and depth.

More features from a single feature: $$x, x^2, x^3, etc.$$

<span style="color:Red">Here is a fundamental issue, we know y is relate to x, but we don't know how, so try </span> $$ \color{Red}{x^2 \text{or} \sqrt{x}}$$ <span style="color:Red"> can be a good idea. </span> 

### Computing Parameters Analytically

#### Normal Equation

The problem with the normal equation is that some computing (e.g., $$(X^TX)^{-1}$$) is not scalable when $$n$$ (number of features) is very large.

#### Normal Equation Noninvertibility
When will $$X^TX$$ noninvertible:
(1) Redundant features (linear independent);
(2) Too many features $$m\le n$$

## Week 3 Logistic Regression

### Classification and Representation

#### Classification

Linear regression is not a good idea for classification.

Logistic regression: $$0 \le h_\theta(x) \le 1$$.

#### Hypothesis Representation

$$h_\theta(x) = \frac{1}{1+e^{-\theta ^T x}}$$

The interpretation of hypothesis output $$h_\theta(x)$$: it's the estimated the probability that $$y=1$$ for this $$x$$.

<p>
	<img src="https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/1WFqZHntEead-BJkoDOYOw_2413fbec8ff9fa1f19aaf78265b8a33b_Logistic_function.png?expiry=1652918400000&hmac=cMfOzo0FWu2zAW7I99HjkX8b-HveDX0GiTF1ZGM4aH8"
       alt="Sigmoid function" 
       style="width: 40em;" 
       class="align-center">
</p>



#### Decision Boundary

The idea of LR: set a decision boundary and split the data points into two groups.

By using high-order polynomial terms, LR can produce non-linear decision boundaries (e.g., circles.) 

### Logistic Regression Model

#### Cost Function

Problem of square loss in LR: $$J(\theta)$$ is non-convex.

\begin{align*}& J(\theta) = \dfrac{1}{m} \sum_{i=1}^m \mathrm{Cost}(h_\theta(x^{(i)}),y^{(i)}) \newline & \mathrm{Cost}(h_\theta(x),y) = -\log(h_\theta(x)) \; & \text{if y = 1} \newline & \mathrm{Cost}(h_\theta(x),y) = -\log(1-h_\theta(x)) \; & \text{if y = 0}\end{align*}

