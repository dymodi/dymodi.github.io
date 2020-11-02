---
author: Yi DING
layout: post
title: Related Works of SLAM
date: Oct. 30, 2020
---

**Key Words**: SLAM (Simultaneous Localization and Mapping)

**Taxonomy**

* Methods: 
  * Kalman filter (high computational complexity. [AAAI-2002-FastSLAM]);
  * Particle filter;
* Data Source: 
  * mmWave Radar;
  * Mobile phone sensor (Wi-Fi, Mag., Acc., Gyro.)

**Comments**

* SLAM applications:
  * Applications in all scenarios in which a prior map is not available and needs to be built [IEEE-2016-Tutorial].
* Basic assumptions in SLAM [IEEE-2001-TRA]:
  * The robot equipped with a sensor capable of making measurements of the landmark's locations relative to the robot.
  * The vehicle starts at an unknown location with no knowledge of the location of landmarks in the environment.
  * The kinematic model of the robot is known (direction/speed/distance).
  * The absolute locations of the landmarks are not available.
  * The landmarks are stationary.
  * As the robot moves through the environment (in a stochastic manner) it makes relative observations of the landmarks' location.
* Differences compared with couriers' indoor localization.
  * The kinematic model (direction/speed/distance) of the couriers are unknown. Dead reckoning is impossible duo to high-sampling rate unacceptable.

**Papers**

* A Solution to the Simultaneous Localization and Map Building (SLAM) Problem, *[IEEE-2001-TRA]*, *Highly-cited.* 
  * Taxonomy: Kalman filter; mmWave Radar;
  * Important conclusions:
    * Shows that a converged solution of SLAM is possible.
    * Given the exact location of any one landmark, the location of any other landmark in the map can also be determined with absolute certainty.
* * FastSLAM, *[AAAI-2002-FastSLAM],* *Highly-cited.* 
  * Taxonomy: Particle filter;
  * Acceleterate SLAM with a new algorithm.
* Simultaneous Localization and Mapping: Part I, *[IEEE-2006-Tutorial-1]*, *Highly-cited.* 
  * Tutorial paper. Brief introduction of the SLAM history, formulation and solution.
* Simultaneous localization and Mapping (SLAM): Part II, *[IEEE-2006-Tutorial-2]*, *Highly-cited.* 
  * Tutorial paper. Focus on computational complexity, data association, and environment representation.
* SemanticSLAM, *[IEEE-2016-SemanticSLAM]*
  * Taxonomy: Particle filter, Mobile phone sensors.
  * Leverages the idea that certain locations in an indoor environment have a unique signature on one or more phone sensors.
  * Floorplan needed. 
  * Dead reckoning used to estimated user's kinematic.
* Past, Present, and Future of SLAM, *[IEEE-2016-Tutorial]*, *Highly-cited.* 
  * Very good tutorial/survey paper on the recent progress of SLAM. 
  * Explore the third age of SLAM-- robust perception age -- based on the summary of previous works.
  * The impact of deep learning is also discussed in the paper.

## Ref.

[IEEE-2001-TRA] Dissanayake, MWM Gamini, Paul Newman, Steve Clark, Hugh F. Durrant-Whyte, and Michael Csorba. "**A solution to the simultaneous localization and map building (SLAM) problem**." *IEEE Transactions on robotics and automation* 17, no. 3 (2001): 229-241.

[AAAI-2002-FastSLAM] Montemerlo, Michael, Sebastian Thrun, Daphne Koller, and Ben Wegbreit. "**FastSLAM: A factored solution to the simultaneous localization and mapping problem.**" *Aaai/iaai* 593598 (2002).

[IEEE-2006-Tutorial-1] Durrant-Whyte, Hugh, and Tim Bailey. "**Simultaneous localization and mapping: part I.**" *IEEE robotics & automation magazine* 13, no. 2 (2006): 99-110

[IEEE-2006-Tutorial-2] Bailey, Tim, and Hugh Durrant-Whyte. "**Simultaneous localization and mapping (SLAM): Part II.**" *IEEE robotics & automation magazine* 13, no. 3 (2006): 108-117.

[IEEE-2016-SemanticSLAM] Abdelnasser, Heba, Reham Mohamed, Ahmed Elgohary, Moustafa Farid Alzantot, He Wang, Souvik Sen, Romit Roy Choudhury, and Moustafa Youssef. "**SemanticSLAM: Using environment landmarks for unsupervised indoor localization.**" *IEEE Transactions on Mobile Computing* 15, no. 7 (2015): 1770-1782.

[IEEE-2016-Tutorial] Cadena, Cesar, Luca Carlone, Henry Carrillo, Yasir Latif, Davide Scaramuzza, José Neira, Ian Reid, and John J. Leonard. "**Past, present, and future of simultaneous localization and mapping: Toward the robust-perception age**." *IEEE Transactions on robotics* 32, no. 6 (2016): 1309-1332.





