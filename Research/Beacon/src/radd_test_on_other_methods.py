'''
Here we conduct some experiments on other methods
We use a undifed dataset described here:
https://github.com/dymodi/dymodi.github.io/blob/master/Research/Beacon/data/DATA-FORMAT.md

Yi Ding
04/24/18
'''

import random
import os
import csv
import numpy as np
import matplotlib.pyplot as plt
from radd import lpf


# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
data_path = os.path.join(dir_path, '../data/')

# Global settings
T = 120
m = 1

# Read in data
file_name_partial_filled = '_'.join([str(m), 'shop_data_filled', str(T)])
file_name_filled = '.'.join([file_name_partial_filled, 'csv'])
file_data_filled = os.path.join(data_path, file_name_filled)

file_path = file_data_filled

X_list = []
y_list = []
with open(file_path, 'r') as csvfile:
    data_reader = csv.reader(csvfile)
    for row in data_reader:
        y_list.append(int(float(row[len(row)-1])))
        X_row = row[0:len(row)-1]
        X_row_float = [float(item) for item in X_row]
        X_list.append(X_row_float)
X = np.array(X_list)
y = np.array(y_list)

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

print(str(len(y_list_sampled)),'data samples.')


# Window filter + threshold
rssi_thresh_list = [i for i in range(-110,-90)]
# rssi_thresh_list = [-110]
error_rate_list = []
for rssi_thresh in rssi_thresh_list:
    radd_result_list = lpf(X_list_sampled, T, m, rssi_thresh)
    num_correct = 0
    for predicted, label in zip(radd_result_list, y_list_sampled):
        if predicted == label:
            num_correct = num_correct + 1
    error_rate_list.append(1-float(num_correct/len(y_list)))

# Plot error rate
plt.plot(rssi_thresh_list, error_rate_list, 'C0', label='error_rate')
plt.xlabel('rssi threshold')
plt.ylabel('error rate')
plt.title('Low pass filter error rate w.r.t. rssi threshold')
plt.legend()
plt.show()

