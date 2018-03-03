---
layout: post
title: Python Tricks
date: Jan. 19, 2018
author: Yi DING
---


## Find path
Use [os](https://docs.python.org/3/library/os.html)

``` python
import os
# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
# The path of data files
data_path = os.path.join(dir_path, '../data/')
# Get all files from the folder
only_files = [f for f in listdir(data_path) if isfile(join(data_path, f))]

```

## Read/write .xlsx files
Use [openpyxl](https://openpyxl.readthedocs.io/en/default/)

``` python
import openpyxl
# Open workbook
wb = openpyxl.load_workbook(file_path)
# Get sheet by name
sheet = wb.get_sheet_by_name('Sheet0')
# Row/Column count
row_count = sheet.max_row
column_count = sheet.max_column
# Read value by row and column
value = sheet.cell(row=i,column=j).value
# Write
wb = Workbook()
# Open active worksheet
ws1 = wb.active
# Create new work sheet
ws2 = wb.create_sheet(title="Pi")
# Write value by row and column
ws.cell(row=i,column=j).value = x
```

## Plot 
### Normal plot
Use [pyplot](https://matplotlib.org/users/pyplot_tutorial.html)

```python
import matplotlib.pyplot as plt
plt.plot(x, y)
plt.xlabel('xlabel')
plt.ylabel('ylabel')
plt.show()
```

### heatmap for numpy matrix
Use [matplotlib.pyplot.matshow](https://matplotlib.org/api/_as_gen/matplotlib.pyplot.matshow.html)

``` python
import matplotlib.pyplot as plt
import numpy as np
# Display matrix
plt.matshow(X)
plt.show()

```

## Data and Time
Use [datetime](https://docs.python.org/3/library/datetime.html) and [pytz](https://www.saltycrane.com/blog/2009/05/converting-time-zones-datetime-objects-python/)

``` python
from datetime import datetime
from pytz import timezone
# Read date and time string
date_str = "2018-02-04 11:00:00"
date_obj = datetime.strptime(date_str, "%Y-%m-%d %H:%M:%S")
# Change time zone
time_SH = timezone('Asia/Shanghai').localize(time_SH)
# Get unix_timestamp
timestamp = time_SH.timestamp()
```

