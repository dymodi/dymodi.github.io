'''
This is a evaluation file to do classification on RADD
Data is prepared in the data_prepare.py
Yi Ding
04/18/18
'''

# Use some basic linear model
import numpy as np
from sklearn import linear_model

# Read in data
single_file = 'single_shop_data_aug_120.csv'
with open('single_file.csv', 'rb') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
        print ', '.join(row)