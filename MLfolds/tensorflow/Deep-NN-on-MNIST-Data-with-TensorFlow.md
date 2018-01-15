--- 
layout: post
title: Deep NN on MNIST Data with TensorFlow
date: Jan 5, 2017
author: Yi DING
---

In this tutorial, we will basically follow the [official tutorial](https://www.tensorflow.org/get_started/mnist/pros) but will change some parts to make it easier to understand. 

## Convolution Neural Network
Note that, according to [Convolutional Neural Networks for Visual Recognition, Stanford, CS231n](http://cs231n.github.io/convolutional-networks/) "ConvNet architectures make the explicit assumption that the inputs are images".

One reason that we need ConvNN for images is that regular NNs do not scale well to full images.

ConvNN is made up of layers, each layer transform a 3D volumn to another 3D volumn with differentiable functions. Three types of layers are used: **Convolutional Layer**, **Pooling Layer**, and **Fully-Connected Layer** (exactly as seen in regular Neural Networks)

<p align = "center">
<img src="figures/neural_net2.png"  alt="nn" height="400">
<img src="figures/cnn.png"  alt="cnn" height="400">
</p>

