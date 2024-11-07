> *iptables*是一个与系统本身ip数据包出入规则有关的命令，用于配置Linux的**防火墙规则**。第一次接触这个命令感觉很像是ACL（Access Control List）那一套。
> 下面我将用一个简单的实验实践iptables，以演示其基本功能

---

# 实验：用iptables封禁ssh服务（默认使用22端口）

## 步骤

执行命令`iptables -h`（简略）或者`man iptables`（详细）可以查看帮助
这里我们在另一台**客户端主机**上，随便用一个ssh客户端工具远控服务器

**！！请确保你能本地操作或者以任何非ssh的方式进入被控服务器的终端，再执行下面的步骤，因为一旦执行此命令，ssh远控服务将失效**

连接成功后终端输入命令

```bash
iptables -t filter -A INPUT -p tcp --dport 22 -j DROP
```

其中：

+ `-t filter`可以省略，因为默认就是用筛选器
+ `-A`表示追加规则
+ `-p`表示使用协议，不指定的话默认`-p all`（tcp, udp, icmp)
+ `--dport 22`指定目标端口为22
+ `-j DROP`指定行为（丢弃）

命令执行后，ssh远控工具已经输入不了任何命令，因为连接已经丢失
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240925092057.png)
不一会，工具就报告连接失败
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240925093538.png)

我们来到服务器终端这边，输入命令，删除刚才的规则

```bash
iptables -F
```

再次在客户端这边用ssh连接服务器，已经能重连成功

## 思考

### Q？

如果把刚才的命令由

```bash
iptables -t filter -A INPUT -p tcp --dport 22 -j DROP
```

改为

```bash
iptables -t filter -A INPUT -p tcp --dport 22 -j REJECT
```

（DROP换为REJECT）那么功能上有什么区别？

### A：

`DROP`会直接丢弃数据包而不给对方任何提醒，就像
*你给女神拨打电话但无人接听，那么你的女神可能遭遇了什么问题（就像ssh服务可能出错），也可能是你的女神已经换号码了（就像ssh服务根本就没开或者部署在了别的端口）*
`REJECT`会拒绝匹配到的包并且给对方一个提醒，就像
*你给你的女神打电话，响了一会后提示“对方正在通话中”，很显然对方直接把你电话挂了*

# 常用命令

### 添加规则

上面的实验能了解到`-A`可以追加规则。事实上，`-I`和`-A`都可以用于追加规则，区别在于

- `-A`规则追加到指定链的末尾

- `-I`规则默认追加到指定链的开头，后面跟个参数还能添加到指定位置，如：
  
  ```bash
  #插入到第二行
  iptables -t filter -A INPUT 2 -p tcp --dport 22 -j DROP
  ```
  
  ### 删除规则

- 删除所有规则
  
  ```bash
  iptables -F
  ```

- 指明规则本身删除
  
  > 实际上就是把刚才的追加`-A`换成删除`-D`
  
  ```bash
  iptables -t filter -D INPUT -p tcp --dport 22 -j DROP
  ```

- 指明规则号进行删除
  
  ```bash
  iptables -t filter -D INPUT 1
  ```

### 查看已有规则

- 查看规则列表
  
  ```bash
  iptables -L
  ```

- 查看规则序列号
  
  ```bash
  iptables -L -n --line-numbers
  ```