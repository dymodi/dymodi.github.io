'''
This is the python file for the paper Octopus
Yi Ding, 01/18/18

'''

import numpy as np
from sklearn.ensemble import GradientBoostingRegressor

# Import data
from sklearn.datasets import load_boston
boston = load_boston()

# Test models with each data set
X = np.array(boston.data)
y = np.array(boston.target)
total_num = np.shape(y)[0]

# Divide into train data and test data
train_num = np.int(total_num * 0.9)
X_train = X[0:train_num,:]
y_train = y[0:train_num]
X_test = X[train_num:total_num,:]
y_test = y[train_num:total_num]

# Build GBDT model

gbdt = GradientBoostingRegressor(
    loss='ls',
    learning_rate=0.1,
    n_estimators=100,
    max_depth=3,
    min_samples_split=2,
    min_samples_leaf=1,
    subsample=1,
    init=None,
    random_state=None,
    max_features=None,
    verbose=1,
    max_leaf_nodes=None,
    warm_start=False
)

gbdt.fit(X_train,y_train)
pred=gbdt.predict(X_test)
total_err=0
for i in range(pred.shape[0]):
    print(pred[i],y_test[i])
    err=(pred[i]-y_test[i])/y_test[i]
    total_err+=err*err
print(total_err/pred.shape[0])


print("debug here")