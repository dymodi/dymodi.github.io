--- 
layout: post
title: Gradient Boosting for Regression
date: Dec. 22, 2017
author: Yi DING
---

[comment]: # (Some contents about GBDT for regression)

This post is basically based on [A Gentle Introduction to Gradient Boosting - Cheng Li](http://www.chengli.io/tutorials/gradient_boosting.pdf).

## What is Gradient Boosting
In each stage, a weak learner is introduced to compensate the shortcomings of existing weak learners. 

In Gradient Boosting,“shortcomings” are identified by gradients.

Recall that, in [Adaboost](https://dymodi.github.io/MLfolds/AdaBoost),“shortcomings” are identified by high-weight data points.

Both high-weight data points and gradients tell us how to improve our model.

## How to understand Gradient Boosting
I found an example from [A Gentle Introduction to Gradient Boosting - Cheng Li](http://www.chengli.io/tutorials/gradient_boosting.pdf) quite straightforward and I will borrow it here.

Suppose you are playing a game. You are given $$(x_1, y_1),(x_2, y_2), ...,(x_n, y_n)$$, and the task is to fit a model $$F(x)$$ to minimize square loss.

Suppose your friend wants to help you and gives you a model $$F$$. You check his model and find the model is good but not perfect.

There are some mistakes: $$F(x_1) = 0.8$$, while $$y_1 = 0.9$$, and $$F(x_2) = 1.4$$ while $$y_2 = 1.3$$... How can you improve this model?

A simple solution is to fit an additional regression model $$h(x)$$ so that

$$F(x_1)+h(x_1) = y_1$$

$$F(x_2)+h(x_2) = y_2$$

...

$$F(x_n)+h(x_n) = y_2$$

## Ref.

[A Gentle Introduction to Gradient Boosting - Cheng Li](http://www.chengli.io/tutorials/gradient_boosting.pdf)