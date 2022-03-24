---
layout: single
title: "Machine Learning Basic Tutorial"
permalink: /blog/MLfolds/basics/Machine-Learning-Basics/
classes: wide
author_profile: true
use_math: true
date: 17/10/16
---

In this post, we provide a basic framework for machine learning practice (basically based on sklearn and Pandas).

Here we first show the basic steps:

1. [Data Minification](https://www.kaggle.com/kyakovlev/ieee-data-minification) (if needed)
2. [Data Preprocessing](Data-Preprocessing)

## Classification

### Libraries

```python
import pandas as pd
import os
# Sklearn
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC
from sklearn.neural_network import MLPClassifier
from sklearn.svm import LinearSVC
from sklearn.linear_model import LogisticRegression
from sklearn.neural_network import MLPClassifier
# Metrics
from sklearn.metrics import classification_report,accuracy_score,confusion_matrix,f1_score,\
precision_recall_curve,precision_score,recall_score,auc,roc_curve
# XGBoost
from xgboost import XGBClassifier
```
###  Auxiliary Functions

```python
## Classification Metrics
def precision(y_test,result):
    scores={}
    #scores['classification_report']=classification_report(y_test,result)
    scores['accuracy_score']=accuracy_score(y_test,result)
    scores['confusion_matrix']=confusion_matrix(y_test,result)
    scores['f1_score']=f1_score(y_test,result)
    #scores['precision_recall_curve']=precision_recall_curve(y_test,result)
    scores['precision_score']=precision_score(y_test,result)
    scores['recall_score']=recall_score(y_test,result)
    return scores
  
## Dataframe downsample
def df_downsample(df, n_sample): 
    if n_sample > len(df.index):
        raise Exception('n_sample too large!')
    # Reindex    
    index = random.sample(range(0, len(df.index)), n_sample)    
    df = df.reset_index(drop=True)
    df_downsample = df.iloc[index,:]
    print('Origin:', len(df.index), 'After:', len(df_downsample.index))
    return df_downsample
```

### Read Data

```python
## Read from local file
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

## A quick description of the data
df_data.describe()
## Good habit: have a look at the hist of the data
fig = plt.figure(figsize = (15,20))
ax = fig.gca()
df_data.hist(bins=10, ax=ax)
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

## Build model
# GBDT
alpha = 0.95
clf = GradientBoostingClassifier(n_estimators=250, max_depth=3,
                                learning_rate=.1, min_samples_leaf=9,
                                min_samples_split=9)
# Random Forest
regr = RandomForestClassifier(max_depth=2, random_state=0)
# KNN
neigh = KNeighborsClassifier(n_neighbors=2)
# SVM
svm = SVC(C=1.0)
# Neural network
nn = MLPClassifier()
# XGBoost
xgb=XGBClassifier()

method_dict = {'GBDT':clf, 'Random Forest':regr, 'KNN':neigh, 'Neural Network':nn,
               'SVM':svm, 'XGBoost':xgb}

print(X_train.head(5))

## Cross Validation
for method in method_dict: 
    method_dict[method].fit(X_train.values,y_train.values.ravel())
    y_pred = method_dict[method].predict(X_test.values)
    print(method)
    # Evaluation
    scores = precision(y_test,y_pred)
    for key in scores:
        print(key, scores[key])
    print('\n')
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



