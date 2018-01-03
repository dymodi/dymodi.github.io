

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 16 16:11:48 2017
Train time-based map

@author: eleme-yi
"""

# Library import
import numpy as np
import pandas as pd
import datetime
from sklearn.cluster import KMeans
from sklearn.svm import LinearSVC
from sklearn.svm import SVC
from sklearn.svm import SVR
from sklearn.linear_model import LogisticRegression
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import cross_val_predict
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import f_regression
from sklearn.preprocessing import normalize
import matplotlib.pyplot as plt

## UDF import
from auxiliary import read_rr_edge_file
from auxiliary import read_rc_edge_file

rider_id = 10819296
date = datetime.date(2017,10,31)

# date = 'all'

# X, y = read_rr_edge_file(date)
X, y = read_rc_edge_file(date)

#X = np.array(X)
#y = np.array(y)

# Normalizing the input data to the same scale
X_norm = normalize(X)

# Feature selection
X_new = SelectKBest(f_regression, k=3).fit_transform(X_norm, y)    

X = X_norm

# Remove outliers using k-means
kmeans = KMeans(n_clusters=5, random_state=0).fit(y)
# Find the outlier indices
indics = np.where(kmeans.labels_==4)
# Remove outliers from X and y
X = np.delete(X,indics,axis=0)
y = np.delete(y,indics,axis=0)

# Fit linear model
lr = LinearRegression()
# Fit regression model
svr_rbf = SVR(kernel='rbf', C=1e3, gamma=0.1)
svr_lin = SVR(kernel='linear', C=1e3)
svr_poly = SVR(kernel='poly', C=1e3, degree=2)

y_pred = cross_val_predict(svr_lin, X, y, cv=10)

# Draw figure
fig, ax = plt.subplots()
ax.scatter(y, y_pred, edgecolors=(0, 0, 0))
ax.plot([y.min(), y.max()], [y.min(), y.max()], 'k--', lw=4)
ax.set_xlabel('Measured')
ax.set_ylabel('Predicted')
plt.show()

# q-q-plot
num_quantile = 1000
prob = [1/num_quantile*i for i in range(0,num_quantile)]
predict=pd.DataFrame(y)
measure=pd.DataFrame(y_pred)
predict_q=predict.quantile(prob)
measure_q=measure.quantile(prob)
plt.plot(predict_q,predict_q,'k',linewidth=2.0)
plt.plot(measure_q,predict_q,'b',linewidth=2.0)
plt.xlabel('Measured')
plt.ylabel('Predicted')
plt.title('qq-plot')
plt.show()

# Evaluate the performance
ytrue = y
ypred = y_pred
y_bar = np.mean(ytrue)
sum_hat_sqr = 0
sum_bar_sqr = 0
for i in range(0,ytrue.shape[0]):
    sum_hat_sqr = sum_hat_sqr + (ytrue[i]-ypred[i])*(ytrue[i]-ypred[i])
    sum_bar_sqr = sum_bar_sqr + (ytrue[i]-y_bar)*(ytrue[i]-y_bar)
R_sqr = 1 - sum_hat_sqr/sum_bar_sqr

# Evaluation for delivery, timeout viewed as error
num_correct = 0
timeout_thresh = 60*10
timeout_total = 0
for i in range(0,len(y)):
    timeout_total = timeout_total + abs(y[i]-y_pred[i])
    if abs(y[i]-y_pred[i]) < timeout_thresh:
        num_correct = num_correct + 1
accuracy = num_correct/len(y)
avg_timeout = timeout_total/len(y)