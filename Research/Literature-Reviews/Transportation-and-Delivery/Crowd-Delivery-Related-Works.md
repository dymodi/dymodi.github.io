---
author: Yi DING
layout: post
title: Related Works of Crowd Delivery
date: July 23, 2019
---
# Related Works of Crowd Delivery

**Key Words**: Crowd delivery

**Taxonomy**

* Private cars, Taxi, Public transport, (Twitter data)
* With time constraints, without time constraints
* With transfers, without transfers

**Comments**

**Individual Papers**

* Crowdphysics, *AAAI 2013*
  * Taxonomy: Twitter data
  * One of leading work in crowd delivery. Crowd physics is a more generic topic compared with crowd delivery. Graph based methods are used.
* TaxiExp, *IEEE 2014*
  * Taxonomy: Taxi, without time constraints, without transfers
  * Two phases, offline + online
* Towards City-scale Mobile Crowdsourcing, *IJCAI 2015*
  * Taxonomy: No data, without time constraints, without transfers
  * Theoretical analysis and routing algorithm, no transportation data or evaluation.
* CrowdDeliver, *IEEE ITS 2016*
  * Taxonomy: Taxi, without time constraints, without transfers
  * Two phases: offline mining historical OD pairs + online taxi scheduling
* Towards enhancing the last-mile delivery, *TRPE 2016*
  * Taxonomy: Taxi and bus, without time constraints, without transfers
  * Modeled as a min-cost flow problem. Bus data are used to model mobility but not as a delivery approach.
* CrowdExpress, *arXiv 2018*
  * Taxonomy: Taxi, without time constraints, with transfers
  * A package transport network was built offline based on the historical taxi GPS trajectory data.



## Ref.

[AAAI13-Crowdphysics] Sadilek, A., Krumm, J., & Horvitz, E. (2013, June). **Crowdphysics: Planned and opportunistic crowdsourcing for physical tasks**. In *Seventh international AAAI conference on weblogs and social media*.

[IEEE14-TaxiExp] Chen, C., Zhang, D., Wang, L., Ma, X., Han, X., & Sha, E. (2014, December). **TaxiExp: A Novel Framework for City-Wide Package Express Shipping via Taxi Crowd Sourcing**. In *2014 IEEE 11th Intl Conf on Ubiquitous Intelligence and Computing and 2014 IEEE 11th Intl Conf on Autonomic and Trusted Computing and 2014 IEEE 14th Intl Conf on Scalable Computing and Communications and Its Associated Workshops* (pp. 244-251). IEEE.

[IJCAI15] Chen, C., Cheng, S. F., Lau, H. C., & Misra, A. (2015, June). **Towards city-scale mobile crowdsourcing: Task recommendations under trajectory uncertainties**. In *IJCAI*.

[IEEEITS16-CrowdDeliver] Chen, C., Zhang, D., Ma, X., Guo, B., Wang, L., Wang, Y., & Sha, E. (2016). **Crowddeliver: planning city-wide package delivery paths leveraging the crowd of taxis**. *IEEE Transactions on Intelligent Transportation Systems*, *18*(6), 1478-1496.

[TRPE16] Wang, Y., Zhang, D., Liu, Q., Shen, F., & Lee, L. H. (2016). **Towards enhancing the last-mile delivery: An effective crowd-tasking model with scalable solutions**. *Transportation Research Part E: Logistics and Transportation Review*, *93*, 279-293.

[arXiv18-CrowdExpress] Chen, C., Yang, S., Liu, W., Wang, Y., Guo, B., & Zhang, D. (2018). **CrowdExpress: A Probabilistic Framework for On-Time Crowdsourced Package Deliveries**. *arXiv preprint arXiv:1809.02897*.