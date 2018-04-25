'''
Here we conduct some experiments on other methods
We use a undifed dataset described here:
https://github.com/dymodi/dymodi.github.io/blob/master/Research/Beacon/data/DATA-FORMAT.md

Yi Ding
04/24/18
'''

import os
import csv
import numpy as np

# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
data_path = os.path.join(dir_path, '../data/')

# Read in data
single_file = 'single_shop_data_aug_120.csv'
double_file = 'double_shop_data_aug_120.csv'
file_path = os.path.join(data_path, single_file)
# file_path = os.path.join(data_path, double_file)
print(file_path)
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
print(str(len(y_list)),'data samples.')

# Window filter + threshold
