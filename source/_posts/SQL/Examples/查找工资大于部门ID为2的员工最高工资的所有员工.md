---
categories:
  - SQL
  - Examples
title: sql-查找工资大于部门ID为2的员工最高工资的所有员工
tags:
  - sql
date:
updated:
---

以下语句查找工资大于部门`ID`为`2`的员工最高工资的所有员工：

```sql
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > ALL (SELECT 
            salary
        FROM
            employees
        WHERE
            department_id = 2)
ORDER BY salary;
```