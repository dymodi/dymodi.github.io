---
layout: post
title: Parameter Tuning in Time Estimation
date: September 3, 2018
author: Yi DING
---

## GBDT

```python
method = GradientBoostingRegressor(loss='ls', 
                                n_estimators=para_n_estimators, max_depth=para_max_depth,
                                learning_rate=.1, min_samples_leaf=pare_min_samples_leaf,
                                min_samples_split=para_min_samples_split)
```



**Previous experiment**

`max_depth = 7`

`min_samples_leaf = 4`

| `n_estimators ` | 200   | 300   | 400   | 500   | 600   | 700   | 800   | 900   |
| --------------- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| `r2_score`      | 0.375 | 0.376 | 0.373 | 0.368 | 0.364 | 0.359 | 0.354 | 0.349 |

**Conclusion:**

`n_estimators = 300 ` might be a good choice.



**Experiments on `min_samples_split` and `min_samples_leaf`**

`max_depth = 7`

`n_estimators = 300 `

| `min_samples_split` `min_samples_leaf` | **2**     | 3     | 4     | 5     | 6     | 7     | 8     | 9     |
| -------------------------------------- | --------- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| 1                                      | **0.377** | 0.374 | 0.376 | 0.379 | 0.372 | 0.372 | 0.374 | 0.372 |
| 2                                      | **0.372** | 0.372 | 0.372 | 0.376 | 0.374 | 0.374 | 0.378 | 0.375 |
| 3                                      | **0.377** | 0.377 | 0.377 | 0.377 | 0.377 | 0.380 | 0.380 | 0.377 |
| 4                                      | **0.377** | 0.377 | 0.377 | 0.377 | 0.377 | 0.378 | 0.377 | 0.380 |
| 5                                      | **0.380** | 0.380 | 0.380 | 0.380 | 0.380 | 0.380 | 0.380 | 0.380 |
| 6                                      | **0.377** | 0.377 | 0.377 | 0.377 | 0.377 | 0.377 | 0.377 | 0.377 |
| 7                                      | **0.382** | 0.382 | 0.382 | 0.382 | 0.382 | 0.382 | 0.382 | 0.382 |
| 8                                      | **0.379** | 0.379 | 0.379 | 0.379 | 0.379 | 0.379 | 0.379 | 0.379 |
| 9                                      | **0.385** | 0.385 | 0.385 | 0.385 | 0.385 | 0.385 | 0.385 | 0.385 |

**Conclusion:** 

It seems that `min_samples_split` does not matter very much. The default value `min_samples_split = 2` is not a bad choice.



**Further experiment on `min_samples_leaf`** 

We can set `max_depth = 7` and  `min_samples_split = 2`  and change `min_samples_leaf` for more insight.

`max_depth = 7`

`min_samples_split = 2`

`n_estimators = 300 `

| `min_samples_leaf` | 2     | 4     | 6     | 8     | 10    | 12    | 14    | 16    | 18    |
| ------------------ | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| `r2_score`         | 0.372 | 0.377 | 0.377 | 0.379 | 0.381 | 0.381 | 0.384 | 0.380 | 0.385 |

Further experiment

| `min_samples_leaf` | 10    | 20    | 30    | 40    | 50    | 60    |
| ------------------ | ----- | ----- | ----- | ----- | ----- | ----- |
| `r2_score`         | 0.381 | 0.380 | 0.384 | 0.385 | 0.387 | 0.388 |

| `min_samples_leaf` | 10    | 60    | 110   | 160   | 210   | 260   |
| ------------------ | ----- | ----- | ----- | ----- | ----- | ----- |
| `r2_score`         | 0.381 | 0.388 | 0.385 | 0.383 | 0.384 | 0.380 |

**Conclusion:**

It seems that `min_samples_leaf=60` is better. 

However, `r2_score = 0.388` is not satisfactory enough, we need to try other models.



## Nerual Network

One hidden layer.

`hidden_layer_sizes` and `activation`

| `hidden_layer_sizes` `activation` | 50   | 100  | 150  | 200  | 250  | 300  | 350  | 400  | 450  | 500  |
| --------------------------------- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| `identity`                        | 0.03 | 0.03 | 0.03 | 0.03 | 0.03 | 0.03 | 0.03 | 0.03 | 0.03 | 0.03 |
| `logistic`                        | 0.09 | 0.11 | 0.12 | 0.13 | 0.14 | 0.13 | 0.13 | 0.15 | 0.14 | 0.15 |
| `tanh`                            | 0.08 | 0.11 | 0.11 | 0.12 | 0.10 | 0.11 | 0.12 | 0.12 | 0.12 | 0.12 |
| `relu`                            | 0.09 | 0.17 | 0.16 | 0.10 | 0.16 | 0.16 | 0.17 | 0.17 | 0.18 | 0.18 |

Conclusion:

One hidden layer is not enough. Default activation `relu` has the best performance. Default hidden layer size `100` is good enough.



**Experiments on numeber of hidden layers**

| number of hidden layers | 1    | 2    | 3    | 4    | 5    |
| ----------------------- | ---- | ---- | ---- | ---- | ---- |
| `r2_score`              |      |      |      |      |      |

