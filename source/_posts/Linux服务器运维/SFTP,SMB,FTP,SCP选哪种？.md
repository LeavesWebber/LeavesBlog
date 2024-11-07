---
tags:
  - 运维
categories:
  - Linux服务器运维
title: SFTP,SMB,FTP,SCP选哪种？
date:
updated:
---

# 服务器支持的远程传文件协议很多，我应该用哪种？

- 简单文件传输：
  FTP（常用21端口）
- 局域网文件共享：
  SMB（常用139端口）
- 网络不稳定情况，需要用户权限管理情况：
  SFTP（基于ssh，用22端口）
  配置：[[配置sftp&&ssh服务]]
- 安全高速：
  WinSCP（基于ssh，用22端口）
