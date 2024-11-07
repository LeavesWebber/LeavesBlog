---
categories:
  - SQL
  - Examples
title: sql-用IN子查询实现
tags:
  - sql
date:
updated:
---

==**查询在2022年8月9日销售的产品信息**==

```sql
USE ShopDB
SELECT *
FROM dbo.product
WHERE Pno IN (SELECT Pno FROM dbo.Ord 
              WHERE Odate='08/09/2022')
```