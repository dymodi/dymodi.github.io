'''
In this file we prepare the data for further classification
Yi DING, 03/25/18
'''

# import
from datetime import datetime
from pytz import timezone
import os
import csv
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.axes as axes
import time

# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
data_path = os.path.join(dir_path, '../data/')


def get_training_data(T, m, rider_id, date_str):

    # Print log
    print('---------------')
    print('Preparing data for rider:', str(rider_id), 'on', str(date_str))

    # Statistics
    num_timeslot_has_m_beacon = 0
    num_order_checked = 0
    num_order_skipped_due_to_no_beacon_data = 0
    num_order_skipped_due_to_no_this_shop_beacon = 0
    num_order_as_label = 0
    num_label_has_multi_shop = 0
    num_tot_beacon_data = 0
    num_same_beacon_same_time = 0

    # Specify file
    file_name = '_'.join(['dw_ai_clairvoyant_beacon',date_str, str(rider_id)])
    file_name = '.'.join([file_name, 'xlsx'])
    file_path = os.path.join(data_path, file_name)

    # Read using pandas
    rssi_dataframe = pd.read_excel(file_path)
    # print(rssi_dataframe.describe())

    # Build dict
    # key: unix_timestamp_start
    # value: shop_id_list
    timestamp_shop_dict = {}
    for i in rssi_dataframe.index:
        #print('type(rssi_dataframe.iloc[i]):', type(rssi_dataframe.iloc[i]))
        timestamp = rssi_dataframe.iloc[i]['unix_timestamp']
        shop_id = rssi_dataframe.iloc[i]['shop_id']
        start_timestamp = int(timestamp/T)*T
        if start_timestamp in timestamp_shop_dict:
            if shop_id not in timestamp_shop_dict[start_timestamp]:
                timestamp_shop_dict[start_timestamp].append(shop_id)
        else:
            timestamp_shop_dict[start_timestamp] = [shop_id]
    num_timeslot_has_beacon = len(timestamp_shop_dict)

    # Prepare data
    shop_data = {}
    # RSSI for certain rider is a dict with start_timestamp as key
    shop_data[rider_id] = {}
    for i in rssi_dataframe.index:

        num_tot_beacon_data = num_tot_beacon_data + 1

        timestamp = rssi_dataframe.iloc[i]['unix_timestamp']
        shop_id = rssi_dataframe.iloc[i]['shop_id']
        rssi = rssi_dataframe.iloc[i]['rssi']
        start_timestamp = int(timestamp / T) * T

        if len(timestamp_shop_dict[start_timestamp]) != m:
            # We just don't care
            continue

        if start_timestamp in shop_data[rider_id]:
            # This time slot has been constructed;, we only need to insert rssi
            if shop_id not in shop_data[rider_id][start_timestamp]['shop_id_list']:
                # shop_id not heard before
                shop_data[rider_id][start_timestamp]['shop_id_list'].append(shop_id)
            shop_id_index = shop_data[rider_id][start_timestamp]['shop_id_list'].index(shop_id)
            inner_index = shop_id_index * T + (timestamp - start_timestamp)
            if np.isnan(shop_data[rider_id][start_timestamp]['rssi_array'][inner_index]):
                shop_data[rider_id][start_timestamp]['rssi_array'][inner_index] = rssi
            else:
                num_same_beacon_same_time = num_same_beacon_same_time + 1
                # print(rider_id, timestamp, shop_id, rssi)
                # print('Two same shop heard at same second?')
                # raise Exception('Two same shop heard at same second?')
        else:
            # This time slot has to be constructed
            shop_data[rider_id][start_timestamp] = {}
            shop_data[rider_id][start_timestamp]['shop_id_list'] = [shop_id]
            shop_data[rider_id][start_timestamp]['rssi_array'] = np.empty(T*m)
            shop_data[rider_id][start_timestamp]['rssi_array'][:] = np.nan
            shop_data[rider_id][start_timestamp]['rssi_array'][timestamp - start_timestamp] = rssi
            num_timeslot_has_m_beacon = num_timeslot_has_m_beacon + 1

    # Attach a timestamp_list
    timestamp_list = list(shop_data[rider_id].keys())
    shop_data[rider_id]['timestamp_list'] = timestamp_list
    if num_timeslot_has_m_beacon != len(timestamp_list):
        print('shop_data[rider_id]: ', shop_data[rider_id])
        print('num_timeslot_has_m_beacon: ', num_timeslot_has_m_beacon)
        print('len(timestamp_list): ', len(timestamp_list))
        raise Exception('Wrong timestamp list?')

    # print('shop_data[rider_id]:', shop_data[rider_id])

    # # Draw to check
    # max_data_num = 0
    # for timestamp in timestamp_list:
    #     # time_axis = [timestamp+i for i in range(0,T)]
    #     time_axis = [i for i in range(0,T)]# use a unified timestamp instead
    #     rssi_array = shop_data[rider_id][timestamp]['rssi_array']
    #     data_num = T - sum(np.isnan(rssi_array))
    #     if data_num > max_data_num:
    #         max_data_num = data_num
    #         max_timestamp = timestamp
    #     #plt.plot(time_axis, rssi_array)
    #     #plt.title('rssi')
    #     #plt.show()

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
    # print(event_dataframe.describe())

    # Prepare label
    shop_label = {}
    # RSSI for certain rider is a dict with start_timestamp as key
    shop_label[rider_id] = {}

    # Iterate to find label
    for i in event_dataframe.index:
        state = event_dataframe.iloc[i]['shipping_state']
        ocurred_time = int(event_dataframe.iloc[i]['ocurred_time_ms']/1000)
        shop_id = event_dataframe.iloc[i]['platform_merchant_id']
        if state == 80 or state == 30:

            num_order_checked = num_order_checked + 1

            # It's an arrival/departure
            ocurred_time_start = int(ocurred_time / T) * T
            # Check whether we heard any beacon in this T
            if ocurred_time_start not in shop_data[rider_id]['timestamp_list']:
                # print('No any beacon heard in this time slot when rider label his arrival/departure, skip')
                num_order_skipped_due_to_no_beacon_data = num_order_skipped_due_to_no_beacon_data + 1
                continue
            # Check whether we heard this beacon at this point
            shop_list_heard = shop_data[rider_id][ocurred_time_start]['shop_id_list']
            # print('shop_list_heard: ', shop_list_heard)
            if shop_id not in shop_list_heard:
                # This baecon not heard
                # print('Arrival/Departure not heard in this time slot, skip')
                num_order_skipped_due_to_no_this_shop_beacon = num_order_skipped_due_to_no_this_shop_beacon + 1
                continue
            else:
                # We heard it!
                num_order_as_label = num_order_as_label + 1
                if m != len(shop_list_heard):
                    raise Exception('Num of beacon heard not make sense.')
                shop_index = shop_list_heard.index(shop_id)
                if ocurred_time_start in shop_label[rider_id]:
                    # has label data already for another shop
                    num_label_has_multi_shop = num_label_has_multi_shop + 1
                    # print('label_array: ', label_array)
                    if state == 80:
                        label_array[2*shop_index] = 1
                    elif state == 30:
                        label_array[2*shop_index+1] = 1
                else:
                    label_array = np.zeros(2*m)
                    # data and label share a same shop list and its order
                    if state == 80:
                        label_array[2*shop_index] = 1
                    elif state == 30:
                        label_array[2*shop_index+1] = 1

                    shop_label[rider_id][ocurred_time_start] = {}
                    shop_label[rider_id][ocurred_time_start]['label_array'] = label_array

    timestamp_list_data = shop_data[rider_id]['timestamp_list']
    timestamp_list_label = list(shop_label[rider_id].keys())

    for timestamp in timestamp_list_data:
        if timestamp not in timestamp_list_label:
            # # Shrink data to meet label
            # del(shop_data[rider_id][timestamp])
            # Augment label to meet data
            labl_array = np.zeros(2 * m)
            shop_label[rider_id][timestamp] = {}
            shop_label[rider_id][timestamp]['label_array'] = labl_array

    # Check size before output
    len_data = len(list(shop_data[rider_id].keys()))-1  # -1 is because keys has timestamp and a "timestamp_list"
    len_labl = len(list(shop_label[rider_id].keys()))
    if len_data != len_labl:
        raise Exception('Data and label size not match')
    # print(shop_label)

    if len_data != num_timeslot_has_m_beacon:
        print('timestamp_list_data: ', timestamp_list_data)
        print('len_data: ', len_data)
        print('num_timeslot_has_beacon: ', num_timeslot_has_m_beacon)
        raise Exception('Data num not equal beacon slot num?')

    # Check whether the shop num is correct
    for timestamp in shop_data[rider_id]['timestamp_list']:
        # print('timestamp: ', timestamp)
        # print('shop_data[rider_id][timestamp]:',shop_data[rider_id][timestamp])
        # print('shop_data[rider_id][timestamp][\'shop_id_list\']', shop_data[rider_id][timestamp]['shop_id_list'])
        if len(shop_data[rider_id][timestamp]['shop_id_list']) != m:
            raise Exception('# of beacons heard not match m')


    # Print summary
    print('Summary')
    print('# of time slot that has beacon data: ', num_timeslot_has_beacon)
    print('# of time slot that has beacon data from', str(m), 'shops : ', num_timeslot_has_m_beacon)

    print('# of total beacon data: ', num_tot_beacon_data)
    print("# of same beacon heard at the same second: ", num_same_beacon_same_time)

    print('# of orders checked: ', num_order_checked)
    print('# of orders skipped due to no beacon data for any shop: ', num_order_skipped_due_to_no_beacon_data)
    print('# of orders skipped due to no beacon data for this shop: ', num_order_skipped_due_to_no_this_shop_beacon)
    print('# of orders attached as label: ', num_order_as_label)
    print('# of labels has multiple shops: ', num_label_has_multi_shop)
    print('# of total data prepared: ', num_timeslot_has_m_beacon)

    return shop_data, shop_label


