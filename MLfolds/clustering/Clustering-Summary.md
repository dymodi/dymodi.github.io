---
layout: post
title: A Summary of Clustering Methods
date: April. 10, 2018
author: Yi DING
---

<style>
.tablelines table, .tablelines td, .tablelines th {
    border: 1px solid black;
    border-collapse: collapse;
        }
</style>

This post a summary of clustering methods I learned from [Data Mining course](https://www-users.cs.umn.edu/~kumar001/dmbook/index.php) at UMN.

Basically, clustering methods can be divided into two types: **hierarchical** and **partitional**.



## Type of Clusters

**Well-Separated Clusters**

A cluster is a set of points such that any point in a cluster is closer (or more similar) to every other point in the cluster than to any point not in the cluster. 

<p align = "center">
<img src="figures/well-separated.png"  alt="Well separated" height="150">
</p>

**Center-based clusters**

A cluster is a set of objects such that an object in a cluster is closer (moresimilar) to the “center” of a cluster, than to the center of any other cluster.

The center of a cluster is often a **centroid**, the average of all the points in the cluster, or a **medoid**, the most “representative” point of a cluster.

<p align = "center">
<img src="figures/center-based.png"  alt="Center based" height="110">
</p>

**Contiguity-based clusters**

<p align = "center">
<img src="figures/contiguity-based.png"  alt="Contiguity based" height="100">
</p>

A cluster is a set of points such that a point in a cluster is closer (or more similar) to one or more other points in the cluster than to any point not in the cluster.

**Density-based clusters**

<p align = "center">
<img src="figures/density-based.png"  alt="Contiguity based" height="120">
</p>

A cluster is a dense region of points, which is separated by low-density regions, from other regions of high density. 
Used when the clusters are irregular or intertwined, and when noise and outliers are present. 



## Clusters Algorithms

More about K-meanas and Hierarchical clustering can be found in [another post](https://dymodi.github.io/MLfolds/clustering/Clustering).

### K-means Clustering

Sum of Squared Error (SSE) is usually used to evaluate K-means.

$$SSE=\sum_{i=1}^K\sum_{x\in C_i}\text{dist}^2(m_i,x)$$

K-means has problems when clusters are ofdiffering sizes, densities and non-globularshapes.

K-means has problems when the data contains outliers.

Choosing initial centroids is very important for K-means.

### Hierarchical Clustering

Strengths of Hierarchical Clustering: 

* Do not have to assume any particular number of clusters.
* They may correspond to meaningful taxonomies.

Key operation is the computation of the proximity of two clusters.

We have the following ways to define the inter-cluster distances: MIN, MAX, Group Average, Distance
Between Centroids

**MIN: Single link**, can handle non-elliptical shapes.
<p align = "center">
<img src="figures/single-link-strength.png"  alt="Single link strength" height="120">
</p>

However, single link is sensitive to noise and outliers
<p align = "center">
<img src="figures/single-link-weakness.png"  alt="Single link weakness" height="180">
</p>

**MAX: Complete link**, less susceptible to noise and outliers.
<p align = "center">
<img src="figures/complete-link-strength.png"  alt="Complete link strength" height="180">
</p>

The limitations of MAX is:

* Tends to break large clusters
* Biased towards globular clusters

<p align = "center">
<img src="figures/complete-link-weakness.png"  alt="Complete link weakness" height="180">
</p>

**Group Average**: is a compromis between Single and Complete Link.

**Ward's Method**: Similarity of two clusters is based on the increase in squared error when two clusters are merged.

### DBSCAN

lDBSCAN is a density-based algorithm.

* Density = number of points within a specified radius (Eps)
* A point is a **core point** if it has at least a specified number of points (MinPts) within Eps 
  * These are points that are at the interior of a cluster
  * Counts the point itself
* A **border point** is not a core point, but is in the neighborhood of a core point
* A **noise point** is any point that is not a core point or a border point 

<p align = "center">
<img src="figures/dbscan.png"  alt="DBSCAN" height="180">
</p>



**Confusinon Matrix**

