'''
Here we handle the time shift problem in RADD
Yi Ding
05/16/18
'''

import os
import pandas as pd
from datetime import datetime
from pytz import timezone
import numpy as np
import matplotlib.pyplot as plt

# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
data_path = os.path.join(dir_path, '../data/')

# Parameters
data_date = '2018-05-15'


# Read in data
file_name = '_'.join(['dw_ai_beacon_tracking_event', data_date])
file_name= '.'.join([file_name, 'xlsx'])
file_path = os.path.join(data_path, file_name)
tracking_event_dataframe = pd.read_excel(file_path)
arrive_rst_at_beacon_list = []
arrive_rst_at_list = []
pickup_at_list = []
leave_rst_at_beacon_list = []
for i in tracking_event_dataframe.index:
    arrive_rst_at_beacon = tracking_event_dataframe.iloc[i]['arrive_rst_at_beacon']
    arrive_rst_at = tracking_event_dataframe.iloc[i]['arrive_rst_at']
    pickup_at = tracking_event_dataframe.iloc[i]['pickup_at']
    leave_rst_at_beacon = tracking_event_dataframe.iloc[i]['leave_rst_at_beacon']
    # Transfer to unixtimestamp
    arrive_rst_at_beacon = datetime.strptime(arrive_rst_at_beacon, "%Y-%m-%d %H:%M:%S")
    arrive_rst_at = datetime.strptime(arrive_rst_at, "%Y-%m-%d %H:%M:%S.%U")
    pickup_at = datetime.strptime(pickup_at, "%Y-%m-%d %H:%M:%S.%U")
    leave_rst_at_beacon = datetime.strptime(leave_rst_at_beacon, "%Y-%m-%d %H:%M:%S")
    # Change time zone
    arrive_rst_at_beacon = timezone('Asia/Shanghai').localize(arrive_rst_at_beacon)
    arrive_rst_at = timezone('Asia/Shanghai').localize(arrive_rst_at)
    pickup_at = timezone('Asia/Shanghai').localize(pickup_at)
    leave_rst_at_beacon = timezone('Asia/Shanghai').localize(leave_rst_at_beacon)
    # Get unix_timestamp
    arrive_rst_at_beacon = np.int(arrive_rst_at_beacon.timestamp())
    arrive_rst_at = np.int(arrive_rst_at.timestamp())
    pickup_at = np.int(pickup_at.timestamp())
    leave_rst_at_beacon = np.int(leave_rst_at_beacon.timestamp())
    # Attach to list
    arrive_rst_at_beacon_list.append(arrive_rst_at_beacon)
    arrive_rst_at_list.append(arrive_rst_at)
    pickup_at_list.append(pickup_at)
    leave_rst_at_beacon_list.append(leave_rst_at_beacon)

# label和beacon分别画1和2，然后plot出来
for i in range(len(arrive_rst_at_list)):
    arrive_rst_at = arrive_rst_at_list[i]
    pickup_at = pickup_at_list[i]
    arrive_rst_at_beacon = arrive_rst_at_beacon_list[i]
    leave_rst_at_beacon = leave_rst_at_beacon_list[i]
    real_list = range(arrive_rst_at, pickup_at)
    beacon_list = range(arrive_rst_at_beacon, leave_rst_at_beacon)
    fig, ax = plt.subplots()
    ax.fill_between(beacon_list, [0] * len(beacon_list), [2]*len(beacon_list), facecolor='aqua', interpolate=True, label='beacon')
    ax.fill_between(real_list, [0] * len(real_list), [1] * len(real_list), facecolor='salmon', interpolate=True, label='label')
    plt.legend()
    plt.show()