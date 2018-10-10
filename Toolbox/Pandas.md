---
layout: post
title: Pandas
date: Mar. 21, 2018
author: Yi DING
---

Pandas is a very useful Python library for machine learning. It is also suggested in Google's ML course.

A quick introduction to Pandas can be found [here](https://colab.research.google.com/notebooks/mlcc/intro_to_pandas.ipynb?hl=en#scrollTo=av6RYOraVG1V).

A complete tutorial of Pandas from **Data School** can be  found [here](http://www.dataschool.io/easier-data-analysis-with-pandas/).

The basic elements in Pandas is *DataFrame* and *Series*.

## Basic Operations

``` python
import pandas as pd
# Read in .csv file
california_housing_dataframe = pd.read_csv(
    "https://storage.googleapis.com/mledu-datasets/california_housing_train.csv", sep=",")
# Read in .xlsx file
rssi_dataframe = pd.read_excel(file_path)
# Only show the head of the table
rssi_dataframe.head()
# A quick description of the data
california_housing_dataframe.describe()
# Histogram of certain feature
california_housing_dataframe.hist('housing_median_age')
# Value counts
data['some_col'].value_counts()
# Remove rows
df[df.name != 'Tina']
```

## Indexing
``` python
# Return element by index (absolute position)
some_value = california_housing_dataframe.iloc[i]['housing_median_age']
# Returen element by index (origin index)
some_value = california_housing_dataframe.loc[i]['housing_median_age']
```

## Datetime

```python
# Create datetime object
place_time = pd.to_datetime('2013-12-12 10:00:00')
# Time diff
t1 = pd.to_datetime('1/1/2015 01:00')
t2 = pd.to_datetime('1/1/2015 03:30')
print pd.Timedelta(t2 - t1).seconds / 3600.0
# Get day of datetime
place_time.day
```

