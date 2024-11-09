---
categories:
  - Linux服务器运维
  - docker
title: Docker一文速成【上手干货版】
tags:
  - docker
  - 运维
date: 
updated: 
permalink: 
---
# Docker命令快速上手（按过程顺序）
## 搜索镜像
``` bash
docker search 你需要的镜像名称
```
由于众所周知的长城防火墙（GFW）原因，这个命令很可能用不了，此时在你的电脑上开启[科学上网](https://zh.wikipedia.org/wiki/%E7%AA%81%E7%A0%B4%E7%BD%91%E7%BB%9C%E5%AE%A1%E6%9F%A5)，然后访问[Docker Hub](https://hub.docker.com/),搜索你需要的镜像名，效果一样的

##  拉取镜像
``` bash
docker pull 镜像名
```
如果拉取失败，可以参考我的这篇教程：[【Docker换源】配置国内镜像源以解决拉取镜像失败]()

## 从镜像创建并启动容器
假设你已经拉取了名为**ubuntu:latest**的镜像，此时我们基于这个镜像创建一个实例并运行：
``` bash
docker run -it --name ConName ubuntu:latest /bin/bash
```
这个命令会：
1. 创建一个新的容器。
2. 基于最新的Ubuntu镜像。
3. 将容器命名为"ConName"，此名称可选
4. 以交互模式启动并分配一个伪终端，这样做防止容器一启动就退出
5. 在容器内启动Bash shell。

执行此命令后，将直接进入容器的Bash环境，此时命令提示符会发生变化，如下：
``` bash
root@C20241002102521:/# docker run -it --name ConName ubuntu:latest /bin/bash
root@b4969f13c14b:/#
```
观察发现从`root@C20241002102521:/#`变为`root@b4969f13c14b:/#`，后者即是ubuntu容器的终端，接下来就可以像使用普通Ubuntu系统一样进行操作

一个更为复杂的创建实例：
``` bash
docker run -d -p 40080:80 -p 40443:443 -p 45244-45245:5244-5245 -v /path/on/host:/app/data -v /path/to/host/alist/data:/opt/alist/data xhofe/alist:latest
```
这在创建时指定了端口号的映射（包括范围映射），也指定了把容器的数据挂载到宿主机的哪个位置（多个位置）以此实现数据持久化

## 由容器回到宿主机
依次按以下快捷键即可：
`Ctrl`+`P`，`Ctrl+Q`

之后若想重新回到容器，使用命令
``` bash
docker attach 容器名
```

## 退出容器
在容器内执行：
``` bash
exit
```
或使用快捷键`Ctrl`+`D`

## 从宿主机创建容器新进程并开始会话
``` bash
docker exec -it <container_id_or_name> /bin/bash
```
与`docker attach`不同，这样做会开启一个新进程而不是进入容器的主控制台

## 查看现有容器情况
``` bash
docker ps
```

## 停止某个容器
``` bash
docker stop containerName
```

## 重启某个容器
``` bash
docker restart containerName
```



