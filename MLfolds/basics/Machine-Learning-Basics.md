---
layout: post
title: Machine Learning Basic Tutorial
date: Oct. 16, 2017
author: Yi DING
---

In this post, we provide a basic framework for machine learning practice (basically based on sklearn and Pandas).

Some primary problems such as data missing, class imbalance are solved in this tutorial.



## Classification

### Read Data

```python
## Read data
## Some libraries
import pandas as pd
import os

# Read from local file
data_path = 'where_your_file_is_in'
filename = "your_data.csv"
file_path = os.path.join(data_path,filename)
df_data = pd.read_csv(file_path)
# print(df_pos.iloc[0])
```

### Preprocessing

```python
## Check data types
print('\nData types.')
print(data.dtypes)

## Data type transformation (object to string, string to numeric)
df_data['feature_1_str'] = df_data['feature_1_obj'].apply(lambda x: str(x))
df_data['feature_2_num'] = pd.to_numeric(df_data['feature_2_str'])

## Missing data
# Fill NULL with zeros
df_data['some_feature'].fillna(0,inplace=True)
# Fill all NaN with scalar
# data.fillna(0,inplace=True)
# data.replace({'nan': 0}, inplace=True)

## Remove outliers
# Remove some rows with NULL/Zeros
df_data = df_data[df_data.some_feature != 0]
```

### Feature Engineering

```python
## Generate new features
df_data['some_new_feature']=df_data.apply(some_function,axis=1)
```

### Training

```python
## Train with existing libraries (sklearn)
# Import methods from libraries
from sklearn.svm import LinearSVC
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression

## Split train and test
X_train = 
X_test = 
y_train = 
y_test = 

## Class rebalance
# Before resample
print('Before resample:')
print(X_train[LABEL].value_counts())
# Separate majority and minority classes (two class problem)
X_train_majority = X_train[X_train[LABEL]==list(X_train[LABEL].value_counts().keys())[0]]
X_train_minority = X_train[X_train[LABEL]==list(X_train[LABEL].value_counts().keys())[1]]
# Downsample majority class
X_train_majority_downsampled= df_downsample(X_train_majority, len(X_train_minority.index))
# Combine minority class with downsampled majority class
X_train = pd.concat([X_train_majority_downsampled, X_train_minority])
# Display class counts afterwards
print('After resample:\n', X_train[LABEL].value_counts())

# Create the model
my_method = LinearSVC()
# Fit the data
my_method.fit(X_train,y_train.ravel())

```

### Evaluation

```python
## Some metrics to evaluate the models
# Test the model on (new) data
ypred = myMethod.predict(X_test)

# Precision

# Recall

# AUC

# other metrics
```



## Regression

**sklearn** also provides many linear regression methods. Such as [Support Vector Regression (SVR)](http://scikit-learn.org/stable/auto_examples/svm/plot_svm_regression.html).



