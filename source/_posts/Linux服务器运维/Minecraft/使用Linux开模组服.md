# 使用Linux 开MC fabric模组服
> 我的Linux是Ubuntu版本

参考了官方网址：
[在不使用GUI的情况下安装 Fabric Server [Fabric Wiki] (fabricmc.net)](https://fabricmc.net/wiki/zh_cn:player:tutorials:install_server)
## 1.更新apt
``` bash
apt update
```
---
## 2.安装java依赖
``` bash
apt install openjdk-22-jre-headless
```
不知道什么原因，jdk22装不了
如果提示==Unable to locate package openjdk-21-jre-headless==，那把版本换一下（比如换成17有可能会解决问题）
如果你用的是Fedora、CentOS等， 尝试
``` bash
dnf install java-latest-openjdk-headless
```
常用的版本是JDK8，JDK17，JDK22

---

## 3.下载fabric-installer并执行安装
### 下载网址
[Installation for Minecraft Launcher | Fabric (fabricmc.net)](https://fabricmc.net/use/installer/)
使用文件服务把installer传到服务器上，如[[配置sftp&&ssh服务]]
### 安装命令
``` bash
java -jar installer.jar server -mcversion <Minecraft 版本，不含尖括号> -downloadMinecraft
```
如我想玩的是1.20.1，则：
``` bash
java -jar fabric-installer-1.0.1.jar server -mcversion 1.20.1 -downloadMinecraft
```
---
## 4.启动命令
### 关于开服命令
类似于Windows的.exe，Java与之对应的可执行文件后缀为.jar，运行其的指令很简单：
``` bash
java -jar 程序名.jar
```
而MC的开服程序一般为`server.jar`，那么开服命令就为：
``` bash
java -jar server.jar
```
不过事情到这里没有结束，java指令还有一些可选的参数。事实上，作者常用的开服命令如下：
``` bash
java -Xincgc -Xmx7G -Xms4G -jar fabric-server-launch.jar nogui
```
意思是：以最大7G，最小4G的RAM运行`fabric-server-launch.jar`（我开的是fabric核心的模组服，所以开服程序不是server.jar而是fabric-server-launch.jar，根据你自己情况修改）

有时，如果你是在用ssh工具使用linux命令，那么ssh工具关了可能应用进程也会没掉。此时用nohup命令启动游戏可能会解决问题，如下
``` bash
nohup java -Xmx6G -jar fabric-server-launch.jar nogui
```
终端也许会返回
*nohup: ignoring input and appending output to ‘nohup.out’* 
证明运行成功，忽略输入输出，将信息化信息记录到nohup.out文件中

![favicon.ico](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/favicon.ico)



# 常用游戏包地址（附开服命令）
## fabric
[Download Minecraft Server Launcher | Fabric (fabricmc.net)](https://fabricmc.net/use/server/)
``` bash
java -Xmx3G -jar fabric-server-mc.1.20.1-loader.0.16.5-launcher.1.0.1.jar nogui
```
## 官方
[Minecraft Server Download | Minecraft](https://www.minecraft.net/en-us/download/server)
``` bash
java -Xmx2G -Xms1024M -jar server.jar nogui
```
## Forge
[Downloads for Minecraft Forge for Minecraft 1.20.6](https://files.minecraftforge.net/net/minecraftforge/forge/)
``` bash
java -jar forge-x.xx.x-installer.jar --installServer
```
