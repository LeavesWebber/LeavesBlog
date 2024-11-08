---
tags:
  - 运维
  - docker
categories:
  - Linux服务器运维
  - docker
title: 【docker换源】Docker拉取镜像失败
date:
updated:
---
# Docker配置国内镜像源以解决拉取镜像失败
我在我的群晖NAS上使用docker时遇到了这个问题
由于docker hub被墙，使用
``` bash
docker pull 你需要的服务名称
```
拉取镜像失败，报错`dial tcp ...:443: i/o timeout`或者`error pulling image configuration`
有两种解决办法：
1. 让你的群晖NAS[科学上网](https://zh.wikipedia.org/wiki/%E7%AA%81%E7%A0%B4%E7%BD%91%E7%BB%9C%E5%AE%A1%E6%9F%A5)，一劳永逸
2. 使用代理镜像源。步骤如下

## 无UI的终端环境：
### 编辑docker镜像源的配置文件
``` bash
sudo vi /etc/docker/daemon.json
```
有时你会发现文件并不存在，这可能是因为你是基于snap安装的docker，那么此时，它的配置文件位置应该如下
``` bash
sudo vi /var/snap/docker/current/config/daemon.json
```
无论怎样，打开配置文件后，就可以往里面添加新源了：
``` bash
{
  "registry-mirrors": [
    "https://docker.1panel.live",
    "https://dockerpull.com",
    "https://dockerproxy.cn"
  ]
}
```
> 由于众所周知的长城防火墙（GFW)的原因，源随时有可能被墙。如果源失效，请自行搜索新源。

可以使用以下命令验证是否替换成功：
``` bash
docker info
```
有时候docker并没有从镜像拉取，那你可以手动指定：
``` bash
docker pull dockerproxy.cn/original-repo
```
以上命令就使用注册表镜像`dockerproxy.cn`拉取服务`original-repo`

---
## 有UI环境：在docker注册表设置页面替换镜像源
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722115415.png)
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722115526.png)
添加一个国内可用的注册表镜像URL然后点确认。我这里用的是
``` link
https://docker.1panel.live
```
其他的一些可能可用的镜像URL：
``` link
https://dockerpull.com 
https://dockerproxy.cn 
https://docker.hpcloud.cloud
https://registry.docker-cn.com
https://docker.mirrors.ustc.edu.cn
https://hub-mirror.c.163.com
https://mirror.baidubce.com
```
可以使用以下命令验证是否替换成功：
``` bash
docker info
```

值得一提的是，有时`docker serach`仍然不可用，但`docker pull`其实是可用的。所以我们挂好[科学上网](https://zh.wikipedia.org/wiki/%E7%AA%81%E7%A0%B4%E7%BD%91%E7%BB%9C%E5%AE%A1%E6%9F%A5)工具，去docker hub官网搜索想用的镜像名称，然后仅仅用docker pull拉取即可
