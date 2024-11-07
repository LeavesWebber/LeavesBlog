---
categories:
  - SQL
  - Examples
title: sql-用EXISTS子查询实现
tags:
  - sql
date:
updated:
---

==**查询在2022年8月9日销售的产品信息**==

```sql
USE ShopDB
SELECT *
FROM dbo.product AS pro
WHERE EXISTS 
(SELECT 1 
FROM dbo.Ord AS ord 
WHERE Odate='08/09/2022' 
    AND ord.Pno=pro.Pno)
```