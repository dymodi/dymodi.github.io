---
layout: post
title: Embedding
date: Jan. 3, 2019
author: Yi DING
---



A simple blog on embedding can be found [here](https://towardsdatascience.com/neural-network-embeddings-explained-4d028e6f0526) and Google's tutorial is [here](https://developers.google.com/machine-learning/crash-course/embeddings/video-lecture).

An embedding is a mapping of a discrete - categorical - variable to a vector of continuous numbers. Embeddings are useful because they can *reduce the dimensionality* of categorical variables and *meaningfully represent* categories in the transformed space.

Embeddings have three primary purposes:

1. Finding nearest neighbors in the embedding space. These can be used to make recommendations based on user interests or cluster categories.
2. As input to a machine learning model for a supervised task.
3. For visualization of concepts and relations between categories.

One-hot encoding can be considered as a naive embeddeing method, and it has two obvious drawbacks: *dimensions* and *uninformed*.

## Learning Embedding

Embedding can be learned with a supervised neural network, where we create some loss function to make the similar entities' representations close in the embedded space.

t-Distributed Stochastic Neighbor Embedding (TSNE) is an embedding method for visualization.

One hyperparameter is the dimensions of the embedding, an empirical rule-of-thumb is

$$dimensions\approx \sqrt[4]{possible\ values}$$



## Ref.

