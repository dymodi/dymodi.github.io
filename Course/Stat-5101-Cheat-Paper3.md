---
layout: post
title: Cheat Paper 3 - Stat 5101
date: Apr. 12, 2018
author: Yi DING
---
**Expectation and Variance** $E(X)=\int^b_axf(x)dx, \quad E(XY)=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}xyf(x,y)dx$

$E(X^2)=\int^b_ax^2f(x)dx, \quad Var(X)=E(X^2)-[E(X)]^2$

If $X_1,…,X_n$ are independent r.v.s with finite means, and if $a_1,…, a_n$ and $b$ are arbitrary constants, then $$Var(a_1X_1+…+a_nX_n+b)=a_1^2Var(X_1)+…+a_n^2Var(X_n)$$

**Moments**
For each r.v. $X$ and every positive integer $k$, the expectation $E(X^k)$ is called the $k$th moment of $X$.
$E[(X − \mu)^k]$ is called the $k$th central moment of $X$ or the $k$th moment of $X$ about the mean.

If the distribution of $X$ is symmetric w.r.t. its mean $\mu$, and if the central moment $E[(X − \mu)^k]$ exists for a given odd integer $k$, then the value of $E[(X − μ)^k]$ will be 0 because the positive and negative terms in this expectation will cancel one another.

**Moment Generating Function**
Let $X$ be a r.v.. For each real number $t$, define $ψ(t)=E(e^{tX})$. The function $ψ(t)$ is called the moment generating function (abbreviated m.g.f.) of $X$.
$ψ(0)=1​$, $ψ'(0)=E(X)​$, $ψ''(0)=E(X^2)​$, $ψ'''(0)=E(X^3)​$

**Median**
Let X be a r.v.. Every number $m$ with the following property is called a *median* of the distribution of $X$: $Pr(X≤m)≥1/2$ and $Pr(X≥m)≥1/2.$

**M.S.E. (Mean Squared Error)** 
Let $X$ be a r.v. with finite variance $σ^2$, and let $μ = E(X)$. For every number $d$, 
$E[(X − μ)^2] ≤ E[(X − d)^2]$

**M.A.E. (Mean Absolute Error)**
Let $X$ be a r.v. with finite mean, and let $m$ be a **median** of the distribution of $X$. For every number $d$, $E(|X − m|) ≤ E(|X − d|)$

**Covariance**
Let $X$ and $Y$ be r.v.s having finite means. Let $E(X) = μ_X$ and $E(Y ) = μ_Y$ The *covariance* of $X$ and $Y$ , which is denoted by $\text{Cov(X, Y )}$, is defined as
$\text{Cov}(X, Y ) = E[(X − μ_X)(Y − μ_Y )]$. We also have $\text{Cov}(X, Y ) = E(XY) − E(X)E(Y)$

**Correlation**
Let $X$ and $Y$ be r.v.s with finite variances $σ_X^2$ and $σ_Y^2$, respectively. Then the *correlation* of $X$ and $Y$ , which is denoted by $ρ (X, Y )$, is definedas follows: $ρ(X, Y) = \frac{\text{Cov}(X, Y)}{σ_X σ_Y}$

If $X$ and $Y$ are r.v.s such that $\text{Var}(X) < ∞$ and $\text{Var}(Y ) < ∞$, then $\text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) + 2 \text{Cov}(X, Y)$
$\text{Var}(aX + bY + c) = a^2\text{Var}(X) + b^2\text{Var}(Y) + 2ab\text{Cov}(X, Y)$
$\text{Var}(X − Y) = \text{Var}(X) + \text{Var}(Y) − 2\text{Cov}(X, Y)$

If $X_1,...,X_n$ are r.v.s such that $\text{Var}(X_i)<∞$ for $i=1,...,n$, then
$\text{Var}\left( \sum_{i=1}^n X_i \right)= \sum_{i=1}^n \text{Var}(X_i)+2\sum\sum_{i<j} \text{Cov}(X_i, X_j)$

**Conditional Expection**
$E(Y|x)=\int _{-\infty}^{\infty} yg_2(y|x)dy, \quad E(Y^2|x)=\int _{-\infty}^{\infty} y^2g_2(y|x)dy$

Law of Total Probability for Expectation: $E[E(Y|X)]=E(Y)$

Linear Conditional Expectation: Suppose that $E(Y |X) = aX + b$, We have

$E(XY|X) = XE(Y|X) = X(aX + b) = aX^2 + b^X$ , therefore
$E(XY ) = E(aX^2 + b^X) = aE(X^2) + bE(X)$

**Conditional Variance**
$\text{Var}(Y|x)=E(Y^2|x)-[E(Y|x)]^2$