# Global parameters
T = 120
shop_dim_list = [1,2]
nan_replacer = -110

# Read in rider and date list from the folder
# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
# The path of data files
data_path = os.path.join(dir_path, '../data/')
# Get all files from the folder
only_files = [f for f in os.listdir(data_path) if os.path.isfile(os.path.join(data_path, f))]
rider_list = []
date_str_list = []
beacon_data_rider_list = []
beacon_data_date_list = []
# Make a beacon data list
for file_name in only_files:
    name_parsed = file_name.split('_')
    if name_parsed[0] == 'dw' and name_parsed[3] == 'beacon':
        date_str = name_parsed[4]
        rider_id = name_parsed[5].split('.')[0]
        beacon_data_date_list.append(date_str)
        beacon_data_rider_list.append(rider_id)
# If we have corresponding order data, add it
for file_name in only_files:
    name_parsed = file_name.split('_')
    if name_parsed[0] == 'dw' and name_parsed[3] == 'tracking':
        date_str = name_parsed[5]
        rider_id = name_parsed[6].split('.')[0]
        if date_str in beacon_data_date_list and rider_id in beacon_data_rider_list:
            rider_list.append(rider_id)
            date_str_list.append(date_str)

print(date_str_list)
print(rider_list)

shop_data = {}
shop_labl = {}

