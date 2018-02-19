---
layout: post
title: Cheat Paper 1 - Stat 5101
date: Feb. 1, 2018
author: Yi DING
---

Cheat Paper 1


Set theory (Section 1.4 in the book)
Events and probability (Section 1.5 in the book)
Counting, Permutation (Section 1.7 in the book)

Combination (Section 1.8 in the book)

**Binomial Theorem**. For all numbers $x$ and $y$ and each positive integer $n$, $$(x+y)^n = \sum^n_{k=0}\left( \begin{matrix} n \\ k \end{matrix} \right) x^k y^{n-k} $$.

**Conditional Probalbility** $\text{Pr}(A|B)=\frac{\text{Pr}(A\cap B)} {\text{Pr}(B)}$

Multiplication Rule for Conditional Probabilities. If $\text{Pr}(B)>0$, then $\text{Pr}(A\cap B) = \text{Pr}(B)\text{Pr}(A|B)$



**PDF**

**CDF**

**Quantile Function**

$$F^{-1}(x)$$: Inverse of CDF.

**Bivariate r.v.s.**: $$X$$ and $$Y$$





---




### Lec-7 Jan. 31, Wed.
Inclusion-Exclusion formula.
Show
$$\left( \begin{matrix} n \\ 0 \end{matrix} \right)^2$$


$$P(A\cup B) = P(A) + P(B) - P(AB)$$

$$P(A\cup B \cup C) = P(A) + P(B) + P(C) - P(AB) - P(BC) - P(CA) + P(ABC)$$


### Lec-5, Jan. 26, Fri.
Combination (Section 1.8 in the book)

### Lec-4, Jan. 24, Wed.
Counting, Permutation (Section 1.7 in the book)

### Lec-3, Jan. 22, Mon.
Events and probability (Section 1.5 in the book)

Eg. Flip a coin 3 times

$$S = \{ HHT, HTH, HTT, HHH, THT, TTH, TTT, THH \}$$

$$S_1 = HHH, S_2 = THH, S_3 = HTH, S_4 = HTT, S_5 = THT, S_6 = TTT, S_7 = TTH, S_8 = HHT$$

$$A = \{ \}$$

Easily, $$B\cap D = \emptyset$$, $$B$$ and $$D$$ are **disjoint**.

What is probability?

In general, given sample space $$S$$ for any event $$A\in S$$, assign a number $$P(A)$$ for $$A$$ s.t.
1. $$P(A) \ge 0$$ 
2. $$P(S) = 1$$ 
3. $$P(\cup ^\infty_{i=1} A_i) = \sum ^\infty_{i=1} P(A_i)$$ if $$A_1, A_2,..., $$ are pairwise disjoint.

We say $$P$$ is a probability.

If $$P$$ is a probability:
1. (Proof) $$P(\emptyset) = 0$$ 
2. (Proof) If $$A_1, A_2, ..., A_n$$ are pairwise disjoint events, then

$$P(\cup ^n_{i=1} A_i) = \sum ^n_{i=1} P(A_i)$$

3. (Proof) $$P(A^c) = 1-P(A)$$
4. (Proof) If $$A \subset B$$, then $$P(A) < P(B)$$
5. (Proof) For any event $$A$$ we have $$0 \le P(A) \le 1$$
6. (Proof) $$P(A\cup B) = P(A) + P(B) - P(A\cap B)$$

### Lec-2, Jan. 19, Fri.
Set theory (Section 1.4 in the book)
* event
* union & intersection
* complement
* relationship among events
* partition

**Sample space**: run one experiment, put all possible outcomes together, it forms the sample space of this experiment.
* Eg.1 Flip a coin. $$S = {H, T}$$
* Eg.2 Roll a die, $$S = {1, 2, 3, 4, 5, 6}$$
* Eg.3 Randomly select a person whose birthday, $$S = {1, 2, ..., 365} $$




