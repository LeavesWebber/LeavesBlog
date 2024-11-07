---
tags:
  - 运维
  - linux
categories:
  - Linux服务器运维
title: sftp&&ssh服务配置一站式指南
date: 
updated: 
sticky: 3
thumbnail: '"https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240913170311.png"'
excerpt: SSH和SFTP服务对于运维人员来说必不可少，网上的教程不是太深就是太浅，我撰写该文章，旨在为广大入门运维的朋友提供一些干货
---
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240913170311.png)

---

# 用Ubuntu配置sftp/ssh服务

参考了这两篇教程：
[SFTP服务器的搭建与使用_sftp服务器搭建-CSDN博客](https://blog.csdn.net/qq_35623011/article/details/85003109)
[Ubuntu 配置 SFTP 服务器_ubuntu sftp-CSDN博客](https://blog.csdn.net/qq_44846324/article/details/122029609)
其中

+ 涉及一些权限修改内容
+ 教程1有java的代码实现

==root用户（不在意权限分发）可以直接用下面的步骤快速使用==

---
## 1.安装sftp服务

```bash
sudo apt update
sudo apt install openssh-server openssh-client -y
```

  sftp是openssh里面的一个子协议

---
## 2.编辑配置文件/etc/ssh/sshd_config

如果没有UI界面，可以使用vim编辑器
这里要注意是**sshd**而不是**ssh**，前者对应的是服务端后者是客户端

### 2.1 将如下这行用`#`符号注释掉
（为什么要注释掉可以看这篇文章[【OpenSSH】internal-sftp和sftp-server之间的区别和联系什么？ - 简书 (jianshu.com)](https://www.jianshu.com/p/f24d8ca565d7)）

```config
# Subsystem      sftp    /usr/libexec/openssh/sftp-server
```

### 2.2 在文件最后面添加如下几行内容然后保存（最好放在文件末尾）

```config
Subsystem       sftp    internal-sftp   
Match Group sftp  
ChrootDirectory /sftp/%u    
ForceCommand    internal-sftp    
AllowTcpForwarding no   
X11Forwarding no  
PermitRootLogin yes
PasswordAuthentication yes
```

大模型Copilot对此的解释如下：

1. **Subsystem sftp internal-sftp**
   - 这行定义了一个 SFTP 子系统，使用 `internal-sftp` 作为 SFTP 服务器。
2. **Match Group sftp**
   - 这行表示接下来的配置只适用于属于 `sftp` 组的用户。
3. **ChrootDirectory /sftp/%u**
   - 这行将用户的根目录（chroot）设置为 `/sftp/%u`，其中 `%u` 会被替换为用户的用户名。这意味着用户只能访问他们自己的目录，增强了安全性。
4. **ForceCommand internal-sftp**
   - 这行强制用户只能使用 `internal-sftp` 命令，限制他们只能进行 SFTP 操作，不能执行其他命令。
5. **AllowTcpForwarding no**
   - 这行禁用了 TCP 转发，进一步限制了用户的操作权限，防止他们通过 SSH 隧道进行端口转发。
6. **X11Forwarding no**
   - 这行禁用了 X11 转发，防止用户通过 SSH 隧道转发 X11 图形界面
7. **PermitRootLogin yes**
   + 允许用户通过root登录。在终端里使用命令`echo "PermitRootLogin yes" >> /etc/ssh/sshd_config`能达到同样效果(需要service ssh restart)

如遇到只读文件不可编辑的情况，可使用以下命令赋权

```bash
sudo chmod a+w 文件名
```

---
## 3.修改ssh所用端口号（可选）
由于ipv4地址稀缺之类的原因，大概率vps提供商或者你自己用了*NAT技术*，那么也许sftp的默认22端口就无法使用
这时候你需要修改sftp的默认端口号为目前可用的端口（比如我的vps提供商给我开了十个端口，你自己的NAS也可以在你家路由器里添加端口映射）
在sshd_config文件里，将

```config
# port 22
```

改为

```config
port <可用的端口，不含括号>
```

完成后别忘了保存
改完之后，貌似ssh远控的端口也会随之修改了

---

## 4. 重启sshd服务

```bash
service ssh restart
```

这边可能遇到如下图一样的报错
`Failed to restart sshd.service: Unit sshd.service not found.`
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240913162124.png)
此时就需要进一步排查了，

1. 先测试能不能ping通主机

2. 检查sshd的安装情况
   
   ```bash
   ps -e | grep ssh
   ```
   
   成功安装会如下图所示
   ![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240913162329.png)

3. 测试端口是否开启（ssh服务默认用22端口）
   
   ```bash
   ss -ntl
   ```

> `ss`类似于`netstat`命令，直接使用貌似会列出所有进程端口。
> `-n` 选项表示以数字形式显示地址和端口，而不是尝试将其解析为主机名和服务名。
> `-t` 选项表示仅显示 TCP 套接字。
> `-l` 选项表示仅显示监听套接字。

也许你的终端会提示`bash: ss: command not found`，ss命令依赖于iproute2，那么我们就先安装即可，命令如下
``` bash
apt install -y iproute2
```

完成后再使用刚才的命令。我这里就是只显示了表头，下面并没有任何信息（尤其是与sshd有关端口的）
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240913162757.png)
看来是sshd服务并未启动，那就使其重启，命令如下

```bash
systemctl enable ssh.service
```

> 查了一下资料，systemd是Linux的一种服务管理器，这让我想起了Windows里也有类似的GUI工具

命令进行后，竟然提示我`permission denied`，吓得我赶紧用`sudo -i`提权了一下，再次用一遍命令即可，此时`service sshd restart`已经可用。
再用一遍进程显示的命令，可以看到22端口已经乖乖运行
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240913163715.png)

