---
layout: post
title: Cheat Paper 3 - Stat 5101
date: Apr. 12, 2018
author: Yi DING
---

Cheat Paper 3

p.d.f. for uniform distribution between $[a,b]$: $f(x)=\frac1{b-a}$

**Variance**
$E(X)=\int^b_axf(x)dx $
$E(XY)=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}xyf(x,y)dx$
$E(X^2)=\int^b_ax^2f(x)dx $
$Var(X)=E(X^2)-[E(X)]^2$
If $X_1,…,X_n$ are independent random variables with finite means, and if $a_1,…, a_n$ and $b$ are arbitrary constants, then $$Var(a_1X_1+…+a_nX_n+b)=a_1^2Var(X_1)+…+a_n^2Var(X_n)$$

**Moments**
For each random variable $X$ and every positive integer $k$, the expectation $E(X^k)$ is called the $k$th moment of $X$.
$E[(X − \mu)^k]$ is called the $k$th central moment of $X$ or the $k$th moment of $X$ about the mean.

Furthermore, if the distribution of $X$ is symmetric with respect to its mean $\mu$, and if the central moment $E[(X − \mu)^k]$ exists for a given odd integer $k$, then the value of $E[(X − μ)^k]$ will be 0 because the positive and negative terms in this expectation will cancel one another.

**Moment Generating Function**
Let $X$ be a random variable. For each real number $t$, define $ψ(t)=E(e^{tX})$. The function $ψ(t)$ is called the moment generating function (abbreviated m.g.f.) of $X$.
$ψ(0)=1$, $ψ'(0)=E(X)$, $ψ''(0)=E(X^2)$, $ψ'''(0)=E(X^3)$

**Median**
Let X be a random variable. Every number $m$ with the following property is called a *median* of the distribution of $X$: $Pr(X≤m)≥1/2$ and $Pr(X≥m)≥1/2.$

**M.S.E. (Mean Squared Error)** 
Let $X$ be a random variable with finite variance $σ^2$, and let $μ = E(X)$. For every number $d$, 
$E[(X − μ)^2] ≤ E[(X − d)^2]$

**M.A.E. (Mean Absolute Error)**
Let $X$ be a random variable with finite mean, and let $m$ be a **median** of the distribution of $X$. For every number $d$, $E(|X − m|) ≤ E(|X − d|)$

**Covariance**
Let $X$ and $Y$ be random variables having finite means. Let $E(X) = μ_X$ and $E(Y ) = μ_Y$ The *covariance* of $X$ and $Y$ , which is denoted by $\text{Cov(X, Y )}$, is definedas
$\text{Cov}(X, Y ) = E[(X − μ_X)(Y − μ_Y )]$
We also have $\text{Cov}(X, Y ) = E(XY) − E(X)E(Y)$

**Correlation**
Let $X$ and $Y$ be random variables with finite variances $σ_X^2$ and $σ_Y^2$, respectively. Then the *correlation* of $X$ and Y , which is denoted by $ρ (X, Y )$, is definedas follows:
$ρ(X, Y) = \frac{\text{Cov}(X, Y)}{σ_X σ_Y}$
If $X$ and $Y$ are random variables such that $\text{Var}(X) < ∞$ and $\text{Var}(Y ) < ∞$, then $\text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) + 2 \text{Cov}(X, Y)$
$\text{Var}(aX + bY + c) = a^2\text{Var}(X) + b^2\text{Var}(Y) + 2ab\text{Cov}(X, Y)$
$\text{Var}(X − Y) = \text{Var}(X) + \text{Var}(Y) − 2\text{Cov}(X, Y)$
If $X_1,...,X_n$ are random variables such that $\text{Var}(X_i)<∞$ for $i=1,...,n$, then
$\text{Var}\left( \sum_{i=1}^n X_i \right)= \sum_{i=1}^n \text{Var}(X_i)+2\sum\sum_{i<j} \text{Cov}(X_i, X_j)$

**Conditional Expection**
$E(Y|x)=\int _{-\infty}^{\infty} yg_2(y|x)dy$
$E(Y^2|x)=\int _{-\infty}^{\infty} y^2g_2(y|x)dy$
Law of Total Probability for Expectation: $E[E(Y|X)]=E(Y)$
Linear Conditional Expectation: Suppose that $E(Y |X) = aX + b$, We have
$E(XY|X) = XE(Y|X) = X(aX + b) = aX^2 + b^X$ , therefore
$E(XY ) = E(aX^2 + b^X) = aE(X^2) + bE(X)$

**Conditional Variance**
$\text{Var}(Y|x)=E(Y^2|x)-[E(Y|x)]^2$

**Prediction**
The prediction d(X) that minimizes $E{[Y − d(X)]^2}$ is $d(X) = E(Y|X)$.
If we want to minimize the M.S.E. when predicting $P$, we should use $E(P|x)$.

**Bernoulli Distribution**
A random variable $X$ has the Bernoulli distribution with parameter $p (0 ≤ p ≤ 1)$ if $X$ can take only the values $0$ and $1$ and the probabilities are $$\text{Pr}(X=1)=p$$ and $$\text{Pr}(X=0)=1−p$$
$f(x|p) = p^x(1-p)^{1-x}$ for $x=0,1$ and $0$ otherwise
$E(X) = 1 · p + 0 · (1 − p) = p$
$E(X^2) = E(X) = p$
$\text{Var(X)} = E(X^2) − [E(X)]^2 = p(1 − p)$
$ψ(t)=E(e^{tX})=pe^t +(1−p)$ for $ −∞<t <∞$

**Binomial Distribution**
$$f (x|n, p) = \left( \begin{matrix} n \\ x \end{matrix} \right)  p^x(1 − p)^{n−x}$$ for $$x = 0, 1, 2, . . . , n$$
If the random variables $X_1, . . . , X_n$ form $n$ Bernoulli trials with parameter $p$, and if $X = X_1 + . . . + X_n$, then $X$ has the binomial distribution with parameters $n$ and $p$.
$E(X)= \sum_{i=1}^n E(X_i)=np$
$\text{Var}(X) = \sum^n_{i=1}\text{Var}(X_i ) = np(1 − p)$
$ψ(t)=E(e^{tX})=\Pi_{i=1}^n E(e^{tX_i})=(pe^t +1−p)^n$














### Additional Content from Previous Cheat Paper

**Conditional Distributions**

$$g_2(y|x)=\frac{f(x,y)}{f_1(x)}$$
