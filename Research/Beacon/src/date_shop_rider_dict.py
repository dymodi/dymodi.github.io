#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun 30 12:18:42 2017

@author: eleme-yi
"""

# This builds a dictionary such that we find the rider according to the date 
# and shop_id

import datetime

# A rider-shop mapping
shop_to_rider_0626 = {54:141,\
                      57:141,\
                      88:140,\
                      89:99,\
                      98:358,\
                      100:141,\
                      185:141,\
                      201:141,\
                      240:141}
shop_to_rider_0628 = {54:141,\
                      57:141,\
                      88:141,\
                      89:99,\
                      98:358,\
                      100:141,\
                      185:141,\
                      201:141,\
                      240:141}
shop_to_rider_0629 = {54:142,\
                      57:142,\
                      88:142,\
                      89:39,\
                      98:99,\
                      100:142,\
                      185:142,\
                      201:142,\
                      240:142}

date1 = datetime.date(2017,6,26)
date2 = datetime.date(2017,6,28)
date3 = datetime.date(2017,6,29)

date_shop_to_rider = {date1:shop_to_rider_0626,
                      date2:shop_to_rider_0628,
                      date3:shop_to_rider_0629}