---
layout: post
title: SQL Basic
date: Nov. 2, 2017
author: Yi DING
---

The basic operations here are from [codecademy SQL course](https://www.codecademy.com/learn/learn-sql)

### Basic Operations
```sql
SELECT * FROM celebs;
CREATE TABLE celebs (id INTEGER, name TEXT, age INTEGER);
INSERT INTO celebs VALUES (1, 'Justin Bieber', 21);
UPDATE celebs SET age = 3 WHERE id = 1;
ALTER TABLE celebs ADD COLUMN twitter_handle TEXT;
```

### Drop and create

```sql
---- Create new table
DROP TABLE if exists some_temp_table;
CREATE TABLE some_temp_table AS
SELECT some_col FROM another_table;
---- Insert table with data partition
INSERT overwrite TABLE some_table partition(dt='${day}')
```

### Tables UNION

```sql
SELECT *
FROM ( SELECT A FROM table_1 )
UNION( SELECT A FROM table_2)
```

### Make Histogram

```sql
SELECT round(data,1) AS bucket, COUNT(*) AS cnt
FROM data_table
GROUP BY round(data,1)
```

### Add Row Numbers
```sql
SELECT row_number() 
OVER (partition BY some_attr ORDER BY another_attr) AS rn 
```

### Get Next/Last Row

```sql
SELECT (LEAD (another_attr, 1) 
        OVER (PARTITION BY another_attr ORDER BY rn)) as next_row
SELECT (LAG (another_attr, 1) 
        OVER (PARTITION BY another_attr ORDER BY rn)) as last_row
```

### Parse JSON
```sql
SELECT parse_json_object(some_json_obj, 'inner_index') FROM some_table
```

### Generate Constant Values
```sql
SELECT ones.n + 10*tens.n AS test_id
FROM (VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) ones(n),
(VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) tens(n)
WHERE ones.n + 10*tens.n BETWEEN 1 AND 100
ORDER BY 1
```

### Select Random Row

```sql
SELECT * FROM data_table
ORDER BY RAND(unix_timestamp()) 
LIMIT 1
```

