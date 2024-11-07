---
categories:
  - Linux服务器运维
---
# snort安装配置与基础环境搭建
## 1.从官网下载snort并且解压
### 下载
我们先进入`/usr/src`，东西就要下在这
``` bash
root@C20241002102521:~# cd /usr/src
```
下载软件包
``` bash
sudo wget https://api.github.com/repos/snort3/snort3/tarball/3.3.7.0
```
这个下载地址竟然时不时发生变化，如果你下载的时候出现404或者找不到包，那就手动去官网找一下正确的下载地址。官网链接：
[Snort Rules and IDS Software Download](https://www.snort.org/downloads)

### 解压
下载好以后可能会有一个以版本号为名的压缩文件（我这里是`3.3.7.0`）我们解压即可
``` bash
sudo tar -xvzf 3.3.7.0
```
完成后进入文件夹，看看里面有啥
``` bash
root@C20241002102521:/usr/src# ls
3.3.7.0                           linux-headers-5.15.0-30
linux-headers-5.15.0-122          linux-headers-5.15.0-30-generic
linux-headers-5.15.0-122-generic  snort3-snort3-4ea371b
root@C20241002102521:/usr/src# cd snort3-snort3-4ea371b/
root@C20241002102521:/usr/src/snort3-snort3-4ea371b# ls
CMakeLists.txt  LICENSE    cmake_uninstall.cmake.in  crusty.cfg  lua          tools
COPYING         README.md  config.cmake.h.in         daqs        snort.pc.in
ChangeLog.md    cmake      configure_cmake.sh        doc         src
```
中间这个`configure_cmake.sh`是我们要用的，但是在此之前先安装各种依赖

## 2.安装依赖环境
我不知道为什么这个软件的依赖关系如此复杂，我找了很久，中间报错好几次，才把东西找全。正因如此我才觉得写这篇教程还挺必要的。下面列出所有需要装的玩意，**按顺序执行**
``` bash
sudo add-apt-repository ppa:george-edison55/cmake-3.x
sudo apt update
sudo apt install cmake
sudo apt install libdaq-dev
sudo apt install libhwloc-dev
sudo apt install luajit
sudo apt install libluajit-5.1-dev
sudo apt install openssl
sudo apt install libssl-dev
sudo apt install liblzma-dev libdaq-dev libhs-dev libsafec-dev libunwind-dev uuid-dev
sudo apt install liblzma-dev libunwind-dev
sudo apt install libdaq-dev
```
发现libdaq这玩意不知道为啥总出错，导致make不了，还得手动配置一下
``` bash
cd /usr/src
sudo git clone https://github.com/snort3/libdaq.git
cd libdaq/
sudo ./bootstrap 
sudo ./configure 
```
跟着做就行了，到这里libdaq已经弄好，下面开始make
``` bash
sudo make
sudo make install
```
这个过程要花超久的时间
``` bash
cd /usr/src/snort3-snort3-4ea371b
sudo ./configure_cmake.sh
cd build
sudo make
```
又是漫长的等待
``` bash
sudo groupadd snort
sudo useradd -r -s /bin/false -g snort snort
sudo mkdir /etc/snort
```
新建一个它的配置规则，
``` bash
sudo vim /etc/snort/snort.conf
```
我们需要用这个规则来启动snort
在其中输入几个基本配置内容用于测试
``` bash
# Snort 3 configuration file
var HOME_NET any
var EXTERNAL_NET any
include $HOME_NET
```
完成后记得保存
``` bash
apt install snort
```
搞了半天snort命令都用不了，不知道为啥，所以我直接apt install

## 3.测试使用
完成后直接用刚才的配置文件启动snort
``` bash
sudo snort -c /etc/snort/snort.conf -T
```
此时发现snort已经跑起来了，不停在输出日志。过段时间我`Ctrl`+`C`手动停止，可以看到它输出的日志如下
``` bash
===============================================================================
Run time for packet processing was 95.14345 seconds
Snort processed 4572 packets.
Snort ran for 0 days 0 hours 1 minutes 35 seconds
   Pkts/min:         4572
   Pkts/sec:           48
===============================================================================
Memory usage summary:
  Total non-mmapped bytes (arena):       51826688
  Bytes in mapped regions (hblkhd):      22392832
  Total allocated space (uordblks):      45431104
  Total free space (fordblks):           6395584
  Topmost releasable block (keepcost):   134784
===============================================================================
Packet I/O Totals:
   Received:         4613
   Analyzed:         4572 ( 99.111%)
    Dropped:            0 (  0.000%)
   Filtered:            0 (  0.000%)
Outstanding:           41 (  0.889%)
   Injected:            0
===============================================================================
Breakdown by protocol (includes rebuilt packets):
        Eth:         4587 (100.000%)
       VLAN:            0 (  0.000%)
        IP4:         1420 ( 30.957%)
       Frag:            0 (  0.000%)
       ICMP:            3 (  0.065%)
        UDP:            7 (  0.153%)
        TCP:         1385 ( 30.194%)
        IP6:         3163 ( 68.956%)
    IP6 Ext:         3275 ( 71.397%)
   IP6 Opts:          112 (  2.442%)
      Frag6:            0 (  0.000%)
      ICMP6:          199 (  4.338%)
       UDP6:         2964 ( 64.617%)
       TCP6:            0 (  0.000%)
     Teredo:            0 (  0.000%)
    ICMP-IP:            0 (  0.000%)
    IP4/IP4:            0 (  0.000%)
    IP4/IP6:            0 (  0.000%)
    IP6/IP4:            0 (  0.000%)
    IP6/IP6:            0 (  0.000%)
        GRE:            0 (  0.000%)
    GRE Eth:            0 (  0.000%)
   GRE VLAN:            0 (  0.000%)
    GRE IP4:            0 (  0.000%)
    GRE IP6:            0 (  0.000%)
GRE IP6 Ext:            0 (  0.000%)
   GRE PPTP:            0 (  0.000%)
    GRE ARP:            0 (  0.000%)
    GRE IPX:            0 (  0.000%)
   GRE Loop:            0 (  0.000%)
       MPLS:            0 (  0.000%)
        ARP:            4 (  0.087%)
        IPX:            0 (  0.000%)
   Eth Loop:            0 (  0.000%)
   Eth Disc:            0 (  0.000%)
   IP4 Disc:           25 (  0.545%)
   IP6 Disc:            0 (  0.000%)
   TCP Disc:            0 (  0.000%)
   UDP Disc:            0 (  0.000%)
  ICMP Disc:            0 (  0.000%)
All Discard:           25 (  0.545%)
      Other:            0 (  0.000%)
Bad Chk Sum:          321 (  6.998%)
    Bad TTL:            0 (  0.000%)
     S5 G 1:            0 (  0.000%)
     S5 G 2:           15 (  0.327%)
      Total:         4587
===============================================================================
Action Stats:
     Alerts:           50 (  1.090%)
     Logged:           50 (  1.090%)
     Passed:            0 (  0.000%)
Limits:
      Match:            0
      Queue:            0
        Log:            0
      Event:            0
      Alert:            0
Verdicts:
      Allow:         4572 ( 99.111%)
      Block:            0 (  0.000%)
    Replace:            0 (  0.000%)
  Whitelist:            0 (  0.000%)
  Blacklist:            0 (  0.000%)
     Ignore:            0 (  0.000%)
      Retry:            0 (  0.000%)
===============================================================================
Frag3 statistics:
        Total Fragments: 0
      Frags Reassembled: 0
               Discards: 0
          Memory Faults: 0
               Timeouts: 0
               Overlaps: 0
              Anomalies: 0
                 Alerts: 0
                  Drops: 0
     FragTrackers Added: 0
    FragTrackers Dumped: 0
FragTrackers Auto Freed: 0
    Frag Nodes Inserted: 0
     Frag Nodes Deleted: 0
===============================================================================
===============================================================================
Stream statistics:
            Total sessions: 806
              TCP sessions: 376
              UDP sessions: 430
             ICMP sessions: 0
               IP sessions: 0
                TCP Prunes: 0
                UDP Prunes: 0
               ICMP Prunes: 0
                 IP Prunes: 0
TCP StreamTrackers Created: 384
TCP StreamTrackers Deleted: 384
              TCP Timeouts: 0
              TCP Overlaps: 0
       TCP Segments Queued: 120
     TCP Segments Released: 120
       TCP Rebuilt Packets: 41
         TCP Segments Used: 100
              TCP Discards: 3
                  TCP Gaps: 9
      UDP Sessions Created: 430
      UDP Sessions Deleted: 430
              UDP Timeouts: 0
              UDP Discards: 0
                    Events: 19
           Internal Events: 0
           TCP Port Filter
                  Filtered: 0
                 Inspected: 0
                   Tracked: 1052
           UDP Port Filter
                  Filtered: 0
                 Inspected: 0
                   Tracked: 430
===============================================================================
===============================================================================
SMTP Preprocessor Statistics
  Total sessions                                    : 0
  Max concurrent sessions                           : 0
===============================================================================
dcerpc2 Preprocessor Statistics
  Total sessions: 0
===============================================================================
===============================================================================
SIP Preprocessor Statistics
  Total sessions: 0
===============================================================================
IMAP Preprocessor Statistics
  Total sessions                                    : 0
  Max concurrent sessions                           : 0
===============================================================================
POP Preprocessor Statistics
  Total sessions                                    : 0
  Max concurrent sessions                           : 0
===============================================================================
Snort exiting
```
把报告发给AI，让他巴拉巴拉的帮我分析了一下，结果如下：
1. **数据包处理**：
    
    - 处理时间：95.14345秒
    - 处理的数据包总数：4572个
    - 数据包速率：每分钟4572个，每秒约48个
    - 数据包分析率：99.111%
2. **内存使用**：
    
    - 总非映射字节：51826688字节
    - 映射区域字节：22392832字节
    - 总分配空间：45431104字节
    - 总空闲空间：6395584字节
3. **数据包I/O总数**：
    
    - 接收：4613个
    - 分析：4572个（99.111%）
    - 丢弃：0个（0.000%）
    - 过滤：0个（0.000%）
    - 未处理：41个（0.889%）
4. **协议分布**：
    
    - 以太网（Eth）：4587个（100.000%）
    - IPv4：1420个（30.957%）
    - IPv6：3163个（68.956%）
    - ICMPv6：199个（4.338%）
    - UDPv6：2964个（64.617%）
5. **动作统计**：
    
    - 警报：50个（1.090%）
    - 记录：50个（1.090%）
    - 允许：4572个（99.111%）
    - 阻止：0个（0.000%）
6. **流统计**：
    
    - 总会话数：806
    - TCP会话：376
    - UDP会话：430
7. **预处理器统计**：
    
    - SMTP、DCERPC2、SIP、IMAP和POP预处理器的会话数都是0，表明这些服务在日志记录期间没有检测到任何会话