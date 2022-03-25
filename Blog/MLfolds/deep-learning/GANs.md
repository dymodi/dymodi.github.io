---
layout: single
title: "Generative Adversarial Networks (GANs)"
permalink: /blog/MLfolds/deep-learning/GANs/
classes: wide
author_profile: true
use_math: true
date: 19/5/29
---


A beginner's guide on GANs can be found [here](https://skymind.ai/wiki/generative-adversarial-network-gan).

Unlike traditional machine learning where we predict labels given a set of features, in GANs, we predict features given the labels. This is also the main difference between generative and discriminative algorithms.

## How do GANs work?

Two networks are beating each other:

* A discriminator tries to identify the instances coming from the generator as fake.
* A generator trying to generate passable instances, to lie without being caught.
<p>
	<img src="/Blog/MLfolds/deep-learning/figures/GANs.png"
       alt="single-link-better" 
       style="width: 35em;" 
       class="align-center">
</p>


*Image credit: [Thalles Silva](https://skymind.ai/wiki/generative-adversarial-network-gan)*

**Generative algorithms**:

- Given a label, they predict the associated features (Naive Bayes)
- Given a hidden representation, they predict the associated features (VAE, GAN)
- Given some of the features, they predict the rest (inpainting, imputation)

## Ref.

