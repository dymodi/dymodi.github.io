---
layout: single
title: "Machine Learning"
permalink: /blog/MLfolds/course-note/ml/
classes: wide
author_profile: true
use_math: true
date: 22/05/17
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

$$ \begin{align*}& J(\theta) = \dfrac{1}{m} \sum_{i=1}^m \mathrm{Cost}(h_\theta(x^{(i)}),y^{(i)}) \newline & \mathrm{Cost}(h_\theta(x),y) = -\log(h_\theta(x)) \; & \text{if y = 1} \newline & \mathrm{Cost}(h_\theta(x),y) = -\log(1-h_\theta(x)) \; & \text{if y = 0}\end{align*} $$

#### Simplified Cost Function and Gradient Descent

$$ J(\theta) - \frac{1}{m} \sum_{i=1}^m \[ y^{(i)} \log(h_\theta(x)) + (1-y^{(i)}) \log(1-h_\theta(x)) \] $$

Gradient Descent on LR: $$ \theta_j := \theta_j - \alpha \dfrac{\partial}{\partial \theta_j}J(\theta) $$, that is $$  \theta_j := \theta_j - \frac{\alpha}{m} \sum_{i=1}^m (h_\theta(x^{(i)}) - y^{(i)}) x_j^{(i)} $$

#### Advanced Optimization

Some advanced optimization algorithms: Conjugate gradient, BFGS, L-BFGS

### Multiclass Classification

#### Multiclass Classification: One-vs-all

### Solving the Problem of Overfitting

#### The Problem of Overfitting

Addressing: (1) Reduce the number of features; (2) Regularization;

#### Cost Function

Regularization: small value of $$\theta$$ corresponds to "simpler" hypothesis.

#### Regularized Linear Regression

#### Regularized Logistic Regression

## Week 4 Neural Networks: Representation

### Motivations

#### Non-linear Hypotheses

Linear regressions and logistic regression won't work when there are a large number of features, e.g., CV.

#### Neurons and the Brain

#### Model Representation I

Neural model: Logistic unit; Activation function

#### Model Representation II

Before the output layer, the NN is learning the features by itself, while in the output layer, it can just do a simple logistic regression.

### Applications

#### Examples and Intuitions

AND, OR, XOR

## Week 5 Neural Networks: Learning

### Cost Function and Backpropagation

Decide the error between the output of this layer and the "reference" value from next layer, backwards.

### Backpropagation in Practice

Reasonable default: 1 hidden layer.

Training a neural network:

(1) Random initialize weights; (2) Implement forward propagation; (3) Implement computation of $$J(\theta)$$; (4) Implement backpropagation.

## Week 6 Advice for Applying Machine Learning

### Evaluating a Learning Algorithm

Debugging a learning algorithm: (1) Get more training data; (2) Try smaller set of features; (3) Getting additional features; (4) Try adding polynomial features; (5) Try decrease $$\lambda$$; (6) Try increase $$\lambda$$.

Machine Learning diagnostics.

### Bias vs. Variance

Bias: underfitting. Variance: overfitting.

Learning Curve: Compare the $$J_{train}$$ and $$J_{cv}$$ when increasing the train set size.

High bias: $$J_{train}$$ is decreasing, but increasing the training set size won't help much in decreasing the $$J_{train}$$, and  $$J_{train}$$ is similar with $$J_{cv}$$ in the end.

High variance: $$J_{train}$$ is increasing, $$J_{cv}$$ is decreasing, but still a big gap in the end.

### Building a Spam Classifier

Recommended steps:

(1) Start with a simple algorithm and implement it quickly.

(2) Plot learning curve.

(3) Error analysis.

### Handling Skewed Data

In logistic regression, different threshold values can achieve a trade-off between precision and recall.

Why we need F1 score: it gives us a single real number to show the performance of an ML algorithm.

### Using Large Data Sets

Data volume matters more than the algorithm choice.

## Week 7 Support Vector Machines

### Large Margin Classification

$$h(\theta)=1 if \theta^Tx \ge zero, or 0 otherwise$$.

The mathematics behind SVM indicates that what we do is to maximize the length of the project of data points on $$\theta$$, which is the normal vector of the decision boundary hyperplane.

### Kernels

$$ min_\theta C \sum_{i=1}^m y^{(i)} cost_1 (\theta^Tf^{(i)}) + (1-y)cost_0(\theta^Tf^{(i)})+\frac12\sum_j=1^{m}\theta^2_j $$

The high-level idea of the kernel method is to use the "relative distance" of the points in the training set as the features instead of directly using the nodes. ($$\theta^Tx \to \theta^T f(x)$$, where $$f(x)$$ is node $$x$$'s distance to other nodes.)

### SVMs in Practice



