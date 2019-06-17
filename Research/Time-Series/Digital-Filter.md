---
layout: post
title: Digital Filter
date: June 17, 2019
author: Yi DING
---

Digital filter can be used to process time series data. Some contents comes from the [introduction]([http://123.physics.ucdavis.edu/week_5_files/filters/digital_filter.pdf](http://123.physics.ucdavis.edu/week_5_files/filters/digital_filter.pdf)).

In signal processing, the function of a *filter* is to remove unwanted parts of the signal, such as random noise, or to extract useful parts of the signal, such as the components lying within a certain frequency range

**Input**

$$\mathbf{x_0, x_1, x_2, x_3, …, x_n}$$

**Output**

$$\mathbf{y_0, y_1, y_2, y_3, …, y_n}$$



### Examples of simple digital filters

1. Unity gain filter:

   $$\mathbf{y_n}=\mathbf{x_n}$$

2. Simple gain filter:

   $$\mathbf{y_n}= \mathbf{Kx_n}$$

3. Pure delay filter:

   $$\mathbf{y_n}=\mathbf{x_{n-1}}$$

4. Two-term difference filter:

   $$\mathbf{y_n}=\mathbf{x_n}-\mathbf{x_{n-1}}$$

5. Two-term average filter (This is a simple type of low pass filter as it tends to smooth out high-frequency variations in a signal):

   $$\mathbf{y_n}=\frac{\mathbf{x_n+x_{n-1}}}{2}$$



### Order of a digital filter

The *order* of a digital filter is the number of *previous* inputs (stored in the processor's memory) used to
calculate the current output.



### Digital filter coefficients

All of the digital filter examples given above can be written in the following general forms:

* Zero order: $$ \mathbf{y_n=a_0x_n} $$
* First order: $$ \mathbf{y_n=a_0x_n+a_1x_{n-1}} $$
* Second order: $$ \mathbf{y_n=a_0x_n+a_1x_{n-1}+a_2x_{n-2}} $$

The constants $$\mathbf{a_0, a_1, a_2, ...} $$ appearing in these expressions are called the *filter coefficients*. It is the values of these coefficients that determine the characteristics of a particular filter



### Recursive and non-recursive filters

A *recursive* filter is one which in addition to input values also uses previous *output* values. These, like the
previous input values, are stored in the processor's memory.

**Note:** Some people prefer an alternative terminology in which a non-recursive filter is known as an **FIR** (or Finite Impulse Response) filter, and a recursive filter as an **IIR** (or Infinite Impulse Response) filter.



### Order of a recursive (IIR) digital filter

The order of a recursive filter is the largest number of previous input or output values required to compute the current output.



### Coefficients of recursive (IIR) digital filters

A first-order recursive filter can be written in the general form

$$\mathbf{y_n=\frac{(a_0x_n+a_1x_{n-1}-b_1y_{n-1})}{b_0}}$$

The reason for expressing the filter in this way is that it allows us to rewrite the expression in the following
symmetrical form:

$$\mathbf{b_0y_n+b_1y_{n-1}=a_0x_n+a_1x_{n-1}}$$



**Advantages of Digital Filter**

Compared with other methods that can process, 