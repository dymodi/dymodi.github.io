---
layout: post
title: SQL Basic
date: Nov. 2, 2017
author: Yi DING
---

The basic operations here are from [codecademy SQL course](https://www.codecademy.com/learn/learn-sql)

### Basic Operations
``` SQL
SELECT * FROM celebs;
CREATE TABLE celebs (id INTEGER, name TEXT, age INTEGER);
INSERT INTO celebs VALUES (1, 'Justin Bieber', 21);
UPDATE celebs SET age = 3 WHERE id = 1;
ALTER TABLE celebs ADD COLUMN twitter_handle TEXT;
```

### Drop and create

```sql
---- Create new table
drop table if exists some_temp_table;
create table some_temp_table as
select some_col from another_table;
---- Insert table with data partition
INSERT overwrite TABLE some_table partition(dt='${day}')
```

### Make Histogram

``` SQL
select round(data,1) as bucket, count(*) as count
from data_table
group by round(data,1)
```

### Add Row Numbers
``` SQL
select row_number() 
over (partition by some_attr order by another_attr) as rn 
```

### Get Next/Last Row

``` SQL
select (LEAD (another_attr, 1) 
        OVER (PARTITION by another_attr ORDER BY rn)) as next_row
select (LAG (another_attr, 1) 
        OVER (PARTITION by another_attr ORDER BY rn)) as last_row
```

### Parse JSON
``` SQL
select parse_json_object(some_json_obj, 'inner_index') from some_table
```


