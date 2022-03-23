---
layout: post
title: Generative Adversarial Networks (GANs)
date: May 29, 2019
author: Yi DING
---


A beginner' guide on GANs can be found [here](https://skymind.ai/wiki/generative-adversarial-network-gan).

Unlike traditional machine learning where we predict labels given a set a features, in GANs, we predict features given the labels. This is also the main difference between generative and discriminative algorithms.

## How GANs work?

Two networks are beating each other:

* A discriminator trying to indentify the instances coming from the generator as fake.
* A generator trying to generate passable instances, to lie without being caught.

<p align = "center">
    <img src="figures/GANs.png"  alt="GAN" height="250">
</p>

*Image credit: [Thalles Silva](https://skymind.ai/wiki/generative-adversarial-network-gan)*

**Generative algorithms**:

- Given a label, they predict the associated features (Naive Bayes)
- Given a hidden representation, they predict the associated features (VAE, GAN)
- Given some of the features, they predict the rest (inpainting, imputation)



## Ref.

