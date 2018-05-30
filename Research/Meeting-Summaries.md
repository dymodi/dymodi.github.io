---
layout: post
title: Notes on Beacon Paper
date: Sept. 19, 2017
author: Yi DING
---

# Meeting Summary on Beacon

## Highlight

把RADD那篇文章的innovation和角度想清楚然后跟老板讨论
* 你做的东西为什么室内定位不能做
* 只说IPS不能提供timestamp是不够的，因为从IPS到timestamp也是很trivial的
* 不要先在细节上花费太多时间

## Progress and Discussion

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

1. 买了5月23号的机票，直接到上海，估计5月底之前可以开始工作。
2. 饿了么那面，最近主要的任务就是和东哲找可靠性的原因，虽然我看排期在4月底，但基于现有的数据我们也能做一部分分析，可靠性的问题主要有：部署错误、骑手手机听不到蓝牙信号、APP端的上传时间、骑手快速取单（10s内取单完成）等，具体的占比现在正在分析，这两天就可以给一个大概的数据。
3. 我自己的研究方面：现在理出了一个基于机器学习的思路，大概就是借鉴CNN在图像处理里的方法。（可以看一下slides），然后结果正在跑。

03/22/18
1. 在 group meeting 上讲了自己在饿了么的一些工作，听了一些大家的意见。
   感觉从大家的意见上来说，研究工作可以分为两类：一类是做系统，像刘松做的那个光定位；另一类是做应用，像desheng那样的。我觉得我还是要偏应用一些，因为做系统需要的很多technical detail我其实并不了解，但基于数据直接做应用更为合理。

   zhimeng 和 ruofeng 还给我找了几篇同类型的文章看了下。

2. 现在要解决的问题，基本确定了，就是骑手到店监测，遗留的问题就是具体怎么实现和怎么去和现有的做比较。听了大家的意见，觉得 recursive bayesian 或者用 filter 来做都不合适，因为需要调的参数太多，而且不同商户的差异性很难考虑进来，所以我在考虑新的方法。我已经让骑手端的APP开发把iOS自己的到店监测结果传上来了，最好可以做一个比较。

   至于方法，还是考虑用机器学习的方法，最近在看tensorflow的东西，我准备尝试一下CNN，因为CNN的原理其实就是用一些特殊的filter取鉴别图里的线条和颜色，其实我们也是想监测出RSSI曲线中的特点pattern，有相似之处。但是其实每一时刻骑手的到店状态都和前一时刻相关，这一点传统的机器学习方法是不会考虑的，或许我们可以在这一点上把recursive bayesian和CNN结合起来。

3. 关于饿了么，我觉得同一秒收到多个Beacon会带来较大问题，也就是beacon时间戳不准，我最近会继续跟进这个问题。现在每个上传的beacon有个序列号了可能会更容易分析。

4. 暑假去的时间，5月中旬或者5月底，有考试，考试结束后要改卷。

5. 回来的时间，是否现在就确定要待半年还是到8月份再确定，我想提前找系里聊一下，比如WPE和OPE的时间。



03/08/18

Prepare to talk:

1. Mock Pre. at the group meeting.
2. Check some theoretical results and papers, recursive Bayesian is very similar to particle filtering, which has been repeatedly studied in indoor tracking papers. Also, I found I need to add constraints to reduced the detection delay, which is lack of theoretical support.
3. I would like to solve offline detection, which is also challenging, considering large scale and shop/rider/phone diversity.
4. I am working on paper, but it seems I cannot complete even draft version before MobiCom due.



(Details can also be found in the emails name with "Small Meeting")

03/01/18

1. Search for related works with "arrival/departure detection" or "POI association"



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
1. 饿了么总结
    1. Beacon状态监测
    2. 异常商户POI监测
    3. 异常骑手行为监测
    4. 和出餐时间预估组合作
2. MobiCom
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
2. Applications should only be discussed in the Introduction.
3. Data Processing should be discussed in the Discussion part.
4. Data Collection should be discussed in the Implementation part.
5. Two main part: edge estimation, point estimation.
6. Clarify challenges: spatial and temporal data missing and error. Spatial inconsistency can be corrected using POI correction. Temporal inconsistency can be corrected using other methods.
7. POI correction must be included in this paper.
8. We should articulate the difference with other time estimation methods.

2. New idea: Data Complementing in Rider System. (Tackeling base data problem (missing value and unreliable value). Performance can be evaluated using standard ML algorithm.)(Data redundancy and data validation.)
10/24/17
1. Is it possible to use Deep Reinforcement Learning in order dispatching?
2. Rider's decision is related to both distance and order. We are building this relation.

10/23/17
1. Try use event table to extrace the single rider's travelling time between restaurants.
2. Use the data to do regression.

10/19/17
1. Fail to estimate time between restaurant and restaurant in the time map (rr edge), possiblely due to inaccurate raw data casued by inaccurate POI data. 
2. Try to estimate cc edge.

10/12
1. The Introduction draft 1 is rejected by the professor. Indoor localization is no more a meaningful topic for MobiSys, we have to find another story.
2. We can start from the (food) delivery system and find some practical problem to solve.
3. For example, due to complex indoor structure and layouts, it's not enough to consider only latitude/longitude and floor. We need to find the "distance" in terms of delivery in a higher dimension.
(Possible feature: latitude/longitude, floor, weather, time(hour), rider age)
4. We can ignore indoor localization or make it as a small component.

10/10
1. About the outline, the structure is ok. But we need to dig more and deeper.
2. What is the main challenge? Scale? Food delivery?
3. Maybe I can search some paper and find the challenges and tell a good story. That is, make a tentative introduction.

09/21
1. In future deployment, the transmission power will be reduced so that it can only be heared within the shop.
2. Based on 1. each beacon data can match to a POI. What we care is not multiple beacons heared at the same time, but the time difference between each 

09/20
1. Discover and Solve the advanced problem by removing the assumptions. For example, if we do not assume that rider are walking at a constant speed (1m/s) indoor, the problem will become more complexity.

09/19
1. Location correction has been studies many years ago, so it's not a good idea to wirte a paper only on POI correction.
2. For algorithm and related work of location correction, please read Hwang's 2007 paper.
3. The main idea of my paper should be "We build a large scale real world indoor localization system basede on iBeacon protocol. In building this system, we met the following pracitcal problems and address them with novel methods."

## Potential Topics
* Delivery Map based on Time
* AOI Recongization based on delivery map
* POI Correction
* Security/Authentication
* Risk Control
* Auto check-in (Similar to Existence Detection)
* Dispatching(Traditional and Fetch Delivery Seperation)
* Deep Reinforcement Learning can be used in predicting rider's future bahavior.