---

## 5.验证服务

```bash
sftp -P 11165 root@127.0.0.1 
```

中间的*11165*是前面设置的可用的端口号
服务正常的话，日志应该如下

```bash
root@hbcm-7k62-nat1-202409041216467fca88:~# sftp -P 11165 mysftp@127.0.0.1
The authenticity of host '[127.0.0.1]:11165 ([127.0.0.1]:11165)' can't be established.
ECDSA key fingerprint is SHA256:F5M7HVRlp/0SmsEC0J6ivw/RmRHDBEw.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[127.0.0.1]:11165' (ECDSA) to the list of known hosts.
mysftp@127.0.0.1's password: 
```

会要求你输密码，输入后就能进入sftp命令层了
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240913165020.png)

如果登录失败，可能是遭遇了一个权限问题，在上文提到的sshd.config的设置项里，有一个参数`PermitRootLogin`限定root用户通过ssh的登录方式，如禁止登陆、禁止密码登录、仅允许密钥登陆和开放登陆。需要设置成yes获取所有权限：

```config
PermitRootLogin yes
```

更多细节可以参考这篇文章：
[sshd_config 中 PermitRootLogin 的探讨-CSDN博客](https://blog.csdn.net/huigher/article/details/52972013)
不过我这里默认的是Fobidden开头的，文章里并未提到，但是有了这个思路以后自己搜一下也很方便了。

## 6.windows为例使用sftp

为了让事情变得更简单，还要批量传文件，我选择用一个sftp客户端，例如==WinSCP==，会要求输入主机（即为公网ip）和端口号（默认为22，你需要修改为前面你设置的），用户名和密码就是Linux的登入账户信息

我听说过还可以把sftp挂载到资源管理器(Exploer)里使用，这就变成了一个文件夹一样交互。但是看来看去，因为Windows本身没有sftp的内部支持，还要做协议接口转换，太复杂。实在想搞的话我贴个教程在这
[[小技巧]在Windows下使用sshfs-win挂载sftp磁盘到本地，便捷管理Linux中的文件 - 个人文章 - SegmentFault 思否](https://segmentfault.com/a/1190000023726408)

## 其他实现文件传输的方式
==WinSCP==其实支持多种文件传输协议，各种协议的区别可见这里
[[SFTP,SMB,FTP,SCP选哪种？]]