**Prediction**
The prediction $d(X)$ that minimizes $E{[Y − d(X)]^2}$ is $d(X) = E(Y|X)$.

If we want to minimize the M.S.E. when predicting $P$, we should use $E(P|x)$.

**Bernoulli Distribution**
A r.v. $X$ has the Bernoulli distribution with parameter $p (0 ≤ p ≤ 1)$ if $X$ can take only the values $0$ and $1$ and the probabilities are $$\text{Pr}(X=1)=p$$ and $$\text{Pr}(X=0)=1−p$$
$f(x|p) = p^x(1-p)^{1-x}$ for $x=0,1$ and $0$ otherwise
$E(X) = 1 · p + 0 · (1 − p) = p$
$E(X^2) = E(X) = p$
$\text{Var(X)} = E(X^2) − [E(X)]^2 = p(1 − p)$
$ψ(t)=E(e^{tX})=pe^t +(1−p)$ for $ −∞<t <∞$

**Binomial Distribution**
$$f (x|n, p) = \left( \begin{matrix} n \\ x \end{matrix} \right)  p^x(1 − p)^{n−x}$$ for $$x = 0, 1, 2, . . . , n$$
If the r.v.s $X_1, . . . , X_n$ form $n$ Bernoulli trials with parameter $p$, and if $X = X_1 + . . . + X_n$, then $X$ has the binomial distribution with parameters $n$ and $p$.
$E(X)= \sum_{i=1}^n E(X_i)=np$
$\text{Var}(X) = \sum^n_{i=1}\text{Var}(X_i ) = np(1 − p)$
$ψ(t)=E(e^{tX})=\Pi_{i=1}^n E(e^{tX_i})=(pe^t +1−p)^n$

**Poisson Distributions**
A r.v. $X$ has the Poisson distribution with mean $λ$ if the p.f. of $X$ is as follows: 
$f(x|\lambda)=\frac{e^{-\lambda}\lambda^x}{x!}$ for $x=0,1,2,..$ mean is $\lambda$ while variance is also $\lambda$

**Negative Binomial Distributions**
Suppose that an infinite sequence of Bernoulli trials with probability of success $p$ are available. The number $X$ of failures that occur before the $r$th success has the following p.d.f.: 
$f(x|r,p)=\begin{pmatrix} r+x-1 \\ x \end{pmatrix} p^r(1-p)x$ for $x=0,1,2,...$
This is also defined as the negative binomial distribution with parameters $r$ and $p$ ($r=1,2,... $and $0<p<1$)
If $X$ has the negative binomial distribution with parameters $r$ and $p$, the mean and the variance of $X$ must be
$E(X)=\frac{r(1-p)}{p}$ and $\text{Var}(X)=\frac{r(1-p)}{p^2}$

**Normal Distributions**
$f(x|\mu,\sigma^2)=\frac1{2\pi^{1/2}\sigma}\exp\left[ -\frac12(\frac{x-\mu}{\sigma})^2 \right]$
The normal distribution with mean 0 and variance 1 is called the standard normal distribution. 

Let $X$ have the normal distribution with mean $μ$ and variance $σ^2$. $F$ be the c.d.f. of $X$. Then $Z=(X−μ)/σ$ has the standard normal distribution, and, for all $x$ and all $0 < p < 1$, $F(x)=\Phi(\frac{x-\mu}{\sigma})$, 

The variable $a_1X_1+...+a_kX_k +b$ has the normal distribution with mean $a_1μ_1+...+a_kμ_k +b$ and variance $a^2_1σ_1^2 + . . . + a^2_kσ_k^2$. 

$X_1, . . . , X_n$ form a random sample from the normal distribution with mean $μ$ and variance $σ^2$, and let $\bar X_n$ denote sample mean. Then $\bar X_n$ has the normal distribution with mean $μ$ and variance $σ^2/n$.

**Law of Large Numbers** $X_1, . . . , X_n$ form a random sample from a distribution for which the mean is $μ$ and  variance is finite. $\bar X_n$ denote the sample mean. Then  $\bar Xn → μ$ 

**Central Limit Theorem** Sample mean of a large random sample of r.v. with mean $μ$ and finite variance $σ^2$ has approximately normal distribution with mean $μ$ and variance $σ^2/n$.

$\lim_{n\to\infty}\text{Pr}\left[ \frac{\bar X-\mu}{\sigma/n^{1/2}} \le x \right]=\Phi(x)$

CLT for Bernoulli: $Yn=\frac{\sum X - \sum p}{(\sum p(1-p))^{1/2}}$ then we have $\lim _{n\to \infty} \text{Pr}(Y_n\le x)=\Phi(x)$
















### Additional Content from Previous Cheat Paper

**Conditional Distributions**

$$g_2(y|x)=\frac{f(x,y)}{f_1(x)}$$

