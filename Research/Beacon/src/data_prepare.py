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
import matplotlib.axes as axes

# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
data_path = os.path.join(dir_path, '../data/')

# Global parameters
T = 60

rider_id = 111096298
date_str = '2018-03-24'

# Specify file
file_name = '_'.join(['dw_ai_clairvoyant_beacon',date_str, str(rider_id)])
file_name = '.'.join([file_name, 'xlsx'])
file_path = os.path.join(data_path, file_name)

# Read using pandas
rssi_dataframe = pd.read_excel(file_path)
print(rssi_dataframe.describe())


# Find shops dict with unix_timestamp
timestamp_shop_dict = {}
for i in rssi_dataframe.index:
    timestamp = rssi_dataframe.iloc[i]['unix_timestamp']
    shop_id = rssi_dataframe.iloc[i]['shop_id']
    start_timestamp = int(timestamp/T)*T
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
    start_timestamp = int(timestamp / T) * T
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
        single_shop_data[rider_id][start_timestamp]['rssi_array'] = np.empty(T)
        single_shop_data[rider_id][start_timestamp]['rssi_array'][:] = np.nan
        single_shop_data[rider_id][start_timestamp]['rssi_array'][inner_index] = rssi

# Attach a timestamp_list
timestamp_list = list(single_shop_data[rider_id].keys())
single_shop_data[rider_id]['timestamp_list'] = timestamp_list


max_data_num = 0
for timestamp in timestamp_list:
    # time_axis = [timestamp+i for i in range(0,T)]
    time_axis = [i for i in range(0,T)]# use a unified timestamp instead
    rssi_array = single_shop_data[rider_id][timestamp]['rssi_array']
    #print('time_axis: ', time_axis)
    #print('rssi_array: ', rssi_array)
    data_num = T - sum(np.isnan(rssi_array))
    if data_num > max_data_num:
        max_data_num = data_num
        max_timestamp = timestamp
    #plt.plot(time_axis, rssi_array)
    #plt.title('rssi')
    #plt.show()

# print(max_data_num, max_timestamp)
# time_axis = [max_timestamp+i for i in range(0,T)]
# rssi_array = single_shop_data[rider_id][max_timestamp]['rssi_array']
# print('time_axis: ', time_axis)
# print('rssi_array: ', rssi_array)
# plt.plot(time_axis, rssi_array,'-r*', markersize=6, markeredgewidth=0, color='r')
# plt.title('rssi')
# axes = plt.gca()
# axes.set_ylim([-110, -50])
# plt.show()

## Prepare label data
# Specify file
file_name = '_'.join(['dw_tms_tb_tracking_event',date_str, str(rider_id)])
file_name = '.'.join([file_name, 'xlsx'])
file_path = os.path.join(data_path, file_name)

# Read using pandas
event_dataframe = pd.read_excel(file_path)

# Prepare data
single_shop_label = {}
# RSSI for certain rider is a dict with start_timestamp as key
single_shop_label[rider_id] = {}

# Iterate to find data
for i in event_dataframe.index:
    state = event_dataframe.iloc[i]['shipping_state']
    ocurred_time = int(event_dataframe.iloc[i]['ocurred_time_ms']/1000)
    shop_id = event_dataframe.iloc[i]['platform_merchant_id']
    if state == 80 or state == 30:
        ocurred_time_start = int(ocurred_time / T) * T
        # Check whether we heard any beacon in this T
        if ocurred_time_start not in single_shop_data[rider_id]['timestamp_list']:
            print('No any beacon data in this time slot, jump')
            continue
        # It's an arrival/departure
        # Check whether we heard this beacon at this point
        shop_list_heard = single_shop_data[rider_id][ocurred_time_start]['shop_id_list']
        print('shop_list_heard: ', shop_list_heard)
        if shop_id not in shop_list_heard:
            #print('which shop arrival/departure: ', shop_id)
            #print('the shops we heard', shop_list_heard)
            #raise Exception('Arrival/Departure not heard')
            print('Arrival/Departure not heard in this time slot, jump')
            continue
        else:
            # We heard it!
            label_array = np.zeros(2*len(shop_list_heard))
            # data and label share a same shop list and its order
            shop_index = shop_list_heard.index(shop_id)
            if state == 80:
                label_array[2*shop_index] = 1
            elif state == 30:
                label_array[2*shop_index+1] = 1
            single_shop_label[rider_id][ocurred_time_start] = {}
            single_shop_label[rider_id][ocurred_time_start]['label_array'] = label_array


print(single_shop_label)


for timestamp in single_shop_label[rider_id]:
    # time_axis = [timestamp + i for i in range(0, T)]
    time_axis = [i for i in range(0, T)]  # use a unified timestamp instead
    print('how many seconds do you have?', len(time_axis))
    rssi_array = single_shop_data[rider_id][timestamp]['rssi_array']
    plt.plot(time_axis, rssi_array, '-r*', markersize=8, markeredgewidth=2, color='r')
    label_array = single_shop_label[rider_id][timestamp]['label_array']
    plt.xlabel('timestamp')
    plt.ylabel('rssi')
    if np.array_equal(label_array, np.array([1,0])):    # Arrival
        plt.title('Label: Arrival')
    elif np.array_equal(label_array, np.array([0,1])):  # Departure
        plt.title('Label: Departure')
    elif np.array_equal(label_array, np.array([1,1])):  # Arrival and Departure
        plt.title('Label: Arrival and Departure')
    else:
        raise Exception('What label is this?')
    axes = plt.gca()
    axes.set_ylim([-110, -50])
    plt.show()



N = 100

# # Time conversion
# time_start = datetime.strptime(date_str_start, "%Y-%m-%d %H:%M:%S")
# time_end = datetime.strptime(date_str_end, "%Y-%m-%d %H:%M:%S")
# time_start_SH = timezone('Asia/Shanghai').localize(time_start)
# time_end_SH = timezone('Asia/Shanghai').localize(time_end)
# timestamp_start =int(time_start_SH.timestamp())
# timestamp_end =int(time_end_SH.timestamp())
