# This is for the blog "Real-Time Arrival Departure Detection"
# 02/04/18 Yi DING

# Import
import openpyxl


# Read raw beacon data for specific (rider, shop) pair
rider_id = 100556090
shop_id = 147525716


# Open workbook
wb = openpyxl.load_workbook(file_path)
# Get sheet by name
sheet = wb.get_sheet_by_name('Sheet0')
# Row/Column count
row_count = sheet.max_row
column_count = sheet.max_column
# Read value by row and column
value = sheet.cell(row=i,column=j).value