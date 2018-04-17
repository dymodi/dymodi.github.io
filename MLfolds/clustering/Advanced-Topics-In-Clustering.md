---
layout: post
title: Advanced Topics in Clustering
date: April. 10, 2018
author: Yi DING
---

<style>
.tablelines table, .tablelines td, .tablelines th {
    border: 1px solid black;
    border-collapse: collapse;
        }
</style>

In this post we talk about some advanced topics in clustering I learned from [Data Mining course](https://www-users.cs.umn.edu/~kumar001/dmbook/index.php) at UMN.



### Soft (Fuzzy) Clustering

#### EM algorithm

Initializethe parameters

**Repeat**

​	For each point, compute itsprobability under each distribution

​	Using these probabilities, updatethe parameters of each distribution

**Until** there is no change

Problems with EM:

* Convergence can be slow
* Only guarantees finding local maxima

#### SOM: Self-Organizing Maps

* Centroid based clustering scheme
* Like K-means, a fixed number of clusters are specified
* However,the spatial relationship of clusters is also specified, typically as a grid 
* Points are considered one by one
* Each point is assigned to the closest centroid
* Other centroids are updated based on their nearness to the  closest centroid

#### Clique Algorithm




