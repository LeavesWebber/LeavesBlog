---
categories:
  - SQL
  - Examples
title: sql-将产品表中海尔公司的产品的产品信息单独存入P_HaiEr表中
tags:
  - sql
date:
updated:
---

将**产品表**中海尔公司的产品的产品信息单独存入**P_HaiEr表**中

```sql
SELECT *

INTO P_HaiEr

FROM Product

WHERE Pname LIKE '%海尔%'
```