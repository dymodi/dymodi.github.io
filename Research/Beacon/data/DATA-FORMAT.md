## DATA FORMAT

The data format for RADD is (for one beacon only situation): $N\times (nT+n+5)$

| Rider_id  | Duration (sceonds) $T$ | \# Beacon Heard $n$ | Start_<br />_timestamp | End_<br />_timestamp | $\text{Shop_id}_i$ | $\text{RSSI}_i^t$ |
| --------- | ---------------------- | ------------------- | ---------------------- | -------------------- | ------------------ | ----------------- |
| 100556090 | 60                     | 1                   | 1517712480             | 1517712540           |                    |                   |

where 

$i=1,…,n$, 

$t=1,…,T$, 

$N$ is the number of data points.

