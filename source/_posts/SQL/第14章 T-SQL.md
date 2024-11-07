---
categories:
  - SQL
title: sql-第14章 T-SQL
tags:
  - sql
date:
updated:
---

# 1. 变量

## 1.1定义

定义语句

```sql
DECLARE  @variable_name  DataType
```

例如

```sql
declare @stuname varchar(20)    --声明一个存放学员姓名的变量stuname.

declare @stuseat int        --声明一个存放学员座位号的变量stuseat
```

[[sql中的常见变量类型]]

## 1.2 赋值

1. 使用 `set` 语句
    
    ```sql
    Set  @variable_name=value
    ```
    
2. 使用 `select` 语句
    
    ```sql
    Select  @variable_name=value
    ```
    
    [[两者的区别]]
    
    ## 1.3 拼接
    
    假设变量值是“冰箱”，那怎么查找“海尔冰箱”呢？ 有两种方式
    
3. 定义时可以用通配符
    
    ```sql
    DECLARE @Product_name VARCHAR(20)  -- 声明变量用来存放产品名称
    SET @Product_name = '%冰箱%'       -- 使用SET语句给变量赋值，并添加通配符
    SELECT * 
    FROM Product
    WHERE Pname LIKE @Product_name     -- 通过局部变量向SQL语句传递数据
    ```
    
4. `WHERE`子句里使用拼接
    
    ```sql
    DECLARE @Product_name VARCHAR(20)  -- 声明变量用来存放产品名称
    SET @Product_name = '冰箱'         -- 使用SET语句给变量赋值
    SELECT * 
    FROM Product
    WHERE Pname LIKE '%' + @Product_name + '%'  -- 通过局部变量向SQL语句传递数据，并在WHERE子句中添加通配符
    ```