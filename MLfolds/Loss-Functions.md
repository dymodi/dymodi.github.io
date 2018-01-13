--- 
layout: post
title: Loss Functions
date: Jan 13, 2017
author: Yi DING
---

In this post, I will summarize some common loss functions in machine learning.

According to Professor Liang in the lecture note of CS221 at Stanford, a loss function Loss$$(x, y, \mathbf w)$$ quantifies how unhappy you would be if you used $$w$$ to make a prediction on $$x$$ when the correct output is $$y$$. It is the object we want to minimize.

## Zero-one loss
$$\text{Loss}_{0-1}(x, y, \mathbf w) = 1\[f_{\mathbf w}(x) \ne y\]$$