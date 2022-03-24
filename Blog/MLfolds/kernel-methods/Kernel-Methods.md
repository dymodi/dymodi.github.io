---
layout: single
title: "Kernel Methods and Multiple Kernel Learning"
permalink: /blog/MLfolds/kernel-methods/Kernel-Methods/
classes: wide
author_profile: true
use_math: true
date: 19/5/31
---

This blog is based on [Wikipedia](https://en.wikipedia.org/wiki/Kernel_method) and Cesar Souze's [blog]([http://crsouza.com/2010/03/17/kernel-functions-for-machine-learning-applications/](http://crsouza.com/2010/03/17/kernel-functions-for-machine-learning-applications/)).

## Kernel Methods

In machine learning, **kernel methods** are a class of algorithms for [pattern analysis](https://en.wikipedia.org/wiki/Pattern_analysis), whose best known member is the [support vector machine](https://en.wikipedia.org/wiki/Support_vector_machine) (SVM). The general task of pattern analysis is to find and study general types of relations (for example [clusters](https://en.wikipedia.org/wiki/Cluster_analysis), [rankings](https://en.wikipedia.org/wiki/Ranking), [principal components](https://en.wikipedia.org/wiki/Principal_components), [correlations](https://en.wikipedia.org/wiki/Correlation), [classifications](https://en.wikipedia.org/wiki/Statistical_classification)) in datasets. For many algorithms that solve these tasks, the data in raw representation have to be explicitly transformed into [feature vector](https://en.wikipedia.org/wiki/Feature_vector) representations via a user-specified *feature map*: in contrast, kernel methods require only a user-specified *kernel*, i.e., a [similarity function](https://en.wikipedia.org/wiki/Similarity_function) over pairs of data points in raw representation. (Wikipedia, 2019).

In comparison, kernel methods map the data into higher dimensional spaces in the hope that in this higher-dimensional space the data could become more easily separated or better structured. This mapping function, however, hardly needs to be computed because of a tool called the [kernel trick](http://en.wikipedia.org/wiki/Kernel_trick). 

**Kernel Trick**

Now, the Kernel trick is really interesting because that mapping does not need to be ever computed. If our algorithm can be expressed only in terms of a [inner product](http://mathworld.wolfram.com/InnerProduct.html) between two vectors, all we need is replace this inner product with the inner product from some other suitable space. That is where resides the “trick”: wherever a dot product is used, it is replaced with a Kernel function. The kernel function denotes an inner product in feature space and is usually denoted as:

$$ K(x,y) =  <\varphi (x),\varphi (y) > $$

**Kernel Properties**

Kernel functions must be continuous, symmetric, and most preferably should have a positive (semi-) definite [Gram matrix](http://mathworld.wolfram.com/GramMatrix.html). Kernels which are said to satisfy the [Mercer’s theorem](http://en.wikipedia.org/wiki/Mercer's_theorem) are [positive semi-definite](http://mathworld.wolfram.com/PositiveSemidefiniteMatrix.html), meaning their kernel matrices have only non-negative Eigen values. The use of a positive definite kernel insures that the optimization problem will be convex and solution will be unique.

However, many kernel functions which aren’t strictly positive definite also have been shown to perform very well in practice. An example is the Sigmoid kernel, which, despite its wide use, it is not positive semi-definite for certain values of its parameters. [Boughorbel (2005)](http://perso.lcpc.fr/tarel.jean-philippe/publis/jpt-icme05.pdf) also experimentally demonstrated that Kernels which are only conditionally positive definite can possibly outperform most classical kernels in some applications.

**Choosing the Right Kernel**

The choice of a Kernel depends on the problem at hand because it depends on what we are trying to model. A polynomial  kernel, for example, allows us to model feature conjunctions up to the order of the polynomial. Radial basis functions allows to pick out circles (or hyperspheres) – in constrast with the Linear kernel, which allows only to pick out lines (or hyperplanes).

**Kernel Functions**

* Linear Kernel 
$$K(x,y)=x^Ty+c$$

* Polynomial Kernel
$$K(x,y)=(\alpha x^Ty+c)^d$$

* Gaussian Kernel
$$K(x,y)=e^{\left( -\frac{\lVert x-y \rVert ^2}{2\sigma^2} \right)} $$

**Libraries**

```sklearn.svm.SVC``` is provided as SVM based classifier with optional kernel  (```linear```,```poly```,```rbf```,```sigmoid``` etc.)

```tf.contrib.kernel_methods``` is also provided in TensorFlow.

## Multiple Kernel Learning (MKL)

[Mehmet Gonen]([http://jmlr.csail.mit.edu/papers/volume12/gonen11a/gonen11a.pdf](http://jmlr.csail.mit.edu/papers/volume12/gonen11a/gonen11a.pdf)) formulate MKL as

$$k_{\eta}(\mathbf x_i, \mathbf x_j)=f_{\eta}(\{ k_m(\mathbf x^m_i, \mathbf x^m_j) \}_{m=1}^P)$$

where $f_\eta$ is a combination function.

According to Mehmet, the reasoning (of MKL) is similar to combining different classifiers: Instead of choosing a single kernel function and putting all our eggs in the same basket, it is better to have a set and let an algorithm do the picking or combination. This shows similarities to ensemble methods (boosting and bagging).

## Ref.

Souza, César R. “Kernel Functions for Machine Learning Applications.” 17 Mar. 2010. Web. <http://crsouza.blogspot.com/2010/03/kernel-functions-for-machine-learning.html>.