---
layout: post
title: Python Tricks
date: Jan. 19, 2018
author: Yi DING
---

## Contents

[Find path](Find-path)

[Read/write .csv files](Read/write .csv-files)



## Find path

Use [os](https://docs.python.org/3/library/os.html)

``` python
import os
# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
# The path of data files
data_path = os.path.join(dir_path, '../data/')
# Get all files from the folder
only_files = [f for f in os.listdir(data_path) if os.path.isfile(os.path.join(data_path, f))]

```

## Read/write .csv files

Use [csv](https://docs.python.org/3/library/csv.html)

``` python
import csv
# Write dictionary
with open('names.csv', 'w', newline='') as csvfile:
    fieldnames = ['first_name', 'last_name']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerow({'first_name': 'Baked', 'last_name': 'Beans'})
    writer.writerow({'first_name': 'Lovely', 'last_name': 'Spam'})
    writer.writerow({'first_name': 'Wonderful', 'last_name': 'Spam'})
    
# Write rows
with open('some.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerows(someiterable)
   
# Read rows
with open('eggs.csv', 'rb') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
        print ', '.join(row)
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
[HTML Color Codes](https://htmlcolorcodes.com/)

### Normal plot

Use [pyplot](https://matplotlib.org/users/pyplot_tutorial.html)

```python
import matplotlib.pyplot as plt
plt.plot(x, y1,  color='salmon', markersize=8, label='first curve')
plt.plot(x, y2,  color='salmon', markersize=8, label='second curve')
plt.xlabel('xlabel')
plt.ylabel('ylabel')
plt.title('title')
# Set axis range
axes = plt.gca()
axes.set_ylim([bottom, top])
axes.set_xlim([left, right])
plt.legend()
plt.show()
# Subplot
plt.subplot(2, 1, 1)
plt.plot(x1, y1, 'o-')
plt.title('A tale of 2 subplots')
plt.ylabel('Damped oscillation')

plt.subplot(2, 1, 2)
plt.plot(x2, y2, '.-')
plt.xlabel('time (s)')
plt.ylabel('Undamped')

plt.show()
```

### Heatmap for numpy matrix
Use [matplotlib.pyplot.matshow](https://matplotlib.org/api/_as_gen/matplotlib.pyplot.matshow.html)

``` python
import matplotlib.pyplot as plt
import numpy as np
# Display matrix
plt.matshow(X)
plt.show()
```

### Trace and way point draw on map

Use [gmplot](https://github.com/vgm64/gmplot)


``` python
import gmplot
gmap = gmplot.GoogleMapPlotter(latitude_center, longitude_center, 16)
#gmap = gmplot.from_geocode("Shanghai")
# Trace plot
gmap.plot(latitude_list, longitude_list, 'blue', edge_width=10)
# Way point plot
gmap.scatter(latitude_list, longitude_list, 'blue', marker=True)
# Write to .html file
gmap.draw(file_name)
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

