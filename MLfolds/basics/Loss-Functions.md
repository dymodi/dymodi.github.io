--- 
layout: post
title: Loss Functions
date: Jan 13, 2017
author: Yi DING
---

In this post, I will summarize some common loss functions in machine learning. Some of the definitions come from Professor Liang in the lecture note of CS221 at Stanford.

A cheatsheet of loss functions can be found [here](http://ml-cheatsheet.readthedocs.io/en/latest/loss_functions.html).

According to Professor Liang, a loss function Loss$$(x, y, \mathbf w)$$ quantifies how unhappy you would be if you used $$\mathbf w$$ to make a prediction on $$x$$ when the correct output is $$y$$. It is the object we want to minimize.

One thing we need to keep in mind is that loss function is an individual topic independent of prediction models.

## Zero-one loss

$$\text{Loss}_{0-1}(x, y, \mathbf w) = 1[f_{\mathbf w}(x) \ne y]$$

## Squared loss
First we define residual. The residual is $$(\mathbf w · \phi (x)) − y$$, the amount by which prediction
$$f_{\mathbf w}(x) = \mathbf w · \phi (x)$$ overshoots the target $$y$$.

Then we have

$$\text{Loss}_{\text{squared}}(x, y, \mathbf w) = (f_{\mathbf w}(x) - y)^2$$

## Absolute deviation loss

$$\text{Loss}_{\text{absdev}}(x, y, \mathbf w) = |f_{\mathbf w}(x) - y|$$

## Cross entropy loss

$$\text{Loss}_{\text{cross-entropy}}(x, y, \mathbf w) = y\log f_{\mathbf w}(x) +(1-y) \log (1-f_{\mathbf w}(x)) $$