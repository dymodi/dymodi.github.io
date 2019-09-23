---
layout: post
title: Python Tricks
date: Jan. 19, 2018
author: Yi DING
---



## Contents

[Useful Libraries](#useful-libraries)

[Find path](#find-path)

[Read/write .csv files](#readwrite-csv-files)

[Plot](#plot)

[Date and Time](#date-and-time) 



## Useful Libraries

``` python
import category_encoders          ## Data encoders
import folium                     ## Geographical plot
import keras                      ## Neural network
import matplotlib.pyplot as plt   ## Plot
import nbimporter                 ## Import functions from other notebook
import networkx as nx             ## Graph computation
import numpy as np                ## Mathematical computation
import os                         ## Files and directories
import pandas                     ## Data mining
import seaborn as sns             ## Data visualization
import sklearn                    ## Machine learning
```

## Find path

Use [os](https://docs.python.org/3/library/os.html)

``` python
import os
# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
# Or in Jupyter-Notebook
cwd = os.getcwd()
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
# Save fig setting (avoid being cut)
from matplotlib import rcParams
rcParams.update({'figure.autolayout': True})
# Set fontsize and axis size
import matplotlib.pylab as pylab
params = {'legend.fontsize': 'x-large',
          'figure.figsize': (15, 5),
         'axes.labelsize': 'x-large',
         'axes.titlesize':'x-large',
         'xtick.labelsize':'x-large',
         'ytick.labelsize':'x-large'}
pylab.rcParams.update(params)


fig = plt.figure()
plt.plot(x, y1,  color='salmon', markersize=8, label='first curve')
plt.plot(x, y2,  color='salmon', markersize=8, label='second curve')
# Label and Title
plt.xlabel('xlabel',fontsize=20)
plt.ylabel('ylabel',fontsize=20)
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
# Save Figure
fig.savefig('test.jpg',bbox_inches="tight")
# Show Figure
plt.show()

# Size Control
SMALL_SIZE = 8
MEDIUM_SIZE = 10
BIGGER_SIZE = 12

plt.rc('font', size=SMALL_SIZE)          # controls default text sizes
plt.rc('axes', titlesize=SMALL_SIZE)     # fontsize of the axes title
plt.rc('axes', labelsize=MEDIUM_SIZE)    # fontsize of the x and y labels
plt.rc('xtick', labelsize=SMALL_SIZE)    # fontsize of the tick labels
plt.rc('ytick', labelsize=SMALL_SIZE)    # fontsize of the tick labels
plt.rc('legend', fontsize=SMALL_SIZE)    # legend fontsize
plt.rc('figure', titlesize=BIGGER_SIZE)  # fontsize of the figure title
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

[Folium](https://github.com/python-visualization/folium) is better.

[pyecharts](http://pyecharts.org/#/) is better for China map.

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

### Layer and heatmap on map

Use [folium](https://python-visualization.github.io/folium/)

[GeoJson Related](https://www.jpytr.com/post/analysinggeographicdatawithfolium/)

## Date and Time

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



## Profile the Code

```python
import cProfile
cProfile.run('foo()')
```

or

```bash
python -m cProfile myscript.py
```

