---
categories:
  - Linux服务器运维
  - Minecraft
title: 使用Docker快速搭建MC服务器
tags:
  - Minecraft
  - docker
  - 运维
date:
updated:
---
# 在自己的[群晖NAS]上部署[Minecraft]服务器
我之前租过一阵子第三方服务器，和五六个朋友在同一个世界里游玩，他们想上线玩的时候就玩，而我每次上线都能发现他们留下的惊喜，真的很欢乐，只是一直苦于每个月要交钱续费。偶然发现Minecraft服务器可以部署在NAS上，自家又正好有台群晖的，这让本就爱折腾的我一阵狂喜，下面进入正文。
## 1.在群晖的套件中心安装docker
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722102821.png)

## 2.在docker注册表中下载Minecraft服务器镜像
单击注册表，搜索框里搜索*minecraft*。但是大概率你打开会和我一样，显示查询失败。如果你能查到，请直接安装，并直接移步下一点![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722103730.png)
查询失败是因为docker hub在中国因为某些政治原因被墙了。然而虽然这个可视化界面用不了，你仍然可以通过命令行拉取镜像。可参考我写的这一篇教程：[[【最新方案】群晖NAS docker查询注册表失败]]

## 3.在映像里配置MC服务器
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722215446.png)
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722215706.png)
环境变量这里的配置有几个细节可以注意
TYPE表示你使用的核心名称，PAPER核心是简单易用的一种，缺点是不支持mod。
如果你有玩Mod需求，可以使用Fabric核心
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722215913.png)
无脑下一步就行了，这边的端口号25565你需要记住，你和朋友联机游玩需要用到
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722220046.png)
存储空间设置这里，在docker目录下新建一个minecraft文件夹
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722220151.png)
装载路径填/data，这个路径请您熟悉，以后相关文件需要放在里面。完事以后无脑下一步就行了
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722220352.png)
容器这里直接启动服务
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722220634.png)
安装上面的步骤可以看到服务器日志，你能看到服务器用的游戏版本号（默认是最新版）。我这里就是1.21
全部加载完成以后，会提示done，代表已完成

## 3.和你的小伙伴愉快的玩耍
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722220835.png)
让你的小伙伴单击多人游戏
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722220912.png)
这里点添加服务器
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722220936.png)
1. 服务器名称随便填
2. 服务器地址是**你的NAS地址:刚才的端口号**
   例如
``` ip
121.121.121.121:25565
```
这里需要注意冒号是英文键盘的冒号。点击完成，然后开心游玩就好啦
如果连不上，你可能需要：
1. **修改配置文件,关闭正版验证**
你的小伙伴可能并没有买正版游戏，此时你需要服务器后台修改server.properties文件，找到online-mode=true将true改成false
2. 你的NAS所在的路由器设置了权限，封锁了25565端口
你需要进入路由器的管理页面，然后开放25565端口的权限