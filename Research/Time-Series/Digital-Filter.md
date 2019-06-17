---
layout: post
title: Digital Filter
date: June 17, 2019
author: Yi DING
---

Digital filter can be use to process time series data. Some contents comes from the [introduction]([http://123.physics.ucdavis.edu/week_5_files/filters/digital_filter.pdf](http://123.physics.ucdavis.edu/week_5_files/filters/digital_filter.pdf)).

In signal processing, the function of a *filter* is to remove unwanted parts of the signal, such as random noise, or to extract useful parts of the signal, such as the components lying within a certain frequency range

**Input**

$$x_0, x_1, x_2, x_3, …, x_n$$

**Output**

$$y_0, y_1, y_2, y_3, …, y_n$$



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

6. 





**Advantages of Digital Filter**

Compared with other methods that can process, 