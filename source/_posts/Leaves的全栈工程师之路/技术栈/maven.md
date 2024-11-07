---
title: 【换国内仓库】网络原因导致maven构建错误
tags:
  - maven
categories:
  - Leaves的全栈工程师之路
  - 技术栈
date:
updated:
---
# 【换国内仓库】网络原因导致maven构建错误
基于Maven构建项目时，构建过程中可能出问题，如下：
``` bash
[WARNING] Failed to download maven-compiler-plugin-3.13.0.pom [[https://repo.maven.apache.org/maven2/]](https://repo.maven.apache.org/maven2/]) [WARNING] Failed to download maven-install-plugin-3.1.2.pom [[https://repo.maven.apache.org/maven2/]](https://repo.maven.apache.org/maven2/]) [WARNING] Failed to download maven-deploy-plugin-3.1.2.pom [[https://repo.maven.apache.org/maven2/]](https://repo.maven.apache.org/maven2/]) [WARNING] Failed to download maven-surefire-plugin-3.2.5.pom [[https://repo.maven.apache.org/maven2/]](https://repo.maven.apache.org/maven2/]) [WARNING] Failed to download maven-jar-plugin-3.4.1.pom [[https://repo.maven.apache.org/maven2/]](https://repo.maven.apache.org/maven2/]) [WARNING] Failed to download maven-resources-plugin-3.3.1.pom [[https://repo.maven.apache.org/maven2/]](https://repo.maven.apache.org/maven2/]) Cannot resolve plugin org.apache.maven.plugins:maven-install-plugin:3.1.2 Cannot resolve plugin org.apache.maven.plugins:maven-deploy-plugin:3.1.2 Cannot resolve plugin org.apache.maven.plugins:maven-compiler-plugin:3.13.0 Cannot resolve plugin org.apache.maven.plugins:maven-jar-plugin:3.4.1 Cannot resolve plugin org.apache.maven.plugins:maven-surefire-plugin:3.2.5 Cannot resolve plugin org.apache.maven.plugins:maven-resources-plugin:3.3.1 
```
这通常是国内访问maven中央仓库中出现网络问题。解决办法：
## 方法1：开启系统科学上网的全局代理模式
[什么是科学上网？](https://zh.wikipedia.org/wiki/%E7%AA%81%E7%A0%B4%E7%BD%91%E7%BB%9C%E5%AE%A1%E6%9F%A5)


## 方法2：在`pom.xml`中添加如下国内镜像仓库地址
在 `<project>` 标签内添加如下内容：
``` xml
<repositories>
    <repository>
        <id>aliyunmaven</id>
        <url>https://maven.aliyun.com/repository/public</url>
        <releases>
            <enabled>true</enabled>
        </releases>
        <snapshots>
            <enabled>false</enabled>
        </snapshots>
    </repository>
</repositories>

<pluginRepositories>
    <pluginRepository>
        <id>aliyunmaven</id>
        <url>https://maven.aliyun.com/repository/public</url>
        <releases>
            <enabled>true</enabled>
        </releases>
        <snapshots>
            <enabled>false</enabled>
        </snapshots>
    </pluginRepository>
</pluginRepositories>
```