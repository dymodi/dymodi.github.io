--- 
layout: post
title: Model Evaluation
date: Nov. 2, 2017
author: Yi DING
---

[comment]: # (This posts summarize the methods for evaluation machine learning models)

## Classification Model Evaluation

## Regression Model Evaluation

**Residual Plots**

According to [Frost's blog](http://blog.minitab.com/blog/adventures-in-statistics-2/regression-analysis-how-do-i-interpret-r-squared-and-assess-the-goodness-of-fit), before looking at the statistical measures for goodness-of-fit, you should [check the residual plots](http://blog.minitab.com/blog/adventures-in-statistics-2/why-you-need-to-check-your-residual-plots-for-regression-analysis). Residual plots can reveal unwanted residual patterns that indicate biased results more effectively than numbers. When your residual plots pass muster, you can trust your numerical results and check the goodness-of-fit statistics.

**Coefficient of Determination ($$R^2$$)**

$$R^2$$ is number between 0 and 1, usually we think the higher the better.

According to [Frost's blog](http://blog.minitab.com/blog/adventures-in-statistics-2/regression-analysis-how-do-i-interpret-r-squared-and-assess-the-goodness-of-fit), 

R-squared = Explained variation / Total variation

[Wikipedia](https://en.wikipedia.org/wiki/Coefficient_of_determination) gives a most general definiation as follows:

\\[ R^2 \equiv 1- \frac{SS_{\text{res}}}{SS_\text{tot}} \\]

where $$SS_\text{tot} = \sum_i (y_i - \bar y)^2$$ 



**Quantile-Quantile Plot**

**gini**

**auc**

**aic**