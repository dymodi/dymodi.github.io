---
layout: single
title: "RNN and LSTM"
permalink: /blog/MLfolds/deep-learning/RNN-LSTM/
classes: wide
author_profile: true
use_math: true
date: 19/5/29
---


A beginner' guide on RNN and LSTM can be found [here](https://skymind.ai/wiki/lstm) and [here](https://colah.github.io/posts/2015-08-Understanding-LSTMs/).  

Recurrent nets are a type of artificial neural network designed to recognize patterns in sequences of data, such as text, genomes, handwriting, the spoken word, or numerical times series data emanating from sensors and stock markets. These algorithms take time and sequence into account, they have a temporal dimension.

The core idea of RNN is that input at $$t-1$$ will become part of the model at time $$t$$ .

LSTM is proposed to solve the vanishing gradients in traditional RNN. 

Another shortcoming of the RNN is that it cannot hold long-term memory.

## LSTM

The key to LSTMs is the cell state, which is kind of like a conveyor belt.

Besides, the LSTM does have the ability to remove or add information to the cell state, carefully regulated by structures called gates. In the following, $$x_t$$ is the inputs, $$h_t$$ is the outputs, and $$C_t$$ is the memory of LSTM: cell.

**Forget gate**

$$f_t=\sigma(W_f\cdot[h_{t-1},x_t]+b_f)$$

**Inpute gate**

$$i_t=\sigma(W_i\cdot[h_{t-1},x_t]+b_i)$$

$$\tilde C =\tanh (W_c\cdot[h_{t-1},x_t]+b_C)$$

**Update cell**

$$C_t=f_t*C_{t-1}+i_t*\tilde C_t$$

**Output gate**

$$o_t=\sigma(W_o\cdot[h_{t-1},x_t]+b_o)$$

$$h_t=o_t*\tanh(C_t)$$

### Variants on LSTM

One popular LSTM variant, introduced by [Gers & Schmidhuber (2000)](ftp://ftp.idsia.ch/pub/juergen/TimeCount-IJCNN2000.pdf), is adding “peephole connections.” This means that we let the gate layers look at the cell state.

$$f_t=\sigma(W_f\cdot[\pmb{C_{t-1}}, h_{t-1},x_t]+b_f)$$

$$i_t=\sigma(W_i\cdot[\pmb{C_{t-1}}, h_{t-1},x_t]+b_i)$$

$$o_t=\sigma(W_o\cdot[\pmb{C_{t-1}}, h_{t-1},x_t]+b_o)$$

A slightly more dramatic variation on the LSTM is the Gated Recurrent Unit, or GRU, introduced by [Cho, et al. (2014)](http://arxiv.org/pdf/1406.1078v3.pdf).



## Ref.

[Keras](https://keras.io/layers/recurrent/)

