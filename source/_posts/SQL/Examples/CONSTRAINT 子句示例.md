---
categories:
  - SQL
  - Examples
title: sql-CONSTRAINT 子句示例
tags:
  - sql
date:
updated:
---

`CONSTRAINT` 子句用于在**创建**或**修改**表时定义约束。

# 基本语法

```sql
CREATE TABLE table_name (
    column1 datatype constraints,
    column2 datatype constraints,
    ...
    CONSTRAINT constraint_name constraint_type (column_name)
);
```

# 创建带有约束的表

## 1. 创建带有命名主键的表

在创建表时，可以使用 `CONSTRAINT` 子句来命名主键约束。这有助于以后更方便地引用和管理该约束。

```sql
CREATE TABLE customer (
    cno CHAR(15),
    cname VARCHAR(30),
    city VARCHAR(30),
    manager VARCHAR(10),
    tel CHAR(20),
    CONSTRAINT pk_customer_cno PRIMARY KEY (cno)
);
```

在这个示例中：

- `CONSTRAINT pk_customer_cno` 指定约束的名称为 `pk_customer_cno`。
- `PRIMARY KEY (cno)` 指定 `cno` 列为主键。

## 2. 创建带有唯一性约束的表

唯一性约束确保列中的所有值都是唯一的。

```sql
CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    emp_email VARCHAR(50),
    CONSTRAINT uq_emp_email UNIQUE (emp_email)
);
```

在这个示例中：

- `CONSTRAINT uq_emp_email` 指定约束的名称为 `uq_emp_email`。
- `UNIQUE (emp_email)` 指定 `emp_email` 列具有唯一约束。

## 3. 创建带有外键约束的表

外键约束用于维护表之间的参照完整性。

```sql
CREATE TABLE orders (
    order_id INT,
    customer_id CHAR(15),
    order_date DATE,
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (cno)
);
```

在这个示例中：

- `CONSTRAINT fk_customer_id` 指定约束的名称为 `fk_customer_id`。
- `FOREIGN KEY (customer_id) REFERENCES customer (cno)` 指定 `customer_id` 列为外键，引用 `customer` 表的 `cno` 列。

## 4. 创建带有检查约束的表

检查约束用于确保列中的值满足指定的条件。

```sql
CREATE TABLE product (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    CONSTRAINT chk_price CHECK (price > 0)
);
```

在这个示例中：

- `CONSTRAINT chk_price` 指定约束的名称为 `chk_price`。
- `CHECK (price > 0)` 指定检查约束，确保 `price` 列的值大于 0。

# 修改表以添加命名约束

可以使用 `ALTER TABLE` 语句来添加命名约束。

## 添加命名主键约束

```sql
ALTER TABLE customer
ADD CONSTRAINT pk_customer_cno PRIMARY KEY (cno);
```

## 添加命名唯一约束

```sql
ALTER TABLE employee
ADD CONSTRAINT uq_emp_email UNIQUE (emp_email);
```

## 添加命名外键约束

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (cno);
```

# 删除命名约束

可以使用 `ALTER TABLE` 语句来删除命名约束。

#### 删除主键约束

```sql
ALTER TABLE customer
DROP CONSTRAINT pk_customer_cno;
```

#### 删除唯一约束

```sql
ALTER TABLE employee
DROP CONSTRAINT uq_emp_email;
```

#### 删除外键约束

```sql
ALTER TABLE orders
DROP CONSTRAINT fk_customer_id;
```