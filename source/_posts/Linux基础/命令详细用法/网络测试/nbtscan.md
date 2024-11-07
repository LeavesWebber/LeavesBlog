---
categories:
  - Linux基础
  - 命令详细用法
  - 网络测试
title: nbtscan
tags:
  - 运维
  - linux
  - 网络安全
date:
updated:
---

> `nbtscan` 扫描到的 **NetBIOS** 信息可以用于多种网络安全分析和评估活动。

# 功能

## 1. 网络发现和资产识别：

- 识别网络上所有活跃的设备，包括服务器、工作站、打印机等。
- 确定设备在网络中的物理位置（通过 MAC 地址）。

## 2.漏洞评估：

- 识别可能存在漏洞的操作系统和版本，因为 NetBIOS 信息有时可以揭示**设备的操作系统类型**。
- **确定开放的网络服务和应用程序**，这可能成为潜在的攻击目标。

## 3.凭证收集：

- 通过 NetBIOS 名称，可以识别可能的用户名和共享资源，这可能有助于攻击者**收集用于社会工程攻击的信息**。

## 4.域和信任关系分析：

- 识别域控制器和成员计算机，了解组织的域结构。
- 分析域之间的信任关系，评估潜在的水平移动和提升权限的风险。

## 5. 网络拓扑和架构分析：

- 通过分析 NetBIOS 信息，可以更好地理解网络的逻辑结构和通信模式。
- 识别关键网络设备和通信路径，评估潜在的单点故障和网络分段问题。

## 6.安全策略和控制评估：

- 确定哪些设备和资源对外部或未经授权的用户开放，评估安全策略的有效性。
- 识别未加密的 NetBIOS 流量，评估数据泄露和**中间人攻击**的风险。

## 7. 威胁狩猎和入侵检测：

- 使用 NetBIOS 信息来**追踪可疑活动和潜在的恶意行为**。
- 识别异常的网络通信模式，如非工作时间的通信或与已知恶意 IP 地址的通信。

## 8. 安全意识和培训：

- 利用 NetBIOS 扫描结果来**教育用户关于网络安全最佳实践**，例如强密码策略和安全配置。

## 9.合规性和审计：

- 确保网络配置和设备符合行业标准和法规要求。
- 为安全审计提供网络设备和配置的详细记录。

## 10. 应急响应和取证：

- 在发生安全事件时，使用 NetBIOS 信息来快速识别受影响的系统和数据。
- 收集和分析 NetBIOS 相关的网络流量和日志，以支持取证分析。

# Option

```bash
nbtscan [-v] [-d] [-e] [-l] [-t timeout] [-b bandwidth] [-r] [-q] [-s separator] [-m retransmits] (-f filename)|(<scan_range>) 
-v verbose output. Print all names received from each host 
-d dump packets. Print whole packet contents. 
-e Format output in /etc/hosts format. 
-l Format output in lmhosts format. Cannot be used with -v, -s or -h options. 
-t timeout wait timeout milliseconds for response. Default 1000. 
-b bandwidth Output throttling. Slow down output so that it uses no more that bandwidth bps. Useful on slow links, so that ougoing queries donot get dropped. 
-r use local port 137 for scans. Win95 boxes respond to this only. You need to be root to use this option on Unix. 
-q Suppress banners and error messages, 
-s separator Script-friendly output. Donot print column and record headers, separate fields with separator. 
-h Print human-readable names for services. Can only be used with 
-v option. 
-m retransmits Number of retransmits. Default 0. 
-f filename Take IP addresses to scan from file filename. -f - makes nbtscan take IP addresses from stdin. 
<scan_range> what to scan. Can either be single IP like 192.168.1.1 or range of addresses in one of two forms: xxx.xxx.xxx.xxx/xx or xxx.xxx.xxx.xxx-xxx.
```

# Examples

```bash
nbtscan -r 192.168.1.0/24
    Scans the whole C-class network.
nbtscan 192.168.1.25-137
    Scans a range from 192.168.1.25 to 192.168.1.137
nbtscan -v -s : 192.168.1.0/24
    Scans C-class network. Prints results in script-friendly
    format using colon as field separator.
    Produces output like that:
    192.168.0.1:NT_SERVER:00U
    192.168.0.1:MY_DOMAIN:00G
    192.168.0.1:ADMINISTRATOR:03U
    192.168.0.2:OTHER_BOX:00U
    ...
nbtscan -f iplist
    Scans IP addresses specified in file iplist.
```