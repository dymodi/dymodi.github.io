'''
This is the python file for the paper Octopus
Yi Ding, 01/18/18

'''

import csv
import numpy as np
from sklearn.ensemble import GradientBoostingRegressor

# Import data
order_string_list = []
order_list = []

# Read data to string
with open('../data/eta_by_order_01022018_10000.csv',newline='') as csvfile:
    order_reader = csv.reader(csvfile, delimiter = ' ', quotechar = '|')
    for row in order_reader:
        order_string_list.append(row)

# String to list/int
for order_stirng in order_string_list:
    order_list.append(order_stirng[0].split(','))

# Pick features
features = ['order_price',
            'weather_code',
            'delivery_time_avg',
            'delivery_distance_avg',
            'cooking_time',
            'order_distance',
            'team_history_deliver_time',
            'team_history_deliver_time_four',
            'grid_distance_history_deliver_time']

X = []
y = []
# List to matrix
for i in range(1,len(order_list)):
    order_item = order_list[i]
    X.append(order_item[1:len(order_item)])
    y.append(order_item[0])


# Test models with each data set
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