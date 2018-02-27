---
layout: post
title: Cheat Paper 1 - Stat 5101
date: Feb. 1, 2018
author: Yi DING
---

Cheat Paper 1

**Sample space**: run one experiment, put all possible outcomes together, it forms the sample space of this experiment.

- Eg. Flip a coin. $$S = \{H, T\}$$
- Eg. Roll a die, $$S = \{1, 2, 3, 4, 5, 6\}$$

An **event** is a subset of the sample space.

- Eg. Roll a dice, $$E = \{6\}$$

**Set theory**

1. Communitive law
   $$A \cup B = B \cup A, A \cap B = B \cap A$$

2. Assosiation law 
   $$(A \cup B ) \cup C = A \cup ( B \cup C )$$, $$(A \cap B ) \cap C = A \cap ( B \cap C )$$

3. Distribution law
   $$A \cap ( B \cup C ) = (A \cap B ) \cup (A \cap C )$$, $$A \cup ( B \cap C ) = (A \cup B ) \cap (A \cup C )$$

4. De Morgan’s laws
   $$(A \cup B )^c = A^c \cap B ^c$$, $$(A \cap B )^c = A^c \cup B ^c$$

5. Partitioning a Set
   For every two sets $$A$$ and $$B$$, $$A \cap B$$ and $$A \cap B^c$$ are disjoint and $$A = (A\cap B)\cup (A\cap B^c)$$

**The Definition of Probability**
For every infinite sequence of disjoint events $$A_1, A_2, ... $$, $$\text{Pr}\left( \cup _{i=1}^\infty A_i \right) = \sum _{i=1}^\infty \text{Pr}(A_i)$$

For every event $$A$$, $$\text{Pr}(A^c) = 1 − \text{Pr}(A)$$.

If $$A \subset B$$, then $$\text{Pr}(A) \le \text{Pr}(B)$$.

For every two events $$A$$ and $$B$$, $$\text{Pr}(A\cap B^c)=\text{Pr}(A)−\text{Pr}(A\cap B)$$.

For every two events $$A$$ and $$B$$, $$\text{Pr}(A\cup B)=\text{Pr}(A) + \text{Pr}(B)−\text{Pr}(A\cap B)$$.

$$P(A\cup B \cup C) = P(A) + P(B) + P(C) - P(AB) - P(BC) - P(CA) + P(ABC)$$

**Bonferroni Inequality** 
For all events $$A_1, A_2, ... $$, $$\text{Pr}\left( \cup _{i=1}^n A_i \right) \le \sum _{i=1}^n \text{Pr}(A_i)$$, $$\text{Pr}\left( \cap_{i=1}^n A_i \right) \ge 1- \sum _{i=1}^n \text{Pr}(A_i^c)$$

**Permutations**
Suppose that a set has $$n$$ elements. Suppose that an experiment consists of selecting $$k$$ of the elements one at a time without replacement. Let each outcome consist of the $$k$$ elements in the order selected. Each such outcome is called a *permutation of $$n$$ elements taken $$k$$ at a time*. We denote the number of distinct such permutations by the symbol $$P_{n,k}$$.

$$P_{n,k} = n(n-1)...(n-k+1)$$

$$P_{n,k} = \frac{n!}{(n-k)!}$$

**The Birthday Problem**

The probability $$p$$ that at least two of the people will have the same birthday is therefore 

$$p=1-\frac{P_{365,k}}{365^k} = 1-\frac{(365)!}{(365-k)!365^k}$$

**Combinations**

Consider a set with n elements. Each subset of size $$k$$ chosen from this set is called a combination of $$n$$ elements taken $$k$$ at a time. We denote the number of distinct such combinations by the symbol $$C_{n,k}$$.

$$C_{n,k}=\frac{P_{n,k}}{k!}=\frac{n!}{k!(n-k)!}$$

**Binomial Theorem**. 

For all numbers $x$ and $y$ and each positive integer $n$, $$(x+y)^n = \sum^n_{k=0}\left( \begin{matrix} n \\ k \end{matrix} \right) x^k y^{n-k} $$.

**Multinomial Coefficients**

The number $$\frac{n!}{n_1!n_2!...n_k!}$$, which we shall denote by $$\left( \begin{matrix} n \\ n_1, n_2, …, n_k \end{matrix} \right)$$

**Multinomial Theorem**. For all numbers $$ x_1, ..., x_k $$ and each positive integer $$n$$, $$(x_1+...+x_k)^n = \sum\left( \begin{matrix} n \\ n_1, n_2, …, n_k \end{matrix} \right) x_1^{n_1}x_2^{n_2}...x_k^{n_k}$$.

**Conditional Probalbility** $\text{Pr}(A|B)=\frac{\text{Pr}(A\cap B)} {\text{Pr}(B)}$

Multiplication Rule for Conditional Probabilities. If $$\text{Pr}(B)>0$$, then $$\text{Pr}(A\cap B) = \text{Pr}(B)\text{Pr}(A|B)$$

**Independence of Two Events**: $$\text{Pr}(A\cap B) = \text{Pr}(A) \text{Pr}(B)$$

**Independence of Complements**: If two events $$A$$ and $$B$$ are independent, then the events $$A$$ and $$B^c$$ are also indepen-

**Conditional Independence**: We say that events $$A_1, . . . , A_k$$ are conditionally independent given $$B$$ if, for every subcollection $$A_{i1}, . . . , A_{ij}$$ of $$j$$ of these events $$(j = 2,3,...,k)$$,

$$ \text{Pr}\left( A_{i1} \cap ... \cap A_{ij} \mid B \right) = \text{Pr}(A_{i1}|B)...\text{Pr}(A_{ij}|B) $$

**Bayes’ Theorem**
Let the events $$B_1, ..., B_k$$ form a partition of the space $$S$$ such that $$\text{Pr}(B_j) > 0$$ for $$j =1,...,k$$, and let $$A$$ be an event such that $$\text{Pr}(A)>0$$. Then, for $$i = 1, . . . , k,$$
$$\text{Pr}(B_i|A) = \frac{\text{Pr}(B_i)\text{Pr}(A|B_i)}{\sum^k_{j=1}\text{Pr}(B_j)\text{Pr}(A|B_j)}$$

**Binomial Distributions**

**Uniform Distributions on Intervals**

**PDF**

**CDF**

**Quantile Function**

$$F^{-1}(x)$$: Inverse of CDF.

**Bivariate r.v.s.**: $$X$$ and $$Y$$
