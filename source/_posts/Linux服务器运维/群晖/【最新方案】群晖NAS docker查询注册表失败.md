---
categories:
  - Linux服务器运维
  - 群晖
title: 【最新方案】群晖NAS docker查询注册表失败
tags:
  - 运维
  - 群晖
  - docker
date:
updated:
---
这个问题是由于docker hub在大陆因为某些政治原因被墙了，导致官方镜像源失效。然而虽然这个可视化界面用不了，你仍然可以通过PuTTY 远程ssh连接服务器，然后用命令行拉取镜像，这是一种平替办法。操作步骤如下
# 1.在控制中心打开群晖SSH服务
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722104848.png)
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722104915.png)
> 完事之后不要忘记点*应用*按钮

# 2.下载PuTTY
官网下载地址:[Download PuTTY: latest release (0.81) (greenend.org.uk)](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722105431.png)
这个下载到你的windows上就行，而不是群晖服务器。因为你要用这个工具去远程控制你的群晖。
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722105649.png)
下好以后在开始菜单直接搜就可以打开

# 3.连接群晖服务器，并获得root权限
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722110158.png)
这一步如果连不上，你应当检查你的群晖服务器所在的网络中，路由器是不是没有开放22端口的权限，因为这个ssh服务占用了所在地址的22端口
连上以后它会要求你输入你的群晖的登录账号和密码。输密码时，由于某些特性你输的东西不会展现出来，有时会让人困惑。这个不必理会，输完密码直接回车就行
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722110942.png)
如果你输对了，就会进入上图的样子。否则会提示access denied之类的，重新输入即可
完成后我们还需要获取root权限为下面使用docker作准备，命令如下：
``` bash
sudo -i
```
会提示你再输入一遍密码
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722111503.png)
输对了绿字就会以root开头，获取权限成功

# 4.搜索并拉取你需要的镜像
PuTTY界面里无法使用Ctrl+C/V进行复制粘贴，所以在此之前先介绍你等会要用到的两个技巧
1. 如何复制命令行里的文字
   这个PuTTY界面里出现的文字你想复制，光标**直接选中**想复制的东西就行了，它会自动帮你复制
2. 如何粘贴你从别的地方复制的代码进命令行
   鼠标**右键单击**一下即可，它会粘贴剪贴板里你复制的东西
在root权限下输入如下代码，可以搜索镜像。这样做其实就相当于你在docker的注册表界面里使用搜索
``` bash
docker search [你需要的服务名称]
```
如我想搜索Minecraft镜像，如图所示![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722113204.png)
下面列出的就是搜索出来的结果，通常你会用到第一个（我这里是itzg/minecraft-server），复制这个名称，然后使用如下拉取命令
``` bash
docker pull [你复制的服务名称]：版本号
```
如果不加版本号，默认会下载最新版本（latest tag）
如我这里就是![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722113535.png)
接着等待它下载完成即可，完成后你会在docker的映像里看到你下的东西
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240722113921.png)
表明下载成功
然而由于docker hub被墙的原因，大概率你会遇到`dial tcp ...:443: i/o timeout`或者`error pulling image configuration`这样的错误，提示你拉取失败。如果你遇到这样的问题，可参考我写的这一篇教程：[[【docker换源】Docker拉取镜像失败]]