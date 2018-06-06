'''
Compare the taxi carpool and food delivery system
focus on waiting time and on-road time
Yi Ding
06/06/18
'''

import pandas as pd
import os
import numpy as np

# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
data_path = os.path.join(dir_path, '../data/rideshare')
file_rideaustin = os.path.join(data_path,'Rides_DataA.csv')

# Read in data
rideaustin = pd.read_csv(file_rideaustin)

# Convert to datetime
df_datetime = pd.DataFrame()
df_datetime['created_on'] = pd.to_datetime(rideaustin.created_date)
df_datetime['driver_reached_on'] = pd.to_datetime(rideaustin.driver_reached_on)
df_datetime['started_on'] = pd.to_datetime(rideaustin.started_on)
df_datetime['completed_on'] = pd.to_datetime(rideaustin.completed_on)
df_datetime['updated_on'] = pd.to_datetime(rideaustin.updated_date)
print(df_datetime.head())

# Check NaN in datetime dataframe
df_datetime.dropna(inplace=True)
if df_datetime.isnull().values.any():
    raise Exception('Still has NaN?')

# Convert to timestamp
df_timestamp = pd.DataFrame()
df_timestamp['created_on'] = rideaustin.values.astype(np.int64) // 10 ** 9
# df_timestamp['driver_reached_on'] = pd.Timestamp(rideaustin.driver_reached_on)
# df_timestamp['started_on'] = pd.Timestamp(rideaustin.started_on)
# df_timestamp['completed_on'] = pd.Timestamp(rideaustin.completed_on)
# df_timestamp['updated_on'] = pd.Timestamp(rideaustin.updated_date)
print(df_timestamp.head())

# Get time difference
df_timediff = pd.DataFrame()
# df_timediff['wait_time'] = (df_timestamp.started_on-df_timestamp.driver_reacher_on).astype('timedelta64[s]')
print(df_timediff.head())

#rideaustin = pd.read_csv('/Users/eleme-yi/Documents/PhD/GitHub Pages/dymodi.github.io/Research/Beacon/data/rideshare/Rides_DataA.csv')