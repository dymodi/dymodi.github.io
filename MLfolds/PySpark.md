--- 
layout: post
title: PySpark - Using Spark with Python
date: Oct. 20, 2017
author: Yi DING
---

This is a post to summarize some basic operations for PySpark. 

First, we introduce [Apache Zeppelin](http://zeppelin.apache.org/), this is a web-based notebook that acts as a Spark shell.

A sample is like this:
```python
%livy.pyspark
print('Hello Zeppelin')
from pyspark import HiveContext

# Show databases
spark.sql("show databases").collect()
spark.sql("use dw")

# Show tables
spark.sql("show tables").collect()

# Read Hive table as a DataFrame object
hc_rdd = HiveContext(sc).sql('from table_name select * where dt = get_date(-1) limit 100')
hc_order.show()

# Read a column from a DataFrame
target_id_col = hc_raw_beacon.select("target_id")
target_id_col.show()
```
Note that due to storage mechanism, operations on RDD is not like that for other Python objects. So far as I know,  training phase is usually completed offline in Python but not online using Spark. Maybe I can have better idea on this when I learn more.