# Unit test
# T = 120
# m = 2
# rider_id = 10756007
# date_str = '2018-03-28'
# T = 120
# m = 1
# rider_id = 111096298
# date_str = '2018-03-24'

# Call function to read data from excel
# Gather data for different shop num
for m in shop_dim_list:
    shop_data[m] = {}
    shop_labl[m] = {}
    for i in range(0, len(rider_list)):
        rider_id = rider_list[i]
        date_str = date_str_list[i]
        data, labl = get_training_data(T, m, rider_id, date_str)
        if rider_id in shop_data[m]:
            # We need to a merge
            for timestamp in data[rider_id]['timestamp_list']:
                if timestamp not in shop_data[m][rider_id]['timestamp_list']:
                    # New data in new timestamp
                    # Only update when new timestamp meet
                    shop_data[m][rider_id]['timestamp_list'].append(timestamp)
                    shop_data[m][rider_id][timestamp] = data[rider_id][timestamp]
                    shop_labl[m][rider_id][timestamp] = labl[rider_id][timestamp]
        else:
            # We can just attach
            shop_data[m][rider_id] = data[rider_id]
            shop_labl[m][rider_id] = labl[rider_id]
        # time.sleep(3)
        print(str(m),'shop data done for rider ', str(rider_id))

# print('single_shop_labl after merge: ', single_shop_labl)
# print('double_shop_labl after merge: ', double_shop_labl)

# Save data
# np.save('single_shop_data.npy', single_shop_data)
# np.save('double_shop_data.npy', double_shop_data)

# Total data num gathered
num_total_data_dict = {}
data_label_cnt_dict = {}

