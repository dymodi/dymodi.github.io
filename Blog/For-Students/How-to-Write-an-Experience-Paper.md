---
layout: single
classes: wide
title: How to Write an Experience Paper
permalink: /for-students/how-to-write-an-experience-paper/
author_profile: true
date: Jan. 06, 2020
---



When writing a research paper, keep the following in mind (guideline from NSF for proposal writing):

- The importance of the problems addressed
- The novelty of the proposed solutions
- The technical depth
- The potential impact



In an experience paper, we usually conduct **measurement studies** on an interesting and typical system built by ourselves.

It will be better if the paper focuses on one or two very **counterintuitive** observations that can change the existing understanding of the technology in the community. Otherwise, some small new findings or contextual impactors are also acceptable.

According to the CFP of *MobiCom* experience paper, in the experience paper we share to the community the experiences with the **implementation**, **deployment**, and **operations** of a real world system. Desirable papers are expected to contain real data as well as descriptions of the **practical lessons learned**. The experience papers will be evaluated by the program committee, primarily for (i) richness of their data or experiences, (ii) inferences drawn or lessons learned, (iii) discovery of new problems, and (iv) their impact/potential impact on current and future mobile systems and wireless networks, as well as on society. 

According to the CFP of *NSDI* Operational Systems Track paper, the experience paper "describes the **design**, **implementation**, **analysis**, and **experience** with **large-scale**, **operational** systems and networks. " Moreover, "papers that disprove or strengthen existing assumptions, deepen the understanding of existing problems, and validate known techniques at scales or environments" are encouraged.

## Introduction

* Background of the technologies to be discussed (e.g. WSN/LORA/Beacon).
  * E.g., how do we map a real-world problem to existing technologies?
* Background of the application (delivery/wildlife tracking)
  * Your application must be of value and suitable for the technology.
* Additional challenges when introducing the technologies to real-world applications.
* Trade-offs in the real world:
  * Hardware cost (storage, battery, etc.)
  * Energy efficiency
  * Scalability
  * Robustness
  * Security
  * Compatibility
  * Reliability
* A simple introduction to the system
  * Contributions ... 

## Related Works

The related works here might be more comprehensive compared to technical papers.

## Design Goal/Problem Formulation

It can be emphasized that the project is a collaboration between researchers and industry.

* Practical design goal(requirement) proposed by the commercial(industrial) section
* How do we implement the system toward the design requirement
  * Some new metrics can be defined for the problem.
  * How we set the parameters in design to cater to the requirements.
* Requirements in the real world can be one or more of the following:
  * Reliability (Recall)
  * Hardware cost 
  * Operation lifetime (years or months)
  * Compatibility (feasible for different smartphone models and different places)
  * Security (free from malicious war-driving and free-riders)
  * Maintenance-free (no need for human interference)

## Implementation/Deployment/Operation

* An overview of the system.
* Usually, we have many choices for a specific module in designing the system, such as wireless protocol or battery; we need to clarify why we use this one instead of others. The reasons can be cost, weight or any other limitations.
* Some interesting technical details in building the system, such as hardware, software, protocol

## Measurement Methodology

* Data gathered
* Metrics (Y axis)
* Impacting parameters (X-axis)
* Baselines (Legends)

## Evaluation Results/Observations

Evaluation results.

## Discussion/Lessons Learned

* Limitations of existing solutions, that are also the guide for future research directions.
* Observations that indicate inaccurate assumptions in existing works, which can be system-level or technical details.
* New solutions or suggestions that correspond to the observations found.
* Data to be released to the community.