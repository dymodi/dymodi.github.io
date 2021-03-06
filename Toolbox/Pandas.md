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
# Reset index
df = df.reset_index(drop=True)
# Create a new dataframe
df = pd.DataFrame(data = some_list, columns = ['col_name'])
df = pd.DataFrame(data = some_dict)
```

## Indexing
``` python
# Return element by index (absolute position)
some_value = california_housing_dataframe.iloc[i]['housing_median_age']
# Returen element by index (origin index)
some_value = california_housing_dataframe.loc[i]['housing_median_age']
# Check diff of consecutive rows (df.diff is not very convenient)
index_list=df.index.tolist()
for index, row in df.iterrows():
  if index==index_list[-2]:
    ## reach end and skip
    break
  this_time = row['time']
  next_time = df.loc[[index+1]]['time']
  time_diff = (next_time-this_time).astype('timedelta64[s]').iloc[0]
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
# Add new column based on two columns (use of lambda)
df['delta'] = df.apply(lambda row: pd.Timedelta(row['stop'] -row['start']) /
                       np.timedelta64(1, 's') , axis=1)
## Get seconds of the day from datetime
df['seconds_of_day'] = (df['datetime'] -
                        df['datetime'].astype('datetime64[D]'))/np.timedelta64(1,'s')
```

