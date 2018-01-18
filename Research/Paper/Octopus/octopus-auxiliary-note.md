--- 
layout: post
title: octopus-auxiliary-note
date: Jan. 2, 2018
author: Yi DING
---

[comment]: # (This is the auxiliary note of the octopus paper)
[comment]: # (本文是一些用来辅助 octopus paper 完成的笔记)

## To do list
1. 用tensorflow跑通一个gbdt模型。

## 一些心得
1. 根据美团和Facebook的文章，特征选取是ML中最重要的环节。

## 辅助内容
1. 饿了么时间预估组做的表：dw_ai.dw_aly_t_model_4_3_feature_v5。这个表里有超过100个特征，每天大概有200万单用这100个特征进行了估计。
相应特征的说明在[这里](http://wiki.ele.to:8090/pages/viewpage.action?pageId=42938953)。

这个表提供了两个重要内容：
    1. 按单汇总了特征；
    2. 提供了比较的baseline；
我们需要随机从表里挑选一定数量的订单，SQL代码如下：
```
select * 
from dw_ai.dw_aly_t_model_4_3_feature_v5
where dt = get_date(-1)
order by rand()
limit 100
```
但是发现有几个问题需要咨询一下刘成亮：
    1. order_price 一项的值都在1.0左右，是不是经过归一化。（其实用单号可以查到订单价格）。
    
2. 在Architecture一章下放"Feature Engineering"和"Model Design"两个小节似乎是个不错的方法，具体可参照蚂蚁金服的文章[1]。

3. Order time prediction 可以考虑用改进的GBDT或者改进的ConvNN

    感觉order time estimation一节和beacon没啥关系

4. Rider behavior prediction 考虑用beacon数据，用bayesian模型


## Ref.
[1] Longfei Li, Jun Zhou, Xiaolong Li, and Tao Chen. 2017. POSTER: Practical Fraud Transaction Prediction. In Proceedings of the 2017 ACM SIGSAC Conference on Computer and Communications Security (CCS '17). ACM, New York, NY, USA, 2535-2537. DOI: https://doi.org/10.1145/3133956.3138826