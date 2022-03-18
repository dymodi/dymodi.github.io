---
layout: single
title: "Research"
permalink: /research/
classes: wide
author_profile: true
---

I am broadly interested in the **Cyber-Physical Systems** (also known as **Internet of Things**) and **Human Centered Computing** from *Mobile* and *Ubiquitous Computing* perspectives with applications in *Smart Cities*. 

<p><img src="/assets/images/Research/vision.png"
height="150"
alt="Research Vision">
<figcaption>Research Vision</figcaption> 
</p>

As shown in the figure, my works involve all three phases in the **human-centered cyber-physical systems** framework, i.e., sensing, prediction, and decision-making. Focused on the interaction between the couriers and the delivery system, I have solved multiple essential problems in on-demand delivery.

#### aBeacon, a 3-year Citywide Wireless Beacon System [NSDI'21]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/physical-beacon-diagram.png" alt="aBeacon System" style="float: left; width: 20em;">
</p>
<p>aBeacon is an operational indoor sensing system to infer the indoor status of  couriers, e.g., arrival and departure at the merchants based on Bluetooth.</p>
<p>aBeacon consists of customized BLE devices at 12,109 merchants, interacting with 109,378 couriers to infer their status to assist the scheduling of 64 million delivery orders for 7 million customers with a total amount of $600 million order values.</p>

[[PDF](https://www.usenix.org/system/files/nsdi21spring-ding.pdf)], [[Dataset](https://tianchi.aliyun.com/dataset/dataDetail?dataId=76359)], [[Video](https://www.youtube.com/watch?v=PV9MUVwGw8o)]

<p class="clear"> </p>

#### VALID, a  Nationwide Arrival Detection System [SIGCOMM'21]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/virtual-beacon-deployment.png" alt="VALID System" style="float: left; width: 20em;">
</p>
<p>We explore to use merchants’ smartphones under their consent as a virtual infrastructure to design, build, deploy, and operate VALID, a Bluetooth-based indoor status detection system, from in-lab conception to nationwide operation.</p>
<p>During its full nationwide operation, VALID consists of virtual devices at 3 million shops and restaurants, to infer and influence 1 million couriers’ behavior, and assist the scheduling of 3.9 billion orders for 186 million customers. We also share the lessons on system evolution, reliabilty, and human-system synergy in the wild.</p>

[[PDF](https://dl.acm.org/doi/pdf/10.1145/3452296.3472911)], [[Dataset](https://tianchi.aliyun.com/dataset/dataDetail?dataId=103969)]

<p class="clear"> </p>

#### A City-Wide Crowdsourcing Delivery System with Reinforcement Learning [UbComp'21]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/hitchhiking.png" alt="Hitchhiking System" style="float: left; width: 20em;">
</p>

<p>We design a crowdsourcing delivery system based on public transport, considering practical factors of time constraints, multi-hop delivery, and profits. We build a reinforcement learning model to learn the optimal dispatching strategies from historical data. Compared with  widely-used baselines, we achieve a 40% increase in profit rates and a 29% increase in delivery rates.</p>

[[PDF](https://dl.acm.org/doi/pdf/10.1145/3478117)], [[Dataset](https://tianchi.aliyun.com/dataset/dataDetail?dataId=106807)]

<p class="clear"> </p>

#### SmartLoc, Indoor Travel Time Estimation via Smartphone Anchors [UbiComp'22]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/smartloc.png" alt="Hitchhiking System" style="float: left; width: 20em;">
</p>

<p>We design, implement and evaluate SmartLOC, a map-free localization system that employs merchants’ smartphones as anchors to estimate couriers’ travel time to all merchants. We build indoor shop graphs for each mall, and adopt graph embedding to extract indoor shops’ topology. We evaluate SmartLOC in two  malls in Shanghai and show it can improve
the accuracy of travel time estimation by 20%~80% compared with baselines.</p>

[[PDF](https://dl.acm.org/doi/pdf/10.1145/3494972)]

<p class="clear"> </p>

#### P2Loc, A Person-2-Person Indoor Localization System [UbiComp'22]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/p2loc.png" alt="P2Loc Problem Setting" style="float: left; width: 20em;">
</p>

<p>We design a person-to-person localization system that can (1) detect encounter events via Bluetooth on smartphones, and (2) infer couriers’ relative locations to all the indoor merchants via deep learning on a graph neural network. The system is infrastructure-free, map-free, and compatible for off-the-shelf devices.</p> <br> [[Dataset](https://tianchi.aliyun.com/dataset/dataDetail?dataId=119097)]

<p class="clear"> </p>

<!-- ## Literature Surveys

[Literature Surveys](/research/Literature-Survey/)
 -->
