---
layout: post
title: Cheat Paper 2 - Stat 5101
date: Mar. 1, 2018
author: Yi DING
---

Cheat Paper 2

**Marginal Distributions**

$$f_1(x)=\int _{-\infty}^\infty f(x,y)dy$$  for  $$-\infty < x < \infty$$

**Independent Variables**

Two random variables $$X$$ and $$Y$$ are independent if and only if the following factorization is satisfied for all real numbers $$x$$ and $$y$$:

$$f(x,y)=f_1(x)f_2(y)$$

**Conditional Distributions**

$$g_2(y|x)=\frac{f(x,y)}{f_1(x)}$$

**Marginal Joint p.d.f**

The joint p.d.f. for $$X_1, X_2, X_3$$ is $$f(x_1, x_2, x_3)$$. The marginal joint p.d.f. of $$X_1$$ and $$X_3$$ is 

$$f_{13}(x_1, x_3)=\int f(x_1, x_2, x_3)dx_2$$

**Functions of Random Variables**

Given p.d.f. of $$X$$, $$f(x)$$, we know $$y = \alpha(x)$$, how to get the p.d.f. of $$y$$?

First let $$x=\alpha^{-1}(y)$$ and insert it the c.d.f. of $$x$$ and get the c.d.f. of $$y$$, derive the c.d.f. then we have the p.d.f. of $$y$$.

**Direct Transformation of a Multivariate p.d.f**
Let $X_1, ..., X_n$ have a continuous joint distribution for which the joint p.d.f. is $f$. Assume that there is a subset $S$ of $Rn$ such that $\text{Pr}[(X_1,...,X_n)∈S]=1$. Define $n$ new random variables $Y_1,...,Y_n$ as follows:
$ Y_1 =r_1(X_1,...,X_n), $
$ Y_2 =r_2(X_1,...,X_n), $
...
$Y_n =r_n(X_1,...,X_n), $

Let the inverse of this transformation be given as follows:
$ x_1 = s_1(y_1,...,y_n), $
$ x_2 = s_2(y_1,...,y_n), $
...
$x_n =s_n(y_1,...,y_n). $

Then the joint p.d.f.$g$ of $Y_1,...,Y_n$ is

$ g(y_1, ..., y_n) =  \begin{cases} f(s_1, ..., s_n) |J| & \text{for} (y_1, ..., y_n) \in T \\  0 & \text{otherwise}\end{cases}$

where $J$ is the determinat 

$J = \det \begin{bmatrix} \frac{\partial s_1}{\partial y_1}  &… & \frac{\partial s_1}{\partial y_n} \\ \vdots & \ddots & \vdots \\ \frac{\partial s_n}{\partial y_1}  &… & \frac{\partial s_n}{\partial y_n}  \end{bmatrix}$

and $|J|$ denotes the the absolute value of the determinant $J$.

**If** $n_y < n_x$, we can complete $y$ with $z$ by assigning $z=x_1...$

