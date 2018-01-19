--- 
layout: post
title: GBDT with sklearn
date: Jan. 18, 2018
author: Yi DING
---

[comment]: # (how to build gbdt with sklearn)

## Boston Dataset
The dataset can be loaded as follows:
```python
# Load data
from sklearn.datasets import load_boston
boston = load_boston()
```
The 64 features are the 8*8 pixels of each handwritten graph.
