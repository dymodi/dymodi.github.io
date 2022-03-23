---
author: Yi DING
layout: post
title: Related Works of Crowd Delivery
date: Sep. 21, 2020
---
# Related Works of Crowd Delivery

**Key Words**: Crowd delivery

**Related Topics:** Physical internet / City logistics

**Taxonomy**

* Private cars / Taxi / Public transport / (Twitter data) / Theoretical sutdy
* With time constraints / No time constraints
* With transfers / No transfers
* Solution: Optimization and Approximiation / Graph / Deep Learning

**Comments**

**Individual Papers**

* Crowdphysics, *AAAI 2013*
  * Taxonomy: Twitter data, Graph
  * One of leading work in crowd delivery. Crowd physics is a more generic topic than crowd delivery. 
* TaxiExp, *IEEE 2014*
  * Taxonomy: Taxi, No time constraints, No transfers
  * Two phases, offline + online
* Towards City-scale Mobile Crowdsourcing, *IJCAI 2015*
  * Taxonomy: No data, No time constraints, No transfers
  * Theoretical analysis and routing algorithm, no transportation data or evaluation.
* CrowdDeliver, *IEEE ITS 2016*
  * Taxonomy: Taxi, No time constraints, No transfers
  * Two phases: offline mining historical OD pairs + online taxi scheduling
* Towards enhancing the last-mile delivery, *TRPE 2016*
  * Taxonomy: Taxi and bus, No time constraints, No transfers
  * Modeled as a min-cost flow problem. Bus data are used to model mobility but not as a delivery approach.
* Understanding and assessing crowd logistics business models, *JBIM 2017*
  * Taxonomy: Theoretical sutdy
  * Survey of industrial point of view
* A crowdsource-enabled system for urban parcel relay and delivery, *TRPB 2017*
  * Taxonomy: Truck+Cyclist (Pedestrians)
* Multi-hop driver-parcel matching problem with time windows, *Springer Flex Serv Manuf J 2018*
  * Taxonomy:  Private cars, With time constraints, No transfers,  Heuristic on ILP
  * Good writing on background and related works.
* FooDNet, *IEEE TMC 2018*
  * Taxonomy: Taxi, No transfer, With time constraints
  * Contributions: (1) First work on food delivery with taxis;
* CrowDNet, *IEEE IoT Journal 2019*
  * Taxonomy: Taxi, No tranfers, No time constraints
  * Contribution: Delivery path recommendation based on model portfolio theory.
* Crowdsourced Public Transportation Systems (CPTSs), *IEEE IoT Journal 2019*
  * Taxonomy: Public transport, No time constraints, With transfers, Optimization and Approximiation
  * Motivation: (1) Huge package delivery demand, huge traffic congestion, resource consumption, and environmental pollution; (2) Large amount of under-utilized capacity outside the peak hours in public transportation.
  * Solution: (1) Determining four ID states of packages (waiting, riding, rewaiting, and being unloaded); (2) Heuristic for the NP problem (ILP)
* Planning City-Wide Package Distribution, *IEEE-Access, 2019*
  * Seems to be same as CPTS, *IEEE IoT Journal 2019*
* Car4Pac, *IEEE TITS 2019*
  * Taxonomy: Private cars, No time constraints, No tranfers, Graph
  * Challenges: Parcel delivery cost estimation; order dispatching.
* PPtaxi, *IEEE TMC 2019*
  * Taxonomy: Taxi, With Transfers, Graph, Time contrained not considered in design but evaluated
  * Contribution: Mulit-hop crowd delivery
* CrowdExpress, *IEEE TBD 2020*
  * Taxonomy: Taxi, No time constraints, With transfers
  * Advantages: Lower the cost and accelerate package deliveries simultaneously.
  * Solution: Build a package transport network offline based on the historical taxi GPS trajectory data;



**Researchers**

