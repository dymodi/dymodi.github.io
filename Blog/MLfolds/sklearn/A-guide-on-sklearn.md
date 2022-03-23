---
layout: post
title: A Guide on sklearn
date: August 31, 2018
author: Yi DING
---

Here we discuss how to use sklearn wisely.



## Regression

``` Python
# GBDT
from sklearn.ensemble import GradientBoostingRegressor

clf = GradientBoostingRegressor(loss='ls', alpha=alpha,
                                n_estimators=250, max_depth=3,
                                learning_rate=.1, min_samples_leaf=9,
                                min_samples_split=9)
# loss = 'ls' is a good default
# max_depth is a key parameter that needs to be tuned
```

