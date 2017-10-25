--- 
layout: post
title: Machine Learning Basics
date: Oct. 16, 2017
author: Yi DING
---

In this post, we review some basic knowledge of machine learning. The frame of this post comes from the homework of Professor Arindam Banerjee’s Machine Learning course at University of Minnesota.

**Warning**: The mathematics and codes here are for reviewing and learning. It is prohibited to copy any of the contents here for your homework!

## Datasets
* Boston: The Boston housing dataset comes prepackaged with scikit-learn. The dataset has 506 points, 13 features, and 1 target (response) variable. You can find more information about the dataset [here](https://archive.ics.uci.edu/ml/datasets/Housing). 

    While the original dataset is for a regression problem, we will create two classification datasets for the example. Note that you only need to work with the response $$r$$ to create these classification datasets.

    i. Boston50: Let $$\tau 50$$ be the median (50th percentile) over all $$r$$ (response) values. Create
a 2-class classification problem such that $$y=1$$ if $$r≥\tau 50$$ and $$y=0$$ if $$r<\tau 50$$. By
construction, note that the class priors will be $$p(y = 1) \approx 1$$ , $$p(y = 0) \approx 1/2$$.

    ii. Boston75: Let $$\tau75$$ be the 75th percentile over all $$r$$ (response) values. Create a 2-class
classification problem such that $$y = 1$$ if $$r ≥ \tau 75$$ and $$y = 0$$ if $$r < \tau 75$$. By construction,
note that the class priors will be $$p(y = 1)\approx 1$$, $$p(y = 0)\approx 3$$.

* Digits: The Digits dataset comes prepackaged with scikit-learn. The dataset has 1797 points, 64 features, and 10 classes corresponding to ten numbers 0,1,...,9. The dataset was (likely) created from [this dataset](http://archive.ics.uci.edu/ml/datasets/Pen-Based+Recognition+of+Handwritten+Digits). 

## Cross-validation
**sklearn** has provided the function `cross_val_predict()` to generate cross-validated estimates for each input data point. More about this function can be found [here](http://scikit-learn.org/stable/modules/generated/sklearn.model_selection.cross_val_predict.html#sklearn.model_selection.cross_val_predict).
A simple example can be:
```python
# Cross-validation
lr = LinearRegression()
y = boston.target
y_pred = cross_val_predict(lr, boston.data, y, cv=10)
```

The function `my_cross_val(method,X,y,k,ml_type)` can performs k-fold cross-validation on `(X,y)` using `method`, and returns the error rate in each fold.
The code can be found [here](https://github.com/dymodi/Machine-Learning/blob/master/my_cross_val.py).


## Classification Methods from sklearn
We can conduct multi-classification easily by using methods: LinearSVC, SVC and LogisticRegression from sklearn library.

All these three methods are provided in the **sklearn** library and can be imported directly. A simple sample is:
```python
# import methods from libraries
from sklearn.svm import LinearSVC
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
# Create the model
myMethod = LinearSVC()
# Fit the data
myMethod.fit(Xtrain,ytrain.ravel())
# Test the model on (new) data
ypred = myMethod.predict(Xtest)
```
The detaild code of using these three methods on Boston and Digits data can be found [here](https://github.com/dymodi/Machine-Learning/blob/master/ml_basics_sklearn.py).

## Regression Methods from sklearn
**sklearn** also provides many linear regression methods. Such as [Support Vector Regression (SVR)](http://scikit-learn.org/stable/auto_examples/svm/plot_svm_regression.html)
Sample code can be found in the GitHub repository.


## Model Performance Evaluation
[R-squared](http://blog.minitab.com/blog/adventures-in-statistics-2/regression-analysis-how-do-i-interpret-r-squared-and-assess-the-goodness-of-fit) can be a good index to evaluate the accuracy of a regression model.

Quantile-Quantile Plot

gini，

auc，

aic