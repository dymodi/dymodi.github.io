---
layout: post
title: Research Note
date: Sept. 19, 2017
author: Yi DING
---

# Research Note

## Target Conference

| Date       | Conference                | Project                                                      |
| ---------- | ------------------------- | ------------------------------------------------------------ |
| 2018.11.15 | IMWUT                     | [Crowd Delivery](https://github.com/dymodi/dymodi.github.io/blob/master/Research/Paper/Crowd-Delivery/Revision-History.md) |
| 2018.12.1  | MobiSys                   | [Virtual Beacon](https://github.com/dymodi/dymodi.github.io/blob/master/Research/Paper/Virtual-Beacon/virtual-beacon.md) |
| 2018.2.11  | KDD                       | [RL based Dispatching/Routing](https://github.com/dymodi/dymodi.github.io/blob/master/Research/Paper/Rider-Routing/rider-routing.md) |
| 2019.3     | Instant Delivery Proposal | [Instant Delivery](https://github.com/dymodi/Proposal) 可以咨询王帅 |

## Septerber Priorities

* New topics
  * 基于智能餐箱和智能锁的topics，江东哲提的learn from veteran
* Virtual Beacon
  - 和老板讨论，确定solution
* Crowd delivery
  * 初步改，准备投11月的IMWUT
* Time-depdent rider routing
  - 挖掘这个问题能打动老板的创新点，发KDD


## Highlight

* 从系统的角度考虑问题，不要陷入算法和理论的具体方向，那不是长处，也不是重点
* Time-dependent的东西再想想，根据waiting time的特点想新的问题和新的方法，不局限于路径规划。

## Potential Topics

Find topics from DAAG (AI Interst Group) and seek for coorporation.

* Fundamental topics:
  * Virtual Beacon
  * GPS correction based on virtual beacon results
  * ~~Security/Authentication (Hardware related) (Not good idea)~~

* Dispatching and routing
  * Dispatching/Routing with Reinforcement Learning
  * Delivery Map based on Time
  * Dispatching (Traditional and Fetch Delivery Seperation)
  * Robots Delivery
    * Elevator sensing and control
  * UAV Delivery
  * ~~Rider behavior prediction (Done by Yan Zhang)~~ 

* Applications based on data
  - Learn From Veteran: Rider Route Recommendation based on Experienced Riders
  - Monetary Incentive for Riders: Speed and Safety
  - Dangerous Driving Detection with Cellphone Data
  - Red Packet: Study on Monetary Incentive for Consumers
  - Quality of Food: Effect of Time and Temperature
  - What Makes a Good Shop: An Analysis of Shop Lifecycle
  - Detecting XX (Some problems) using Instant Delivery Data
  - Riders/restaurants Clustering
  - Risk Control (Rider cheating / Shop cheating)

  * Auto check-in (Similar to Existence Detection)
  * ~~Human Mobility based on Meal Data (Need further think)~~
  * ~~Meal Need Prediction - Long term and short term (Not appreciated by Tian unless key innovation)~~
  * ~~AOI Recongization (Discussed with Tian but to very appreciated)~~
  * ~~POI Correction (Done by JDZ)~~

* NLP

  * Delivery Issues Clustering


## Progress and Discussion



10/16/18

站会总结：

1. 模型这面正在和佳明对接；
2. shop_in_mall那面感觉很难把准确率做上90%，所以还是准备做成一个特征；
3. 无实体beacon的label方面，DZG尝试用Wi-Fi列表来标签，感觉比商户列表的方法要准确很多；基于这个想法还可以尝试做一个规则模型；
4. 数据那面让季芸来说，两个版本的数据量，特征是否有改进；

今天任务：

1. 和老板讨论我们标签的逻辑
2. 驻店模型遇到一些问题，详见“To-Do-List-and-Problems”。
3. 规划帅哥那面的分工

10/15/18

1. 继续Crowd delivery仿真
2. 推进模型对接

10/8/18 ~ 10/12/18:

1. “shop_in_mall”
   1. 和ZZX讨论了一些方向，不过他尝试之后似乎效果都不够好；
   2. 可以考虑用GPS的信号来源的占比作为判定商户为室内室外的方法。
   3. 老板对于70%左右的结果仍不是满意，希望ZZX那面继续探索，比如联表，调参，规则，其他特征等等。
   4. 如果最后结果能上90%，那可以考虑做成两个模型；否则的话作为一个特征放在现有的模型里就行
2. 无实体beacon的label：
   1. DZG先提了shop_list的想法，有起色但还是不够好，再想想有没有别的方法。
3. 虚拟Beacon监测率：
   1. 看看过去一周检测率变化，尝试找到某个场景检测率能到100%，比如“蓝牙打开”的场景。
   2. 过去一周虚拟Beacon的监听率有所上升。但关于具体什么场景下监测率能到100%的问题，需要再讨论
4. 驻店模型：
   1. 驻店模型遇到一些问题，详见“To-Do-List-and-Problems”；
   2. 继续添加一些特征；
   3. 10月11日出了初版的模型；
   4. 查论文，针对重要性高的特征，有没有分层的策略。
   5. 讨论驻店模型挪到PAI平台（优势：数据直接导入，算法成熟，规模大，评估指标全）。
5. Crowd delivery
   1. Python重写包括自己算法在内的四个函数。

09/27/18 ~ 09/30/18: 

1. 维护“驻店模型V1.0”的wiki页面。
2. 在驻店模型中考虑 “shop_in_mall” 的问题，考虑过GPS的轨迹，效果不好。也考虑过让BD手动反馈，但老板觉得不好。
   1. 确认了那张napos的表里的 shop_in_mall 的字段能不能使用。
3. 无实体Beacon的商户的label或验证问题，DZG那面提出了一种基于同时听到的Beacon列表的方法，但似乎效果不好。可以等数据量再上来一点再说。
4. 开始推自己的驻店模型
   1. 和ZTY那面协调了category的字段。
5. 开始改写crowd delivery的代码，准备改论文
6. 虚拟Beacon的可靠性

09/17/18 ~ 09/21/18

1. 尝试公司内的计算平台

   * [Zeppelin](http://bdi-zeppelin.elenet.me/#/): 易掉线，无人维护，不靠谱
   * [Elearn](http://wiki.ele.to:8090/pages/viewpage.action?pageId=4214432)：无人维护，不靠谱
   * [IoT 自有服务器](http://eapp.tools.elenet.me/#/group/0/1/3/21?appid=bdi.shopstate)： 需要自己搭环境，容器结构，重启后数据会消失，不靠谱
   * [BDI的视觉组服务器](http://eapp.tools.elenet.me/#/group/0/1/3/17?appid=bdi.vision_engine) 无空间
   * 尚待建立的自有机器学习平台：～
2. 用Python重写crowd-delivery的time estimation
3. 需要着手考虑和写一个CPS的proposal（同时作为我的thesis proposal）
4. 痛点计划的讨论

09/10/18 ~ 09/14/18

1. 准备potential topic “learn from veteran”
2. 修改痛点计划slides
3. 写驻店模型专利
4. 测试python上的kstest在running time上的效果
5. 重跑了three order 的任务，加上了shop_id，明天可以用以“learn from veteran”的motivation
6. 确定还是用gaussian来描述waiting time，重写kstest的python版本，但kstest的通过率极其低，只有60%，和之前Matlab的版本差很多，考虑明天试一下running time再说。

09/06/18

1. 和老板讨论的内容：
   1. 几个新idea。Meal need prediction的idea不好，因为没有key innovation，为什么别人不能做。没什么特殊的observation。Human mobility的idea也没说清楚和cellphone data的区别。
   2. GPS enhancement的想法得到老板的一定程度的肯定，但需要进一步思考，再读一些文章，然后想清楚一个切入点。比如老板提到的 low cost KDR GPS，就是说普通的GPS会受到天气和地形影响，但基于beacon的GPS很准确。
   3. crowd delivery中的time estimation尝试ml的失败，重回Normal distribution。

09/04/18

1. 针对crowd delivery中的time estimation问题，几乎尝试了sklearn中所有的regressor模型，只有GBDT和NN效果勉强可以（ r2_score在0.3左右），但从真值和预测值的plot和r2_score来看，这两个模型的效果都不行。所以可能要放弃用ML进行时间预估的方法，还是采用原来的正态分布的方法。

08/30/18

1. 今天提的几个potential topics里，老板都觉得不够好。rider-routing的项目老板也觉得拖了很久了，所以在没有很strong的新东西之前就不要提了。不过关于anomaly detection的方面，老板提了几个想法。一是要做anomaly detection的话需要把motivation说清楚，比如要说骑手欺诈的危害有多大啊什么的，另外就是ground truth要怎么找。
2. 老板提了另外一个想法，有了虚拟beacon的大规模部署之后，可以借助beacon对GPS数据进行矫正，主要的**一张图**就是在不同区域GPS的误差图，在商场和高楼附近，GPS的误差大，在旷野区域，GPS误差小。

08/27/18

1. 关于crowd delivery中的waiting time和running time的估计，准备换成ML的方法来做，这样时间片和参与度都可以作为feature，而不用手动来处理；而且也可以少一些理论的分析

08/22/18

1. 和DZG聊了waiting time的相关内容，觉得我们可以从两个方向发力；waiting time的预测的基本版可以作为我routing的一部分；而进一步深挖后的拓展版作为他的一个独立文章。

08/21/18

1. Instant delivery 中waiting time的问题考虑不要跟time dependen扯上关系，因为理论上无论是控制还是图，其实解决方法都是把它进行预测然后转换成time invariant的问题去做；
2. 和老板讨论了新版本的time-dependent rider routing，有下面几个发现：
   1. 如果把创新点完全落在waitting time estimation上，可能跟DZG作出餐时间预估的方向有冲突，需要跟他交流；
   2. 如果要用RL作解决方法，需要讲清楚原因。因为现有的机器学习的方法其实已经是有很多实时的特征在里面，你要怎么强调出RL的特点，这个需要

08/14/18

1. 关于Virtual Beacon的项目，Replace Beacon的方向比New Anchor的方向更好。
2. Replace Beacon的motivation中关于calibration free的内容不用提；
3. 同样的，related works的分类方法还需要在考虑；
4. challenges里的POI bind的问题这样陈述：我们已知一个POI的经纬度，然后根据相关数推测某个手机是否可以和这个POI绑定（和IODetector类似）。
5. 具体的design和实现暂时不用管，可以用他们正在做的这套系统
6. 关于time-dependent那个项目，老板还是觉得motivation很好，但还是需要一个好的角度，具体来说，就是waiting time是instant delivery有别于taxi transport的一个重要特点，基于这个特点，我们能想到什么新问题，可以用新的方法来解决，不局限于路径规划。
7. crowd delivery的项目就不用跟饿了么结合了，自己改改投个一般的会议就行了，不要浪费太多精力。

08/08/18

1. 新提出的分层的Inter-Block和Inner-Block的想法也被驳回，觉得还是没有和time-dependent netwok的特点很好结合起来。
2. 关于Rider Routing的问题，考虑下面几个方向：
   - 还是要遍历所有给定商户，但不以总时间为优化目标，避开TSP，考虑时变，考虑时间约束，优化目标可以考虑为超时率，只要不超时，都是最优解
   - 给骑手调度问题加约束，直到不是一个TSP问题
   - 如果没有很好的solution，就暂时搁置这个问题，考虑新的方向。
3. 开始虚拟beacon和驻店模型的研究
4. 明天和江东哲聊一下crowd delivery的项目和骑手路径规划的项目

07/27/18

1. 也可以考虑自己设计启发式的方法，像SARP那篇文章一样。我们也可以开一个风尚，基于数据的heuristic的设计方法。

07/25/18

1. 从真实数据出发，然后用brute force得到optimal的solution，然后在地图上看看这些optimal的solution有什么特征
2. Basic Design采用Tabu Search，从一个初始的heuristic（可能是）开始，通过调换相邻两个取单顺序来得到下一个备选的解，然后一直到某个suboptimal。（为什么只考虑调换相邻点呢，可能是因为调换远的点会引起更大的往返代价）
3. Advanced Design可以考虑采用Rollout Algorithm，算是一种针对discrete optimization的sequential approach，就是只优化眼前一两步，远处的单会受后续贴上来的单的影响。

07/24/18

1. 回程和去程其实没有本质区别，只要规定起止点就可以。主要区别可能是选单还是分配单。
2. 即使只考虑选单，而且在给定商户的前提下，还是有TSP隐含在里面，就是说各个点的顺序安排还是一个TSP问题，因为你没法约束各个点的顺序。
3. 还是要考虑清楚了再找老板聊。

07/12/18

1. 主要还是要把Time-Dependent的特性体现出来，体现在solution里。实在不行可以更改命题，所谓先射箭，再画靶子。
2. 也可以考虑同时体现时变特性和动态追单特性，但那需要在motivation里体现出动态追单的重要性和难度。

07/06/18

1. Instant Delivery里的Path Scheduling问题其实是变相的TSP问题，也就是NP问题。我们需要通过对问题加约束来找到多项式复杂度的解，或者去找那些已有的TSP的近似算法。
2. 最好是首先有一个最优解（也得是多项式的），然后在advanced design里通过加约束或者改问题来得到一个近似解。
3. 要体现出waiting time长的特点，也就是在motivation里提到的和taxi比较的点。不一定要用TDN，但要体现这一点。

07/03/18

1. 题目里Routing Algorithm不合适，因为会误导做无线网络的人，而且也没有把innovation的地方体现在题目里。
2. Instant delivery还需要看看物流方面的文章。
3. 关于TDN里最短路的求解，可以参考Gu Yu的RTSS文章，另外有一篇引用GuYU的InfoCom文章中有具体的算法。
4. AD1里的RV方法可以
5. AD2因为和DZG的话题冲突，可以考虑不做。
6. AD3其实提到就行，因为很细枝末节，可以边做边看。
7. AD4可以做。

06/30/18 群智感知研讨会

1. Scope可以再generic一些，考虑更多的场景。
2. 主要经历用在Rider-Routing的项目上
3. 取送分离和换单的项目需要更多的数据支撑和一个好的motivation。
4. Rider-Routing的项目需要把Advanced Design的内容想好之后，跟老板讨论之后，再开始动手做项目。
5. 算法的鲁棒性要考虑，就是如果骑手有cheating，或者时间的估计不准确的情况，调度结果是否受到影响。
   1. Basic Design就是各个时间已知且准确，用简单的DP来求解
   2. 一个Advanced Design是各个边的时间是一个随机分布怎么办（灰色条是一个分布）
   3. 另一个Advanced Design是各个边的时间有混杂的错误怎么办（灰色条未知或有错）
   4. 然后要加一个算法鲁棒性的分析，分析我们的算法在随机分布或者有错的情况下的调度效果怎么样
   5. 是否能够在routing时考虑到未来可能来的单
6. 在介绍背景的时候，要提到“店也有可选的情况，菜鸟前置仓库 ”，不仅局限于外卖场景。而且如果只限于外卖场景的话会被质疑“只有4单为什么不采用穷举的方法”。
7. 在介绍背景的时候要提到，快速和效率是可能冲突的，要体现出即时配送的独特之处。
8. 关于到店检测，能不能想到某个方法实现一个不需要iBeacon的到店检测方法，然后说明它和需要beacon的效果差不多。
9. 关于取送分离，要做一下survey，取送分离是否研究过了。因为物流已经做了很多年研究了。如果已经有人做过，那就找到外卖独有的特点（时间约束）。

06/27/18

1. 题目可以叫path planning或者routing，主要在于给定商户名单之后的序列确定
2. 查下即时配送是不是叫Instant Delivery
3. 考察下阿里那面的货物出仓机制，扩展preparing time这个概念
4. 不要提Gu Yu那篇文章，把TDN作为一个innovative的点提出来
5. 不要提batch这个事情，会对问题有无谓的限制，一次性把问题定义清楚就行
6. 我们也可以用DP
7. basic design假定所有单已知，一次给出答案；advanced design考虑在追加单（或追加单未知的情况下进行预测和考虑）
8. hitchhike的文章要改投的话要重新考虑setting，或者把思路用在其他设计上，考虑用饿了么的大规模平台来实现in-field的实验
9. 周末的报告可以多讲讲，暴露些问题

06/21/18

1. Time-Dependent Network 用于骑手行为的调度，看Yu Gu的两篇文章。
2. Delay Tolerant Network 的文章用于基于手机Beacon的换单idea，可以看Jaehoon的文章。
3. 把Taxi和Eleme的不同的等待时间用图的形式展示。
4. 江东哲那篇文章的baseline的实现。

06/07/18

1. 和张岩和老板有了初步的沟通，两个人的方向还是有不同的，可以各自研究。不过有很多可以共享和交流的内容，比如与出租车比较的motivation，比如张岩正在搭建的实时特征提取的框架。
2. 但是首先最好把waiting time这个claim的数据弄出来。
3. 与此同时，想一想虚拟Beacon的应用，比如调节不同的发送强度来感知不同的距离，因为要体现虚拟beacon随时可调的特点。
4. JDZ的项目需要找到related works，并选择合适的来作为baseline用在evaluation里。

06/04/18

"Recommendation system for rider" 的 idea 得到老板的初步同意。但有两个问题：

1. topic可能和张岩的研究话题有部分重叠，需要找她聊一聊；
2. waiting time占大头的的这个claim可以作为一个surprise的点抛出来，但一定要有数据和图支撑，和carpool做对比。

06/01/18

ADDP的提纲被老板拒绝，因为

1. ADDP其实是Detection和Prediction两个work的堆砌，如果各自没有创新点，简单的堆砌也没有意义。
2. Arrival Departure Detection的问题在于本质太trivial，所以怎么想怎么改也很难让人买账。
3. Stay time prediction的问题在于有人做过同样的话题，虽然ADDP有一些新的内容，但这些内容还不够让人觉得足够的innovation。
4. 没有体现出大系统的优势，还是太着眼于单个骑手。如果能体现出几万名骑手数据的优势的问题会更好，比如POI矫正。

下一步：
* 可以不用拘泥于到店检测这个话题，可以找找别的问题

05/31/18

考虑如何体现RADD的用处，找到现在的依据位置调度失败的例子 

把RADD那篇文章的innovation和角度想清楚然后跟老板讨论

- 你做的东西为什么室内定位不能做
- 只说IPS不能提供timestamp是不够的，因为从IPS到timestamp也是很trivial的
- 不要先在细节上花费太多时间

05/17/18

1. 关于不准确的labeling，因为做实验发现error rate很高，现有的error rate都有60%，所以觉得是一个不能忽视的问题。所以想的就是要用GPS和订单数据进行修正和补充。比如基于GPS的数据来滤掉一些错误的label，或者就是利用time shift来进行对齐。
2. 利用订单的数据，只把有单的商户作为目标。
3. 进行了这些处理之后，error rate有提高，但还是只有40%左右。
4. 不同于一般的ML问题在于，标1的肯定是1，但标0的不一定是没到店，可能是路过很近的店，也可能是到店没取上餐就没标到店。所以有别于普通的ML问题的解决方式，需要有新的思路和流程。比如先学习到店的例子，然后逐步学习没到店的例子。

05/10/18
1. 关于基于到店监测的应用：我可能也会谈到POI监测和时间预估，这和江东哲和戴志刚的内容会有一点重叠，但我觉得问题不大吧，毕竟具体用的方法是不一样的。比如POI监测，我可能会用CFD，也就是基于到店数据做一些逻辑上的监测，找出有问题的数据。但江东哲好像采用别的方法。
2. 关于和江东哲和戴志刚的交流，我上周和江东哲开会聊了一下进度，了解了一下他们在做什么，知道江东哲在做POI，戴志刚在做时间预估。我回去之后会和他们再好好交流。
3. 然后这两天有考试，没有更多进展。

03/29/18
1. 饿了么那面，最近主要的任务就是和东哲找可靠性的原因，虽然我看排期在4月底，但基于现有的数据我们也能做一部分分析，可靠性的问题主要有：部署错误、骑手手机听不到蓝牙信号、APP端的上传时间、骑手快速取单（10s内取单完成）等，具体的占比现在正在分析，这两天就可以给一个大概的数据。

03/22/18
1. 在 group meeting 上讲了自己在饿了么的一些工作，听了一些大家的意见。
   感觉从大家的意见上来说，研究工作可以分为两类：一类是做系统，像刘松做的那个光定位；另一类是做应用，像desheng那样的。我觉得我还是要偏应用一些，因为做系统需要的很多technical detail我其实并不了解，但基于数据直接做应用更为合理。

   zhimeng 和 ruofeng 还给我找了几篇同类型的文章看了下。

2. 至于方法，还是考虑用机器学习的方法，最近在看tensorflow的东西，我准备尝试一下CNN，因为CNN的原理其实就是用一些特殊的filter取鉴别图里的线条和颜色，其实我们也是想监测出RSSI曲线中的特点pattern，有相似之处。但是其实每一时刻骑手的到店状态都和前一时刻相关，这一点传统的机器学习方法是不会考虑的，或许我们可以在这一点上把recursive bayesian和CNN结合起来。




03/08/18

Prepare to talk:

1. Check some theoretical results and papers, recursive Bayesian is very similar to particle filtering, which has been repeatedly studied in indoor tracking papers. Also, I found I need to add constraints to reduced the detection delay, which is lack of theoretical support.
2. I would like to solve offline detection, which is also challenging, considering large scale and shop/rider/phone diversity.
3. I am working on paper, but it seems I cannot complete even draft version before MobiCom due.



02/22/18
1. Plan to use Bayesian estimation to do the rider's prescence detection. For two reaons: (1) Bayesian estimation provides the possiblilities for rider at each shop, we do not need manually set a threshold of RSSI to tell whether rider is at which shop. (2) Bayesian estimation can be update online given new data.
2. In Bayesian estimation, prior can be set as the posterior at last step. We have two choices for likelihood: a emperical equation (higher RSSI indicates higher possibility), or a distribution learned from data (Gaussian distribution with mu = -80). We can try both to see the performance.
3. Rider's labeling can be viewed as ground truth for evaluation.


02/08/18

1. Large scale Real-time Arrival/Departure Detection with some technical details.
2. Upper layer applications not limited to POI inconsistency and rider cheating detection. Rule-based methods are not good choice.
3. Balance lower layer service and upper layer applications.
4. Scalability is critical.


01/25/18
1. MobiCom
    1. [ctopus: Prediction of Order Time and Rider Behavior in Food Delivery System](https://github.com/dymodi/dymodi.github.io/blob/master/Research/Paper/Octopus/octopus-outline-4.md)
    2. Key points:
        1. Rider arrival and stay detection using beacons and GPS.
        2. Travelling and staying time estimation using boosting.
        3. Rider behavior prediction using bayesian.

12/18/17
1. Eagle paper outline_1 is denied. We should not limit ourselves within the "offline data gathering" topic. We should have a more broad topic: something like "urban mobility monitoring"
2. The design space taxonomy has two problems: (1) Not balance. The split should be something like "black and white", but not like "others work and my work". (2) There are overlaps in the spliting: methods for Wi-Fi can be used for BLE.
3. There can be some overlaps for Eagle paper and the first paper. Data inconsistency part can be mentioned in both papers.


12/01/2017
Another idea: solving large scale offline data gathering. The challenges and motivations can be: 
* Deployment in the physical world of large scale BLE-based data gathering system
* Security and privacy protection（Similar as "Secure IoT"）
* Heterogenous data sources
* Data inconsistency
* Energy consumption in large scale BLE beacon system

11/03 (To be discussed with Prof.)
1. Inconsistency can be devided into spatial inconsistency (POI error) and temporal inconsistency (rider fraud). But the method to detect the inconsistency is partially share: rider mobility (speed distribution) can be used to detected. Specifically:

**Compare with rider speed distribution:** find wrong POI by clustering to shop (spatial),

**Arrival detection based on beacon:** find rider's late arrival compared with label (temporal), 
**Compare with cook time distribution: ** find abnormal restaurnt by clustering to shop (temporal)


11/01
1. Data inconsistency should be splited in the begining of Section 5.
2. The contribution: large scale, real world applications, practical issues.

10/25 
1. Focus on the Time-based Delivery Map. The system overview should be only on this part.
2. Data Processing should be discussed in the Discussion part.
3. Data Collection should be discussed in the Implementation part.
4. Two main part: edge estimation, point estimation.
5. Clarify challenges: spatial and temporal data missing and error. Spatial inconsistency can be corrected using POI correction. Temporal inconsistency can be corrected using other methods.
6. POI correction must be included in this paper.
7. We should articulate the difference with other time estimation methods.
8. New idea: Data Complementing in Rider System. (Tackeling base data problem (missing value and unreliable value). Performance can be evaluated using standard ML algorithm.)(Data redundancy and data validation.)

10/24/17
1. Rider's decision is related to both distance and order. We are building this relation.

10/23/17
1. Try use event table to extrace the single rider's travelling time between restaurants.
2. Use the data to do regression.

10/19/17
1. Fail to estimate time between restaurant and restaurant in the time map (rr edge), possiblely due to inaccurate raw data casued by inaccurate POI data. 

10/12
1. The Introduction draft 1 is rejected by the professor. Indoor localization is no more a meaningful topic for MobiSys, we have to find another story.

10/10
1. What is the main challenge? Scale? Food delivery?
2. Maybe I can search some paper and find the challenges and tell a good story. That is, make a tentative introduction.

09/21
1. In future deployment, the transmission power will be reduced so that it can only be heared within the shop.
2. Based on 1. each beacon data can match to a POI. What we care is not multiple beacons heared at the same time, but the time difference between each 

