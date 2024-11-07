---
categories:
  - Linux基础
  - 命令详细用法
  - shell基础
title: bash中的if判断
tags:
  - 运维
  - linux
  - bash
date:
updated:
---

# 基本语法

```bash
if [ condition ]; then
    # 如果条件为真，则执行这里的代码
elif [ other_condition ]; then
    # 如果第一个条件为假，但第二个条件为真，则执行这里的代码
else
    # 如果所有条件都为假，则执行这里的代码
fi
```

# 条件表达式

## 1. **字符串比较**：

- `str1 == str2`：检查两个字符串是否相等。
- `str1 != str2`：检查两个字符串是否不相等。

## 2. **数值比较**：

- `-eq`：等于。
    
- `-ne`：不等于。
    
- `-lt`：小于。
    
- `-le`：小于或等于。
    
- `-gt`：大于。
    
- `-ge`：大于或等于。
    
    例如：`if [ $a -eq $b ]; then`
    

## 3. **文件测试**：

- `-e file`：文件存在。
    
- `-f file`：文件存在且为普通文件。
    
- `-d file`：文件存在且为目录。
    
- `-r file`：文件存在且可读。
    
- `-w file`：文件存在且可写。
    
- `-x file`：文件存在且可执行。
    
    例如：`if [ -e filename ]; then`
    

## 4. **复合条件**：

- `&&`：逻辑与。
    
- `||`：逻辑或。
    
    注意：在 `[ ]` 中使用 `&&` 和 `||` 时，需要用括号将它们括起来，并且每个条件之间需要用 `]` 和 `[` 分隔。
    

# 示例

1. **字符串比较**：

```bash
if [ "$string1" == "$string2" ]; then
    echo "The strings are the same."
else
    echo "The strings are not the same."
fi
```

2. **数值比较**：

```bash
a=10
b=20

if [ $a -lt $b ]; then
    echo "a is less than b"
fi
```

3. **文件测试**：

```bash
filename="testfile.txt"

if [ -e $filename ]; then
    echo "File exists."
else
    echo "File does not exist."
fi
```

4. **复合条件**：

```bash
if [ $a -lt 10 ] && [ $b -gt 5 ]; then
    echo "a is less than 10 and b is greater than 5."
fi

if [ $a -lt 10 ] || [ $b -gt 5 ]; then
    echo "a is less than 10 or b is greater than 5."
fi
```

### 注意事项

- 在 `[ ]` 内，测试表达式两侧需要有空格。
- 变量应该用双引号包围，以避免空值或包含空格的值导致的错误。
- 在使用 `&&` 和 `||` 时，确保每个条件都用 `[ ]` 包围，并且用 `]` 和 `[` 分隔。
- 使用 `bash` 脚本时，建议使用 `bash` 而不是 `sh`，因为 `sh` 可能不支持某些 `bash` 特性。