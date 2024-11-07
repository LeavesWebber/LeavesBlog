---
categories:
  - SQL
  - Examples
title: sql中的常见变量类型
tags:
  - sql
date:
updated:
---

### 数值类型

1. **精确数值类型**:
    
    - `int`: 整数，范围从 -2,147,483,648 到 2,147,483,647。
    - `smallint`: 小整数，范围从 -32,768 到 32,767。
    - `tinyint`: 非负整数，范围从 0 到 255。
    - `bigint`: 大整数，范围从 -9,223,372,036,854,775,808 到 9,223,372,036,854,775,807。
    - `decimal(p, s)` 或 `numeric(p, s)`: 定点数，p 是总位数，s 是小数位数。
    - `money` 和 `smallmoney`: 用于货币值。
2. **近似数值类型**:
    
    - `float(n)`: 浮点数，n 是精度位数，范围从 -1.79E+308 到 1.79E+308。
    - `real`: 浮点数，精度稍低于 `float`，范围从 -3.40E+38 到 3.40E+38。

### 字符和字符串类型

1. **字符类型**:
    
    - `char(n)`: 定长字符数据，长度为 n。
    - `varchar(n)` 或 `varchar(max)`: 变长字符数据，最大长度为 n 或 max。
    - `text`: 可变长度的文本数据（已废弃，建议使用 `varchar(max)`）。
2. **Unicode 字符类型**:
    
    - `nchar(n)`: 定长 Unicode 字符数据，长度为 n。
    - `nvarchar(n)` 或 `nvarchar(max)`: 变长 Unicode 字符数据，最大长度为 n 或 max。
    - `ntext`: 可变长度的 Unicode 文本数据（已废弃，建议使用 `nvarchar(max)`）。

### 日期和时间类型

- `date`: 仅日期，格式为 YYYY-MM-DD。
    
- `time`: 仅时间，格式为 HH:MI
    
    .sss。
    
- `datetime`: 日期和时间，范围从 1753-01-01 到 9999-12-31，精度为 3.33 毫秒。
    
- `datetime2`: 日期和时间，范围更广，精度更高。
    
- `smalldatetime`: 日期和时间，范围从 1900-01-01 到 2079-06-06，精度为 1 分钟。
    
- `datetimeoffset`: 日期和时间，带时区偏移。
    
- `timestamp` 或 `rowversion`: 自动生成的唯一二进制数值（不用于日期和时间）。
    

### 二进制类型

- `binary(n)`: 定长二进制数据，长度为 n。
- `varbinary(n)` 或 `varbinary(max)`: 变长二进制数据，最大长度为 n 或 max。
- `image`: 变长二进制数据（已废弃，建议使用 `varbinary(max)`）。

### 其他类型

- `bit`: 布尔类型，值为 0 或 1。
- `uniqueidentifier`: 全局唯一标识符 (GUID)。
- `xml`: XML 数据。
- `sql_variant`: 可以存储不同数据类型的值。
- `cursor`: 游标引用，用于数据库游标操作。
- `table`: 存储结果集的表变量