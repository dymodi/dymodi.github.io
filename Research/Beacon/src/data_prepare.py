'''
In this file we prepare the data for further classification
Yi DING, 03/25/18
'''

# import
from datetime import datetime
from pytz import timezone
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

print(pd.__version__)

# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
data_path = os.path.join(dir_path, '../data/')

rider_id = 102081898
date_str = '2018-02-18'

file_name = '_'.join(['dw_ai_clairvoyant_beacon',date_str, str(rider_id)])
file_name = '.'.join([file_name, 'xlsx'])
file_path = os.path.join(data_path, file_name)

# Read using pandas
rssi_dataframe = pd.read_excel(file_path)
print(rssi_dataframe.describe())

print(rssi_dataframe.iloc[1]['rssi'])


T = 60
# Find shops dict with unix_timestamp
timestamp_shop_dict = {}
for i in rssi_dataframe.index:
    timestamp = rssi_dataframe.iloc[i]['unix_timestamp']
    shop_id = rssi_dataframe.iloc[i]['shop_id']
    start_timestamp = int(timestamp/T)*60
    if start_timestamp in timestamp_shop_dict:
        if shop_id not in timestamp_shop_dict[start_timestamp]:
            timestamp_shop_dict[start_timestamp].append(shop_id)
    else:
        timestamp_shop_dict[start_timestamp] = [shop_id]

# Prepare data
single_shop_data = {}
# RSSI for certain rider is a dict with start_timestamp as key
single_shop_data[rider_id] = {}
for i in rssi_dataframe.index:
    timestamp = rssi_dataframe.iloc[i]['unix_timestamp']
    shop_id = rssi_dataframe.iloc[i]['shop_id']
    rssi = rssi_dataframe.iloc[i]['rssi']
    start_timestamp = int(timestamp / T) * 60
    inner_index = timestamp - start_timestamp
    if len(timestamp_shop_dict[start_timestamp]) > 1:
        # Multiple shops heard during this interval
        continue
    if start_timestamp in single_shop_data[rider_id]:
        # Check shop_id
        if shop_id != single_shop_data[rider_id][start_timestamp]['shop_id_list'][0]:
            raise Exception('shop_id not match!')
        if np.isnan(single_shop_data[rider_id][start_timestamp]['rssi_array'][inner_index]):
            single_shop_data[rider_id][start_timestamp]['rssi_array'][inner_index] = rssi
        else:
            print(rider_id, timestamp, shop_id, rssi)
            raise Exception('Two same shop heard at same second?')
    else:
        single_shop_data[rider_id][start_timestamp] = {}
        single_shop_data[rider_id][start_timestamp]['shop_id_list'] = [shop_id]
        single_shop_data[rider_id][start_timestamp]['rssi_array'] = np.empty((T,1))
        single_shop_data[rider_id][start_timestamp]['rssi_array'][:] = np.nan
        single_shop_data[rider_id][start_timestamp]['rssi_array'][inner_index] = rssi

print(single_shop_data)

timestamp_list = list(single_shop_data[rider_id].keys())

for timestamp in timestamp_list:
    time_axis = [timestamp+i for i in range(0,T)]
    plt.plot(time_axis, single_shop_data[rider_id][timestamp]['rssi_array'])
    plt.title('rssi')
    plt.show()

N = 100

# # Time conversion
# time_start = datetime.strptime(date_str_start, "%Y-%m-%d %H:%M:%S")
# time_end = datetime.strptime(date_str_end, "%Y-%m-%d %H:%M:%S")
# time_start_SH = timezone('Asia/Shanghai').localize(time_start)
# time_end_SH = timezone('Asia/Shanghai').localize(time_end)
# timestamp_start =int(time_start_SH.timestamp())
# timestamp_end =int(time_end_SH.timestamp())
