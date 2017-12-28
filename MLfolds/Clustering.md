--- 
layout: post
title: Clustering
date: Dec. 27, 2017
author: Yi DING
---

<style>
.tablelines table, .tablelines td, .tablelines th {
    border: 1px solid black;
    border-collapse: collapse;
        }
</style>

[comment]: # (Some contents about clustering

This post is based on the content from [Lecture 6: Partitioning Data into Clusters, Finding Categories in Data - Cosma Shalizi](http://www.stat.cmu.edu/~cshalizi/350-2006/lecture-06.pdf)

As we might have know, clustering is categorize the samples into some parts while we **do not** know the labels initially. Learning problems can be divided into three categories as follows:

|Known classes? |Class labels           |Type of learning problem           |
|---            |---                    |---                                |
|Yes            |Given for training data|Classification; supervised learning|
|Yes            |Hints/feedback         |Semi-supervised learning           |
|No             |None                   |Clustering; unsupervised learning  |
{: .tablelines}

An interesting comment from Cosma Shalizi is that "The point being, even when you have what you are *told* is a supervised learning problem with labeled data, it can be worth treating it as unsupervised learning problem." He has some very impressive reasons for doing so.

## The $$k$$-means algorithm
A simple frame of the $$k$$-means algorithm is shown as follows:

----
1. Guess the number of clusters, $$k$$
2. Guess the location of cluster means
3. Assign each point to the nearest mean
4. Re-compute the mean for each cluster
5. If the means are unchanged, exit; otherwise go back to (3)

----

The objective function for $$k$$-means is the **sum-of-squares** for the clusters:

$$SS \equiv \sum_C \sum_{i\inC} \parallel x_i - m_C\parallel ^2$$