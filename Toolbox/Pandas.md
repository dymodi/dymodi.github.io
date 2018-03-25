---
layout: post
title: Pandas
date: Mar. 21, 2018
author: Yi DING
---

Pandas is a very useful Python library for machine learning. It is also suggested in Google's ML course.

A quick introduction to Pandas can be found [here](https://colab.research.google.com/notebooks/mlcc/intro_to_pandas.ipynb?hl=en#scrollTo=av6RYOraVG1V).

The basic elements in Pandas is *DataFrame* and *Series*.

## Basic Operations

``` python
import pandas as pd
# Read in .csv file
california_housing_dataframe = pd.read_csv("https://storage.googleapis.com/mledu-datasets/california_housing_train.csv", sep=",")
# A quick description of the data
california_housing_dataframe.describe()
# Histogram of certain feature
california_housing_dataframe.hist('housing_median_age')

```


