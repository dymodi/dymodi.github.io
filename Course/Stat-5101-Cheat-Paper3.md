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

