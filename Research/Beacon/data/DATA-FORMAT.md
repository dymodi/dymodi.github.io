## DATA FORMAT

The data format for RADD is (for one beacon only situation): $N\times (mT+m+5)$

| Rider_id  | Duration <br />(seconds) $T$ | \# Beacon Heard $m$ | Start_<br />_timestamp | End_<br />_timestamp | $\text{Shop_id}_i$ | $\text{RSSI}_i^t$ |
| --------- | ---------------------------- | ------------------- | ---------------------- | -------------------- | ------------------ | ----------------- |
| 100556090 | 60                           | 1                   | 1517712480             | 1517712540           |                    |                   |

where 

$i=1,…,m$, 

$t=1,…,T$, 

$N$ is the number of data points.

Also note that $\text{RSSI}_i^t$ can be NULL corresponding to no Beacon heard at this second, and 

$\text{RSSI}_i^t = \{ \text{RSSI}_1^1 ,\text{RSSI}_1^2, ... \text{RSSI}_1^T, \text{RSSI}_2^1,...\text{RSSI}_m^T,\}$



The data format for RADD label is as follows: $N\times(2m+4)​$

| Rider_id  | Duration <br />(seconds) $T$ | Start_<br />_timestamp | End_<br />_timestamp | $\text{Shop_id}_i$<br />arrival | $\text{Shop_id}_i$<br />departual |
| --------- | ---------------------------- | ---------------------- | -------------------- | ------------------------------- | --------------------------------- |
| 100556090 | 60                           | 1517712480             | 1517712540           | 0/1                             | 0/1                               |

where 

$i=1,…,m$, 



## LABEL FORMAT

For 1 shop data, we have following form of labels:

|                    | No Action | Arrival | Departure | Arrival & Departure |
| ------------------ | --------- | ------- | --------- | ------------------- |
| Original Form      | [0, 0]    | [1,0]   | [0,1]     | [1, 1]              |
| Single Number Form | 0         | 2       | 1         | 3                   |

