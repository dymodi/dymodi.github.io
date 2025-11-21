---
layout: single
title: "Research"
permalink: /research/
classes: wide
author_profile: true
---

<!-- I am broadly interested in **Data Mining** and **Cyber-Physical Systems** (also known as **Internet of Things**) from *Mobile* and *Ubiquitous Computing* perspectives with applications in *Smart Cities* and *Gig Delivery*.  -->

<!-- <p><img src="/assets/images/Research/vision.png"
height="150"
alt="Research Vision">
<figcaption>Research Vision</figcaption> 
</p> -->

<!-- As shown in the figure, my works involve all three phases in the **human-centered cyber-physical systems** framework, i.e., sensing, prediction, and decision-making. Focused on the interaction between the couriers and the delivery system, I have solved multiple essential problems in on-demand delivery. -->

My research interests lie at the intersection of  **mobile computing**, **wireless sensing**, and **machine learning**. I focus on building **perceptive mobile AI** <u>systems</u> that can sense and understand *physical environment* and *human behavior*, enabling intelligent and context-aware <u>applications</u>.

For UTD undegraduate and master student, a list of approachable research topics can be found here: [Approachable Tasks for Senior Undergraduate Students and Master Students](https://utdallas.box.com/s/1mf2iebmor6v7zofnoin2phnrdi8wlsj)

#### A Cross-Platform Measurement Study for Mobile LLM Efficiency on Sensing Tasks [FmSys'25]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/fmsys.png" alt="FmSys Results" style="float: left; width: 20em;">
</p>
<p>We conduct a comprehensive measurement study of LLM deployments across mobile, edge, and cloud platforms using a lightweight sensing application. We evaluate latency, memory, and output quality across model sizes and quantization levels. </p>
<p>Our findings reveal the strict deployability limits of on-device LLMs (≤4B), the risks of model compression, and the significant latency gap between mobile (>30s) and cloud (<10s), providing practical insights for designing future mobile foundation model systems.</p> 


[[PDF](https://dl.acm.org/doi/pdf/10.1145/3722565.3727192)]

<p class="clear"> </p>

#### P2Loc, A Person-2-Person Indoor Localization System [UbiComp'22]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/p2loc.png" alt="P2Loc Problem Setting" style="float: left; width: 20em;">
</p>
<p>We design a person-to-person localization system that can detect encounter events via Bluetooth and infer couriers’ relative locations to all the indoor merchants via deep learning on a graph neural network. The system is infrastructure-free, map-free, and compatible for off-the-shelf devices.</p> 

[[Dataset](https://tianchi.aliyun.com/dataset/dataDetail?dataId=119097)]

<p class="clear"> </p>

#### SmartLoc, Indoor Travel Time Estimation via Smartphone Anchors [UbiComp'22]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/smartloc.png" alt="Hitchhiking System" style="float: left; width: 20em;">
</p>
<p>We design and implement SmartLOC, a map-free localization system that employs merchants’ smartphones as anchors to estimate couriers’ travel time to all merchants. We build indoor shop graphs for each mall, and adopt graph embedding to extract shops’ topology. We evaluate SmartLOC in two malls and it can improve
the travel time estimation accuracy by 20%~80% compared with baselines.</p>

[[PDF](https://dl.acm.org/doi/pdf/10.1145/3494972)]


<p class="clear"> </p>


#### A City-Wide Crowdsourcing Delivery System with Reinforcement Learning [UbComp'21]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/hitchhiking.png" alt="Hitchhiking System" style="float: left; width: 20em;">
</p>

<p>We design a crowdsourcing delivery system based on public transport, considering practical factors of time constraints, multi-hop delivery, and profits. We build a reinforcement learning model to learn the optimal dispatching strategies from historical data. Compared with  widely-used baselines, we achieve a 40% increase in profit rates and a 29% increase in delivery rates.</p>

[[PDF](https://dl.acm.org/doi/pdf/10.1145/3478117)], [[Dataset](https://tianchi.aliyun.com/dataset/dataDetail?dataId=106807)]

<p class="clear"> </p>


#### aBeacon, a 3-year Citywide Wireless Beacon System [NSDI'21]
<p style="float: left; margin-right: 1%; margin-bottom: 0.5em;">
	<img src="/assets/images/Research/physical-beacon-diagram.png" alt="aBeacon System" style="float: left; width: 20em;">
</p>
<p>aBeacon is an operational indoor sensing system to infer the indoor status of  couriers, e.g., arrival and departure at the merchants based on Bluetooth.</p>
<p>aBeacon consists of customized BLE devices at 12,109 merchants, interacting with 109,378 couriers to infer their status to assist the scheduling of 64 million delivery orders for 7 million customers with a total amount of $600 million order values.</p>

[[PDF](https://www.usenix.org/system/files/nsdi21spring-ding.pdf)], [[Dataset](https://tianchi.aliyun.com/dataset/dataDetail?dataId=76359)], [[Video](https://www.youtube.com/watch?v=PV9MUVwGw8o)]

<p class="clear"> </p>




<!-- ## Literature Surveys

[Literature Surveys](/research/Literature-Survey/)
 -->
