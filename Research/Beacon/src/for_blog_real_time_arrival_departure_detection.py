# This is for the blog "Real-Time Arrival Departure Detection"
# 02/04/18 Yi DING

# Import
import openpyxl
import os

# This path of current file
dir_path = os.path.dirname(os.path.realpath(__file__))
# The path of data files
data_path = os.path.join(dir_path, '../data/')

# Read raw beacon data for specific (rider, shop) pair
rider_id = 100556090
shop_id = 147525716
date_str = '2018-02-04'

# Set file name
file_name = '_'.join(['dw_ai_clairvoyant_beacon', date_str, str(rider_id), str(shop_id)])
file_name = '.'.join([file_name, 'xlsx'])
file_path = os.path.join(data_path, file_name)

# Open workbook
wb = openpyxl.load_workbook(file_path)
# Get sheet by name
sheet = wb.get_sheet_by_name('Sheet0')
# Row/Column count
row_count = sheet.max_row
column_count = sheet.max_column

# Get argument list
argument_list = []
for j in range(1, column_count+1):
    argument_list.append(sheet.cell(row=1,column=j).value)

print(argument_list)

# Read value by row and column
#value = sheet.cell(row=i,column=j).value