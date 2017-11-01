--- 
layout: post
title: Basic Concepts of Graph Theory
date: Nov. 1, 2017
author: Yi DING
---
[comment]: # (Some basic facts about graph theory)

The definitions here mainly follow Prof. Grinberg's [Graph Theory course](http://www-users.math.umn.edu/~dgrinber/5707s17/) in UMN. 

##  Notations and Conventions
If $S$ is a set, then the *powerset* of $S$ means the set of all subsets of *S*. This
powerset will be denoted by $\mathcal P (S)$. For example, the powerset of ${1, 2}$ is
$\mathcal P({1, 2}) = {\emptyset, {1} , {2} , {1, 2}}$.

Furthermore, if $S$ is a set and $k$ is an integer, then $\mathcal P_k (S)$ shall mean the set of all $k$-element subsets of $S$. (This is empty if $k < 0$.)

**Grpah**
A *simple graph* is a pair $(V, E)$, where $V$ is a finite set, and where $E$ is a subset of $\mathcal P_2(V)$.

