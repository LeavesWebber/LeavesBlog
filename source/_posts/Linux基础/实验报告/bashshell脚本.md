---
categories:
  - Linux基础
  - 实验报告
title: bash脚本实验
tags:
  - 运维
  - linux
  - bash
  - 实验
date:
updated:
---

# 练习1：条件与循环

## 脚本源码

```bash
#!/bin/bash
#Copyright ©️LeavesWebber
#判断是否产存在files文件夹
if [ -d "files" ];then
  cd files
else
  mkdir files
  cd files
  fi

#循环创建3个文件
for file in file{1..3}.txt;
do
    touch "$file"
done

#重命名file1.txt为new_file1.txt
if [ -f "file1.txt" ];then
  mv file1.txt new_file1.txt
else
  echo "文件不存在，重命名失败"
  fi
#向file1.txt写入"hello"
echo "Hello" >> file1.txt
#查看file1.txt中的内容
cat file1.txt
#查看目录中的文件
ls
```

## 报告截图

![imagepng](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20241004220018.png)

# 练习2：计算文件大小

## 源码

```bash
#!/bin/bash
# Copyright ©️LeavesWebber
size=0
for file in ./*; do
  if [ -f "$file" ]; then
    size=$((size+$(stat -c%s "$file")))
  fi
done
echo "目录下所有文件的总大小为：$size 字节"
```

## 截图

![imagepng](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20241004224914.png)

# 练习3：传参改造

## 对练习1的传参改造

```bash
#!/bin/bash
#判断是否产存在files文件夹
if [ "$#" -ne 2 ];then
  echo "Usage: $0 <Directory_Name> <Files_Number>"
  exit 1
fi
Directory_Name=$1;
Files_Number=$2;

if [ -d "$Directory_Name" ];then
  cd "$Directory_Name" || exit
else
  mkdir "$Directory_Name"
  cd "$Directory_Name" || exit
fi

#循环创建3个文件
for (( i=1; i<=Files_Number; i++));
do
  touch "file${i}.txt"
done

#重命名file1.txt为new_file1.txt
if [ -f "file1.txt" ];then
  mv file1.txt new_file1.txt
else
  echo "文件不存在，重命名失败"
fi
#向file1.txt写入"hello"
echo "Hello" >> file1.txt
#查看file1.txt中的内容
cat file1.txt
#查看目录中的文件
ls
```

## 对练习2的传参改造

```bash
#!/bin/bash
# Copyright ©️LeavesWebber
if [ "$#" -ne 1 ];then
  echo "Usage: $0 <Directory_Name>"
  exit 1
fi
size=0
for file in "$1"/*; do
  if [ -f "$file" ]; then
    size=$((size+$(stat -c%s "$file")))
  fi
done
echo "目录下所有文件的总大小为：$size 字节"
```