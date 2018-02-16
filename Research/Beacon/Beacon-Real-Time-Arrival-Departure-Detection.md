---
layout: post
title: Real-Time Arrival Departure Detection
date: Feb. 4, 2018
author: Yi DINGReal-Time Arrival Departure Detection
---

# Real-Time Arrival Departure Detection

<p align = "center">Yi Ding</p>

## Why "Arrival/Departure Detection" instead of "Indoor Localization"

* Localization needs multiple beacon deivces installed nearby, which is not applicable in real world for large scale applcaition like city-range food delivery system.
* RSSI fluctuation (fast fading) makes BLE beacon not suitable for indoor localization. This is also supported by our experiment as well as Apple's claim in the technique report.

## Why not simple filtering
In the [beacon filtering blog](https://dymodi.github.io/Research/Beacon/Beacon-Filtering), we discuss the arrival and departure detection using filtering. However, this method is an off-line method based on the entire dataset. While in some scenarios, such as rider dispatching, we need **real time** information of people's arrival and departure at some indoor/outdoor environment.

In this post,  we discuss real time arrival departure detection using beacon RSSI data. We will illustrate several techniques to achieve this.

## Short range low pass filter
For the short range low pass filter method, we assign a low pass filter to each rider-shop-pair and move the filter as time goes on.

For a specific (rider, shop) pair, the raw RSSI values are as follows

<p align = "center">
<img src="figures/rssi-for-specific-shop-10-minutes.png" height="300">
</p>

We can design a low pass filter based on what we have discussed in the [beacon filtering blog](https://dymodi.github.io/Research/Beacon/Beacon-Filtering).

Here we choose a digital Butterworth low-pass filter with the following form:

<p align = "center"> 
$$ G(z)=\frac{B(z)}{A(z)} = \frac{b(1)+b(2)z^{-1}+…+b(n+1)z^{-n}}{a(1)+a(2)z^{-1}+…+a(n+1)z^{-n}}  $$
</p>

We set the cutoff frequency as $$\omega_c=0.1$$ since the sampling frequency of the system is $$f_s=1\text{Hz}$$, we assume that signal changes faster than $$\omega_c$$ is due to fast fading but not human movements. The frequency response plot of the filter is as follows:

<p align = "center">
<img src="figures/butterworth.png" height="300">
</p>

If we don't need the rider's real-time arrival/departure information, we can design an offline filter working on the entire dataset. The result will be like follows:

<p align = "center">
<img src="figures/rssi-for-specific-shop-10-minutes-filtered.png" height="300">
</p>

After the filter and shaving, the result are as follows:

<p align = "center">
<img src="figures/in-region-results.png" height="300">
</p>

By introducing a short range moving window low pass filter (LPF),  we can set a window (say 30 seconds) and filter the RSSI value in the window and do the in-region recongnition and decide the arrival/departure momoments.

The real-time filtered RSSI values with short range LPF is as follows:

<p align = "center">
<img src="figures/rssi-for-specific-shop-10-minutes-short-range.png" height="300">
</p>

The result of in region detection is as follows:

<p align = "center">
<img src="figures/in-region-results-short-range-LPF.png" height="300">
</p>

Compared to offline filtering, there are some performance degredation.


This method (moving window LPF) can give us an relative accurate method (compared with offline detection), but is too complicated to maintain for large system, given tens of thousands of riders and restaurants working at the same time. That is, we need some more light-weight application that can achieve arrival/departure detection.

## Light weight arrival/departure detection algorithm

One possiblity is single moving filter for one rider (but not rider-shop pair). Since we assume **the rider can only be at one shop at any time**.

The following is the figure of this rider's rssi with multiple near by shops.

<p align = "center">
<img src="figures/rssi-multiple-shops.png" height="300">
</p>

So the question becomes, how can we decide which shop is the rider in at each time instance. In order to do this, we might need to review some related works on BLE-based prescence detection.

## Bayesian Estimation on Rider's Arrival

Since rider's position is dynamic and related to many POIs in real world, we can use the Bayesian estimation for the possiblity of rider's prescence in the around shops. 

Given the fast fading nature of BLE RSSI, it's diffcult to conclude that the rider is in or not in the shop, however, the signal strength does give us some information to measure the probablity  of rider in the shop. In this case, Bayesian updating would be a good choice to estimate the possiblity of rider's prescence in the shop. Historical information (in the short range) acts as prior while real-time information can be used to update the possibility.

We define the following events:

$$A_i^j: $$ Rider $$i$$ is in shop $$j$$.

$$R_i^j: $$ The RSSI value of rider $$i$$ to shop $$j$$.

What we want to compute is that for all the nearby shops: $$j\in\{1,2,…,k\}$$, the values of $$\text{Pr}(A_i^j\mid R_i^j)$$ given the real-time $$R_i^j$$.

According to Bayes Rule, we have

$$\text{Pr}(A_i^j|R_i^j) = \frac{\text{Pr}(R_i^j|A_i^j)\text{Pr}(A_i^j)}{\text{Pr}(R_i^j)}$$

Here $$\text{Pr}(R_i^j\mid A_i^j)$$ is called the likelihood. It has been studied in many literature that we can use a emperical equation to describe the relation between distance and RSSI. 

For online detection, prior $$\text{Pr}(A_i^j)$$ is the posterior in the last time instance, i.e. our estimation so far. 



