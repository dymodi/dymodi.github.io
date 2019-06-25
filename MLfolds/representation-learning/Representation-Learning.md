---
layout: post
title: Representation Learning
date: June 20, 2019
author: Yi DING
---

## Why we need representation learning?

The success of machine learning algorithms generally depends on data representation [1], although specific domain knowledge can be used to help design representations, sometimes it is difficult to manuelly craft features from raw data collected. Especially when ….

Representation Learning aims to learn representations from data that make it easier to extract useful information for various tasks [2].

According to [3], a good example is that when you are asked to divide CCX by VI, you would begin by converting the numbers to the Arabic numeral representation. That is the importance of representation.

We can think of the suprevised training of feedforward networks as performing a kind of representation learning where in the last hidden layer we can get some more seperable representation of the raw data. 

[comment]: # "In the case of heterogeneous capatiable sensing, we want to learn representations from the raw RSSI data with device proprety, environment feature and user behaivor. One reason why explicitly dealing with repre-sentations is interesting is because they can be convenient to express many general priors about the world around us, i.e., priors that are not task-specific but would be likely to be useful for a learning machine to solve. Specifically, the main prior we want to exploit in this paper is (1) Multiple explanatory factors: device/environment/user; (2) Shared factors across tasks; (3) Temporal and spatial coherence"

## Transfer Learning and Domain Adaptation




## How to conduct representation learning?

### Auto-encoders

An *[autoencoder]((https://www.kaggle.com/shivamb/how-autoencoders-work-intro-and-usecases/notebook))* is a type of artificial neural network used to learn efficient data codings  in an unsupervised  manner. The aim of an autoencoder is to learn a representation (encoding) for a set of data, typically for dimensionality reduction, by training the network to ignore signal “noise”.

The network may be viewed as consisting of two parts: an encoder function $$\pmb{h}=f(\pmb{x})$$ and a decoder that produces a reconstruction $$\pmb{r}=g(\pmb{h})$$.

For undercomplete auto encoders, the learning process is described simply as minimizing a loss function

$$L(\pmb{x},g(f(\pmb{x})))$$

Simple autoencoder may fail in extracting useful information from the dataset due to overfitting, some regularized autoencoders can somehow fix the problem:

* Sparse Autoencoders: $$L(\pmb{x},g(f(\pmb{x})))+\Omega(\pmb{h})$$, where $$\Omega(\pmb{h})$$ is a sparsity penalty over the code layer $$\pmb{h}$$.
* Denoising Autoencoders (DAE): $$L(\pmb{x},g(f(\pmb{\tilde x})))$$, where $$\pmb{\tilde x}$$ is a copy of $$\pmb{x}$$ that has been corrupted by some form of noise.





## Ref.

[1] Bengio, Y., Courville, A., & Vincent, P. (2013). Representation learning: A review and new perspectives. *IEEE transactions on pattern analysis and machine intelligence*, *35*(8), 1798-1828.

[2] Li, Y., Fu, K., Wang, Z., Shahabi, C., Ye, J., & Liu, Y. (2018, July). Multi-task representation learning for travel time estimation. In *Proceedings of the 24th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining* (pp. 1695-1704). ACM.

[3] Goodfellow, I., Bengio, Y., & Courville, A. (2016). *Deep learning*. MIT press.