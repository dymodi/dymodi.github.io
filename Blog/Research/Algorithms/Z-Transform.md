---
layout: post
title: Z-Transform
date: June 10, 2019
author: Yi DING
---

We need first review some related concepts:

* **Laplace transform:** It transforms a function of a real variable $$t$$ (often time) to a function of a [complex variable](https://en.wikipedia.org/wiki/Complex_analysis) $$s$$ ([complex frequency](https://en.wikipedia.org/wiki/Complex_frequency)).
* Fourier transform: 
* **Z-transform** converts a [discrete-time signal](https://en.wikipedia.org/wiki/Discrete-time_signal), which is a sequence of real or complex numbers, into a complex [frequency-domain](https://en.wikipedia.org/wiki/Frequency-domain) representation.





### Unilateral Z-transform

$$X(z)=Z\{x[n]\}=\sum_{n=0}^\infty x[n]z^{-n}$$



Unfortunately, there is no off-the-shelf python library for Z-tranform computation. 

(A possible alternative is the Chirp z-Transform algorithm)

Further discussion is remain to be continued.

