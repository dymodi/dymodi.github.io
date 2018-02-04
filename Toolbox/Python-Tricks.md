--- 
layout: post
title: Python Tricks
date: Jan. 19, 2017
author: Yi DING
---

[comment]: # (Some Python Tricks)

## Find path
```
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

```

## Plot heatmap for numpy matrix
Use [matplotlib.pyplot.matshow](https://matplotlib.org/api/_as_gen/matplotlib.pyplot.matshow.html)

``` python
# Import
import matplotlib.pyplot as plt
import numpy as np
# Display matrix
plt.matshow(X)
plt.show()

```
