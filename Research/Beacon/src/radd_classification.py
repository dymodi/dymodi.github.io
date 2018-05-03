'''
This is a evaluation file to do classification on RADD
Data is prepared in the data_prepare.py
Yi Ding
04/18/18
'''

# Use some basic linear model
import numpy as np
import random
from sklearn.linear_model import SGDClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.svm import LinearSVC
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.ensemble import AdaBoostClassifier
from sklearn.model_selection import cross_val_predict
import os
import csv
import time
import matplotlib.pyplot as plt
from my_cross_val import my_cross_val

# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
data_path = os.path.join(dir_path, '../data/')

# Global settings
T = 120
m = 1

# Read in data
file_name_partial_aug = '_'.join([str(m), 'shop_data_aug', str(T)])
file_name_aug = '.'.join([file_name_partial_aug, 'csv'])
file_data_aug = os.path.join(data_path, file_name_aug)


file_path = file_data_aug

X_list = []
y_list = []


with open(file_path, 'r') as csvfile:
    data_reader = csv.reader(csvfile)
    for row in data_reader:
        y_list.append(int(float(row[len(row)-1])))
        X_row = row[0:len(row)-1]
        X_row_float = [float(item) for item in X_row]
        X_list.append(X_row_float)

# Down sample to make balance labels
zero_rate = float(y_list.count(0)/len(y_list))
print('Initial zero_rate:', zero_rate)
zero_indices = [index for index in range(len(y_list)) if y_list[index] == 0]
other_indices = []
for index in range(len(y_list)):
    if index not in zero_indices:
        other_indices.append(index)
zero_indices_sampled = random.sample(zero_indices, 250)
X_list_sampled = [X_list[index] for index in zero_indices_sampled+other_indices]
y_list_sampled = [y_list[index] for index in zero_indices_sampled+other_indices]
zero_rate = float(y_list_sampled.count(0)/len(y_list_sampled))
print('Down sampled zero_rate:', zero_rate)

X = np.array(X_list_sampled)
y = np.array(y_list_sampled)
print(str(len(y_list_sampled)),'data samples.')


# Build model
method_list = [SGDClassifier, DecisionTreeClassifier,LinearSVC,GradientBoostingClassifier,AdaBoostClassifier]

for method in method_list:
    err_rate = my_cross_val(method,X,y,10,0)
    print(err_rate)
    print(str(method),'average error rate:', np.mean(err_rate))



# fig, ax = plt.subplots()
# ax.scatter(y, predicted, edgecolors=(0, 0, 0))
# ax.plot([y.min(), y.max()], [y.min(), y.max()], 'k--', lw=4)
# ax.set_xlabel('Measured')
# ax.set_ylabel('Predicted')
# plt.show()

# print('y:', y)
# print('predicted:', predicted)
#
# plt.plot(y)
# plt.plot(predicted)
# plt.title('compare')
# plt.show()