# Aggregate data regardless of rider and timestamp
# Gather rssi_list and append label
rssi_matrix_dict = {}                # nan indicating nothing heard
rssi_matrix_aug_dict = {}            # nan filled with 0 and new feature added to indicate heard or not
rssi_matrix_filled_dict = {}
labl_list_dict = {}
for m in shop_dim_list:
    rssi_matrix_dict[m] = []
    rssi_matrix_aug_dict[m] = []
    rssi_matrix_filled_dict[m] = []
    labl_list_dict[m] = []
    num_total_data_dict[m] = 0
    for rider_id in rider_list:
        num_add = len(shop_data[m][rider_id]['timestamp_list'])
        num_total_data_dict[m] = num_total_data_dict[m] + num_add
        print(str(m), 'shop case: ', str(num_add), 'data added for rider', str(rider_id), str(num_total_data_dict[m]),
              'data gathered in total.')
        for timestamp in shop_data[m][rider_id]['timestamp_list']:
            rssi_array = shop_data[m][rider_id][timestamp]['rssi_array']
            rssi_array_aug = []
            rssi_array_filled = []
            for rssi in rssi_array:
                if np.isnan(rssi):
                    rssi_array_aug.append(0)
                    rssi_array_aug.append(0)
                    rssi_array_filled.append(nan_replacer)
                else:
                    rssi_array_aug.append(1)
                    rssi_array_aug.append(rssi)
                    rssi_array_filled.append(rssi)
            labl_array = shop_labl[m][rider_id][timestamp]['label_array']
            if len(labl_array) != 2*m:
                raise Exception('Wrong representation')
            label = 0
            for i in range(0, len(labl_array)):
                label = label + np.power(2,i) * labl_array[len(labl_array)-i-1]
            if m == 1:
                label_check = labl_array[0]*2+labl_array[1]*1
                if label != label_check:
                    raise Exception('Wrong modification')
            if m == 2:
                label_check = labl_array[0] * 8 + labl_array[1] * 4 + labl_array[2] * 2 + labl_array[3] * 1
                if label != label_check:
                    raise Exception('Wrong modification')
            rssi_matrix_dict[m].append(rssi_array.tolist()+labl_array.tolist())
            rssi_matrix_aug_dict[m].append(rssi_array_aug + [label])
            rssi_matrix_filled_dict[m].append(rssi_array_filled + [label])
            labl_list_dict[m].append(label)

    # Summary plot
    data_label_cnt_dict[m] = []
    print(str(m),'shop data summary')
    print('Label\tNum')
    for i in range(0,4):
        data_label_cnt_dict[m].append(labl_list_dict[m].count(i))
        print(i, '\t', data_label_cnt_dict[m][i])

    # Write to shop data
    file_name_partial = '_'.join([str(m), 'shop_data', str(T)])
    file_name_partial_aug = '_'.join([str(m), 'shop_data_aug', str(T)])
    file_name_partial_filled = '_'.join([str(m), 'shop_data_filled', str(T)])
    file_name = '.'.join([file_name_partial, 'csv'])
    file_name_aug = '.'.join([file_name_partial_aug, 'csv'])
    file_name_filled = '.'.join([file_name_partial_filled, 'csv'])
    file_data = os.path.join(data_path, file_name)
    file_data_aug = os.path.join(data_path, file_name_aug)
    file_data_filled = os.path.join(data_path, file_name_filled)
    with open(file_data, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(rssi_matrix_dict[m])
    with open(file_data_aug, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(rssi_matrix_aug_dict[m])
    with open(file_data_filled, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(rssi_matrix_filled_dict[m])

# # Single shop plot
# for timestamp in single_shop_labl[rider_id]:
#     # time_axis = [timestamp + i for i in range(0, T)]
#     time_axis = [i for i in range(0, T)]  # use a unified timestamp instead
#     rssi_array = single_shop_data[rider_id][timestamp]['rssi_array']
#     label_array = single_shop_labl[rider_id][timestamp]['label_array']
#     if np.array_equal(label_array, np.array([1,0])):    # Arrival
#         plt.plot(time_axis, rssi_array, '-r*', markersize=8, markeredgewidth=2, color='r')
#         plt.title('Label: Arrival (slot = '+str(T)+' seconds)')
#     elif np.array_equal(label_array, np.array([0,1])):  # Departure
#         plt.plot(time_axis, rssi_array, '-b*', markersize=8, markeredgewidth=2, color='b')
#         plt.title('Label: Departure (slot = '+str(T)+' seconds)')
#     elif np.array_equal(label_array, np.array([1,1])):  # Arrival and Departure
#         plt.plot(time_axis, rssi_array, '-g*', markersize=8, markeredgewidth=2, color='g')
#         plt.title('Label: Arrival and Departure (slot = '+str(T)+' seconds)')
#     else:
#         raise Exception('What label is this?')
#     plt.xlabel('timestamp')
#     plt.ylabel('rssi')
#     axes = plt.gca()
#     axes.set_ylim([-110, -50])
#     axes.set_xlim([-1, T+1])
#     plt.show()


# # Double shops plot
# for rider_id in rider_list:
#     for timestamp in double_shop_labl[rider_id]:
#         # time_axis = [timestamp + i for i in range(0, T)]
#         time_axis = [i for i in range(0, T)]  # use a unified timestamp instead
#         rssi_array = double_shop_data[rider_id][timestamp]['rssi_array']
#         label_array = double_shop_labl[rider_id][timestamp]['label_array']
#         if np.array_equal(label_array, np.array([1, 0, 0, 0])):    # Arrival of first shop
#             plt.plot(time_axis, rssi_array[0:T], '-r*', markersize=8, markeredgewidth=2, color='r',
#                      label='rssi of first shop')
#             plt.plot(time_axis, rssi_array[T:2*T], '-*', markersize=8, markeredgewidth=2, color='salmon',
#                      label='rssi of second shop')
#             plt.title('Label: Arrival of first shop (slot = '+str(T)+' seconds)')
#         elif np.array_equal(label_array, np.array([0, 0, 1, 0])):  # Arrival of second shop
#             plt.plot(time_axis, rssi_array[0:T], '-r*', markersize=8, markeredgewidth=2, color='r',
#                      label='rssi of first shop')
#             plt.plot(time_axis, rssi_array[T:2*T], '-*', markersize=8, markeredgewidth=2, color='salmon',
#                      label='rssi of second shop')
#             plt.title('Label: Arrival of second shop (slot = ' + str(T) + ' seconds)')
#         elif np.array_equal(label_array, np.array([0, 1, 0, 0])):  # Departure of first shop
#             plt.plot(time_axis, rssi_array[0:T], '-b*', markersize=8, markeredgewidth=2, color='b',
#                      label='rssi of first shop')
#             plt.plot(time_axis, rssi_array[T:2*T], '-*', markersize=8, markeredgewidth=2, color='steelblue',
#                      label='rssi of second shop')
#             plt.title('Label: Departure of first shop (slot = '+str(T)+' seconds)')
#         elif np.array_equal(label_array, np.array([0, 0, 0, 1])):  # Departure of second shop
#             plt.plot(time_axis, rssi_array[0:T], '-b*', markersize=8, markeredgewidth=2, color='b',
#                      label='rssi of first shop')
#             plt.plot(time_axis, rssi_array[T:2*T], '-*', markersize=8, markeredgewidth=2, color='steelblue',
#                      label='rssi of second shop')
#             plt.title('Label: Departure of second shop (slot = ' + str(T) + ' seconds)')
#         elif np.array_equal(label_array, np.array([1, 1, 0, 0])):  # Arrival and Departure of first shop
#             plt.plot(time_axis, rssi_array[0:T], '-g*', markersize=8, markeredgewidth=2, color='g',
#                      label='rssi of first shop')
#             plt.plot(time_axis, rssi_array[T:2*T], '-c*', markersize=8, markeredgewidth=2, color='c',
#                      label='rssi of second shop')
#             plt.title('Label: Arrival and Departure of first shop (slot = '+str(T)+' seconds)')
#         elif np.array_equal(label_array, np.array([0, 0, 1, 1])):  # Arrival and Departure of second shop
#             plt.plot(time_axis, rssi_array[0:T], '-g*', markersize=8, markeredgewidth=2, color='g',
#                      label='rssi of first shop')
#             plt.plot(time_axis, rssi_array[T:2*T], '-c*', markersize=8, markeredgewidth=2, color='c',
#                      label='rssi of second shop')
#             plt.title('Label: Arrival and Departure of second shop (slot = '+str(T)+' seconds)')
#         else:
#             raise Exception('What label is this?')
#         plt.xlabel('timestamp')
#         plt.ylabel('rssi')
#         axes = plt.gca()
#         axes.set_ylim([-110, -50])
#         axes.set_xlim([-1, T+1])
#         plt.legend()
#         plt.show()


# # Time conversion
# time_start = datetime.strptime(date_str_start, "%Y-%m-%d %H:%M:%S")
# time_end = datetime.strptime(date_str_end, "%Y-%m-%d %H:%M:%S")
# time_start_SH = timezone('Asia/Shanghai').localize(time_start)
# time_end_SH = timezone('Asia/Shanghai').localize(time_end)
# timestamp_start =int(time_start_SH.timestamp())
# timestamp_end =int(time_end_SH.timestamp())
