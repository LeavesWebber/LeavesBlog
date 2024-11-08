---
categories:
  - Linux基础
  - 命令详细用法
  - 系统识别
title: p0f
tags:
  - 运维
  - linux
  - 网络安全
date:
updated:
---

> p0f是**网络流量分析工具**，用于**被动的**识别和分析网络中的**主机和操作系统**。通过分析数据包的特征来判断数据包的来源，包括源IP地址、操作系统类型和版本号、网络设备类型等信息。

# 优势

- 被动检测：p0f是一种被动探测工具，不向目标系统发送任何数据，只是**被动地接受**来自目标系统的数据进行分析。
- 穿透防火墙：即使在目标系统上装有性能良好的防火墙，p0f也能有效地进行指纹识别。
- 多功能性：p0f不仅可以识别操作系统类型和版本，还可以检测**NAT**、**负载均衡**、**应用代理**等网络配置，甚至能检测出主机上是否有**防火墙**存在。

# Option

- **-i iface**：监听指定的网络接口。
- **-r file**：从给定文件中读取脱机pcap数据，用于分析历史网络流量。
- **-f file**：从指定文件中读取指纹数据库，用于提高操作系统识别的准确性。
- **-o file**：将识别结果输出到指定的日志文件中。
- **-s name**：在命名的unix套接字上回答API查询。
- **-u user**：切换到指定的非特权帐户和chroot。
- **-d**：转入背景运行（需要-o或-s选项）。
- **-p**：将监听接口设置为混杂模式，以捕获所有经过该接口的数据包。
- **-L**：列出所有可用接口。

# 实验

1. 先在终端开启p0f,设置输出日志的位置
    
    ```bash
    p0f -o /home/kali/Documents/p0f.log
    ```
    
2. 开启另一个终端，试运行sftp之类的服务
    
    ```bash
    sftp 用户名@服务器地址
    ```
    
3. 回到刚才的终端，可以看到分析信息已经输出 如上图，已经获取到了目的主机的os信息
    
4. 查看日志文件 cat一下刚才的日志，也能看到分析报告