[Chao Chen, Chongqing University](https://scholar.google.com/citations?hl=en&user=6luJjFQAAAAJ&view_op=list_works&citft=1&email_for_op=dingx447%40umn.edu&gmla=AJsN-F5_ppC2Dy8JW5OY96YaqW8Y6ywddoooEKNsvgv8hcXcvLM-8B8Mj9R2IDe8oNGEjqprjse9U4ladOl2vr4yy9ZuEXhbnUNv8fc6fTnAEvfFicTAiSo)



## Ref.

[AAAI13-Crowdphysics] Sadilek, A., Krumm, J., & Horvitz, E. (2013, June). **Crowdphysics: Planned and opportunistic crowdsourcing for physical tasks**. In *Seventh international AAAI conference on weblogs and social media*.

[IEEE14-TaxiExp] Chen, C., Zhang, D., Wang, L., Ma, X., Han, X., & Sha, E. (2014, December). **TaxiExp: A Novel Framework for City-Wide Package Express Shipping via Taxi Crowd Sourcing**. In *2014 IEEE 11th Intl Conf on Ubiquitous Intelligence and Computing and 2014 IEEE 11th Intl Conf on Autonomic and Trusted Computing and 2014 IEEE 14th Intl Conf on Scalable Computing and Communications and Its Associated Workshops* (pp. 244-251). IEEE.

[IJCAI15] Chen, C., Cheng, S. F., Lau, H. C., & Misra, A. (2015, June). **Towards city-scale mobile crowdsourcing: Task recommendations under trajectory uncertainties**. In *IJCAI*.

[IEEE-ITS16-CrowdDeliver] Chen, C., Zhang, D., Ma, X., Guo, B., Wang, L., Wang, Y., & Sha, E. (2016). **Crowddeliver: planning city-wide package delivery paths leveraging the crowd of taxis**. *IEEE Transactions on Intelligent Transportation Systems*, *18*(6), 1478-1496.

[TRPE16] Wang, Y., Zhang, D., Liu, Q., Shen, F., & Lee, L. H. (2016). **Towards enhancing the last-mile delivery: An effective crowd-tasking model with scalable solutions**. *Transportation Research Part E: Logistics and Transportation Review*, *93*, 279-293.

[JBIM-2017] Frehe, Volker, Jens Mehmann, and Frank Teuteberg. "Understanding and assessing crowd logistics business models–using everyday people for last mile delivery." *Journal of Business & Industrial Marketing* (2017).

[TRPB-2017] Kafle, Nabin, Bo Zou, and Jane Lin. "**Design and modeling of a crowdsource-enabled system for urban parcel relay and delivery**." *Transportation research part B: methodological* 99 (2017): 62-82.

[Springer-Flex-Serv-Manuf-J-2018] Chen, Wenyi, Martijn Mes, and Marco Schutten. "**Multi-hop driver-parcel matching problem with time windows**." *Flexible services and manufacturing journal* 30, no. 3 (2018): 517-553.

[IEEE-TMC-2018-FooDNet] Liu, Yan, Bin Guo, Chao Chen, He Du, Zhiwen Yu, Daqing Zhang, and Huadong Ma. "**Foodnet: Toward an optimized food delivery network based on spatial crowdsourcing**." IEEE Transactions on Mobile Computing 18, no. 6 (2018): 1288-1301.

[IEEE-IoT-Journal-2019-CrowDNet] Du, Jing, Bin Guo, Yan Liu, Liang Wang, Qi Han, Chao Chen, and Zhiwen Yu. "**CrowDNet: Enabling a crowdsourced object delivery network based on modern portfolio theory**." *IEEE Internet of Things Journal* 6, no. 5 (2019): 9030-9041.

[IEEE-IoT-Journal-2019-CPTS] Cheng, Geyao, Deke Guo, Jianmai Shi, and Yudong Qin. "**Smart City-Wide Package Distribution Using Crowdsourced Public Transportation Systems**." *IEEE Internet of Things Journal* 6, no. 5 (2019): 7584-7594.

[IEEE-Access-2019] Cheng, Geyao, Deke Guo, Jianmai Shi, and Yudong Qin. "**Planning city-wide package distribution schemes using crowdsourced public transportation systems**." IEEE Access 7 (2018): 1234-1246.

[IEEE-TITS-2019-Car4Pac] Wang, Fangxin, Yifei Zhu, Feng Wang, Jiangchuan Liu, Xiaoqiang Ma, and Xiaoyi Fan. "**Car4pac: Last mile parcel delivery through intelligent car trip sharing**." *IEEE Transactions on Intelligent Transportation Systems* (2019).

[IEEE-TMC-2019-PPtaxi] Chen, Yueyue, Deke Guo, Ming Xu, Guoming Tang, Tongqing Zhou, and Bangbang Ren. "**PPtaxi: Non-stop Package Delivery via Multi-hop Ridesharing**." *IEEE Transactions on Mobile Computing* (2019).

[IEEE-TBD20-CrowdExpress] Chen, C., Yang, S., Liu, W., Wang, Y., Guo, B., & Zhang, D. (2018). **CrowdExpress: A Probabilistic Framework for On-Time Crowdsourced Package Deliveries**. *arXiv preprint arXiv:1809.02897*.