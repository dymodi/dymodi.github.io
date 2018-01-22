--- 
layout: post
title: Course Note - Stat 5101
date: Jan. 16, 2017
author: Yi DING
---

[comment]: # (This is the course note for course Stat 5101)

### Lec-3, Jan. 22, Mon.
Events and probility (Section 1.5 in the book)

Eg. Flip a coin 3 times
$$S = \{ HHT, HTH, HTT, HHH, THT, TTH, TTT, THH \}$$
$$S_1 = HHH, S_2 = THH, S_3 = HTH, S_4 = HTT, S_5 = THT, S_6 = TTT, S_7 = TTH, S_8 = HHT$$
$$A = \{ \}$$

Easily, $B\cap D = \emptyset$, $B$ and $D$ are **disjoint**.

What is probability?

In general, given sample space $S$ for any event $A\in S$, assign a number $P(A)$ for $A$ s.t.
1. $P(A) \ge 0$
2. $P(S) = 1$
3. $P(\cup ^\infty_{i=1} A_i) = \sum ^\infty_{i=1} P(A_i)$ if $A_1, A_2,..., $ are pairwise disjoint.

We say $P$ is a probability.

If $P$ is a probability:
1. (Proof) $P(\emptyset) = 0$ 
2. (Proof) If $A_1, A_2, ..., A_n$ are pairwise disjoint events, then
$$P(\cup ^n_{i=1} A_i) = \sum ^n_{i=1} P(A_i)$$
3. (Proof) $P(A^c) = 1-P(A)$
4. (Proof) If $A \subset B$, then $P(A) < P(B)$
5. (Proof) For any event $A$ we have $0 \le P(A) \le 1$
6. (Proof) $P(A\cup B) = P(A) + P(B) - P(A\cap B)$

### Lec-2, Jan. 19, Fri.
Set theory (Section 1.4 in the book)
* event
* union & intersection
* complement
* relationship among events
* partition

**Sample space**: run one experiment, put all possible outcomes together, it forms the sample space of this experiment.
* Eg.1 Flip a coin. $S = \{H, T\}$
* Eg.2 Roll a die, $S = \{1, 2, 3, 4, 5, 6\}$
* Eg.3 Randomly select a person whose birthday, $S = \{1, 2, ..., 365\}$
* Eg.4 The life of a bulb, $S = \[0, \infty\)$

An **event** is a subset of the sample space.
* Eg.5 Roll a dice, $E = \{6\}$
* Eg. $A = \{6\}, B = \{1, 3, 5\}, A\cup B = \{1, 3, 5, 6\}$

Def.
* $A \cup B = \{ x \in S, x \in A \text{ or } x \in B \}$
* $A \cap B = \{ x \in S, x \in A \text{ and } x \in B \}$
* $A^c = \{ x \in S, x \notin A \}$

Facts on event:
1. Communitive law
    $A \cup B = B \cup A, A \cap B = B \cap A$   
2. Assosiation law   
    $\(A \cup B \) \cup C = A \cup \( B \cup C \)$   
    $\(A \cap B \) \cap C = A \cap \( B \cap C \)$
3. Distribution law
    $A \cap \( B \cup C \) = \(A \cap B \) \cup \(A \cap C \)$
    $A \cup \( B \cap C \) = \(A \cup B \) \cap \(A \cup C \)$
4.  $\(A \cup B \)^c = A^c \cap B ^c$
    $\(A \cap B \)^c = A^c \cup B ^c$
    
In fact, for many event $E_1, E_2, ..., E_n$, ($n$ can be $\infty$)

$\cap ^n_{i=1} E_i = \{ x\in S, x\in E_i \text{for all} i\}$

$\cup ^n_{i=1} E_i = \{ x\in S, x\in E_i \text{for some} i\}$

Two facts:

$ \(\cap ^n_{i=1} E_i \)^c = \cup ^n_{i=1} E_i ^c$
$ \(\cup ^n_{i=1} E_i \)^c = \cap ^n_{i=1} E_i ^c$

We say $E_1, E_2, ..., E_n$ is a partition of $S$ if they are partition disjoint and $\cup ^n_{i=1} E_i = S$


### Lec-1, Jan. 17, Wed.
Go over syllables.

Contents of this course:
1. Classical model
2. Random variables
3. Independent r.v.s. (random variables)

Ex. on calculaus and linear algebra

1. Series
    * $\sum^{\infty}_{n=1}\frac{\lambda^n}{n!} = ?$
    * $\sum^{\infty}_{n=1}p^n = ? (|p|<1)$
    
2. Limits
    * $\lim \frac{n^2}{(n+2018)^2} = ?$
    
3. Integrals

4. Linear algebra


### Lab-1, Jan. 16, Tues.
TA: Sanhita, sengu045@umn.edu

Office Hour (Ford 495):
* 1:30 - 3:30 pm Tue
* 9:50 - 10:50 am Thurs

