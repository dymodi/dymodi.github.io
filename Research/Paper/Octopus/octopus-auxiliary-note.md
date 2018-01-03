--- 
layout: post
title: octopus-auxiliary-note
date: Jan. 2, 2018
author: Yi DING
---

[comment]: # (This is the auxiliary note of the octopus paper)
[comment]: # (本文是一些用来辅助 octopus paper 完成的笔记)

## 一些心得
1. 根据美团和Facebook的文章，特征选取是ML中最重要的环节。

## 辅助内容
1. 饿了么时间预估组做的表：dw_ai.dw_aly_t_model_4_3_feature_v5。这个表里有超过100个特征，每天大概有200万单用这100个特征进行了估计。
相应特征的说明在[这里](http://wiki.ele.to:8090/pages/viewpage.action?pageId=42938953)
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