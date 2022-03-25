---
layout: post
title: Basic Concepts of Graph Theory
date: Nov. 1, 2017
author: Yi DING
---

The definitions here mainly follow Prof. Grinberg's [Graph Theory course](http://www-users.math.umn.edu/~dgrinber/5707s17/) in UMN. 

Some of the notation and definitions come from Diestel's [book](http://www.esi2.us.es/~mbilbao/pdffiles/DiestelGT.pdf).

If $$S$$ is a set, then the *powerset* of $$S$$ means the set of all subsets of $$S$$. This
powerset will be denoted by $$\mathcal P (S)$$. For example, the powerset of $$\{1, 2\}$$ is
$$\mathcal P(\{1, 2\}) = \{\emptyset, \{1\} , \{2\} , \{1, 2\}\}$$.

Furthermore, if $$S$$ is a set and $$k$$ is an integer, then $$\mathcal P_k (S)$$ shall mean the set of all $$k$$-element subsets of $$S$$. (This is empty if $$k < 0$$.)

**Graph**

**Definition:** A *simple graph* is a pair $$(V, E)$$, where $$V$$ is a finite set, and where $$E$$ is a subset of $$\mathcal P_2(V)$$.



**Digraph**



**Directed Acyclic Graph, DAG**



**Bipartite Graph**

**Definition:** A [bipartite graph](http://mathworld.wolfram.com/BipartiteGraph.html), also called a bigraph, is a set of graph vertices decomposed into two disjoint sets such that no two graph vertices within the same set are adjacent. A bipartite graph is a special case of a $$k$$-partite graph with $$k=2$$. 



**Hamiltonian Path (Cycle)**

**Definition:** A *Hamiltonian path* is a path that visits each vertex of the graph exactly once. 

Note that determining whether Hamiltonian paths and cycles exist in graphs is the Hamiltonian path problem, which is NP-complete.



**Eulerian Tour**

**Definition:** A closed walk in a graph is called an *Euler tour* if it traverses every edge of the graph exactly once. A graph is *Eulerian* if it admits an Euler tour.



**Matching**

A set $$M$$ of independent edges in a graph $$G =(V,E)$$ is called a *matching*. $$M$$ is a matching of $$U \sube V$$ if every vertex in $$U$$ is incident with an edge in $$M$$. The vertices in $$U$$ are then called *matched* (by $$M$$); vertices not incident with any edge of $$M$$ are *unmatched*.



**Colouring**

**Definition:** A *vertex colouring* of a graph $$G =(V,E)$$ is a map $$c: V\to S$$ such that $$c(v) \ne c(w)$$ whenever $$v$$ and $$w$$ are adjacent. The elements of the set $$S$$ are called the available *colours*.



**Flow**

