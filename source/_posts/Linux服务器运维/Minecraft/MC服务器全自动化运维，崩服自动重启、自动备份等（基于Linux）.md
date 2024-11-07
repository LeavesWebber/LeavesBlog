![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240925224107.png)
> 本篇教程由浅入深，基于Linux实现Java版MC服务器的各种自动化任务。Linux是绝大多数服务器的操作系统，无论你是用电商平台很火的有图形化界面的**面板服**，还是租的只带一个Linux os的**VPS**，亦或者是基于Linux内核的**个人NAS**以及**旧电脑**都适用

> 本文属于小白保姆级教程，写作风格力求细致，如您觉得冗长还请见谅

> 文章代码中出现的所有路径，都请根据你的实际情况，换成对应的路径，我下面将不再提醒

> 教程&&代码作者：Bilibili up ©️三葉Leaves
# 开篇--需求分析&&前置环境
## 需求分析
### 情形1：**崩服重开**
 我的MC服务器会因为各种原因崩溃。最常见的就是一些玩家行为导致tick值越过设定的预警（这个值在服务器的`server.properties`文件里可以设置），然后watchdog自动关闭了服务器。每到此时，粉丝群便炸开了锅，需要我重新开服，而我的电脑不会总是在身边。

### 情形2：**自动备份**
一些玩家的误操作或者恶意为之，摧毁了大家心爱的小镇。此时需要回档，然而每天备份十几个G的存档是件麻烦事

### 情形3：**自动游戏公屏推送消息**
大家已经建立了聚居的小城镇的位置，亦或者是老玩家已经熟知的地狱交通位置，而刚入服的新玩家不知道，尽管自主探索找到大家是个很惊喜的事情，但是若能给每个刚入服的玩家自动公屏推送一下常用坐标和欢迎消息，也是件美事

上述三种情形都是我开服过程中遇到的问题，事实上这并不难实现。

## 前置环境
### 作者的环境：
1. Linux(**Ubuntu**) os（部署在**docker**容器内）。docker集成在群晖（synology)**NAS**的DSM os里
2. 已经部署好MC服务端并成功开服

### 关于终端命令远控
也许你用的是图形化界面的**面板服**，此时我下文说的这些命令会让你无从下手。这里我必须先说明，Linux是一个以终端命令为主的系统，大多数操作依赖于在终端(Terminal)中打命令实现
连接到终端的方式有很多，最常见的就是用**ssh**工具。你可以这样问你租的面板服客服：
**“你们的服务器ssh怎么用？请给我ssh地址和sftp地址”**
然后让他教你怎么用。最终的结果就是获得一个能打命令的界面，就像这样：
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240929110626.png)

---
# 功能1：崩服自动重开
## 1.设定系统时区
计划任务和备份文件名都需要用到时间，所以有必要先同步一下
先查看自己的时间日期对不对
``` bash
date
```
如果正确，那就可以跳过直接下一步了，否则可以参考下面的步骤
使用如下命令
``` bash
tzselect
```
按照系统的提示逐一选择地区（这里假定你的时区为上海），完成后输入
``` bash
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```
再次使用`date`检查时间，理应已经自动同步完成

## 2.编写崩服自动重启脚本
### 编写脚本
在**MC服务端文件目录下**新建一个名为`startMC.sh`的脚本文件：
``` bash
vim startMC.sh
```
在里面编写命令如下（不会用vim编辑器的自行搜索）
``` bash
#!/bin/bash
#Copyright ©️LeavesWebber
while true
do
  java -Xmx7G -Xms4G -jar /root/fabric-server-launch.jar nogui
  sleep 10
done
```
给脚本赋权：
``` bash
chmod 755 startMC.sh
```
中间的开服命令**需要根据自己情况替换实际路径**，不懂该替换什么的可以看我的这篇教程[[使用Linux开模组服]]
这个`While true`循环会永不停歇的执行内部的开服指令。当一次崩服（Java -jar任务结束）后，等待十秒，又会重新执行开服指令，以此达到崩服自动重开的目的
再次新建一个名为`BootScript.sh`的脚本文件：
``` bash
vim BootScript.sh
```
在里面编写命令如下
``` bash
#!/bin/bash
#Copyright ©️LeavesWebber
screen -S mc bash -c "bash /root/startMC.sh; exec bash"
```
这段命令会新建一个名为`mc`的screen，同时在这个screen里运行刚才编写的开服脚本

---
使用screen的意义：
1. mc开服后终端将只能打mc里的命令（如gamemode，op等），而我们需要继续用Linux的命令就用不了，所以需要把它放在screen里后台运行
2. ssh终端被关闭后有时会导致mc服务进程也被关闭，用screen可以解决这个问题（也可以用nohup）
---
### 开服命令并自动开服
以后想开服时，使用如下命令启动刚才编写的脚本即可：
``` bash
bash BootScript.sh
```
也可以设置开机启动开服，先给脚本赋权
``` bash
chmod 755 BootScript.sh
```
接着，在crontab里设置一个特殊的条件任务。进入crontab
``` bash
crontab -e
```
在里面添加内容如下
``` bash
@reboot bash /root/BootScript.sh
```
这样做，以后每次Linux系统开机时就会自动开服，崩服也会自动重启了

值得一提的是，有时你会发现开机自动开服会失效，这是因为这边存在一个悖论：
> 我们使用了cron来开机自启动开服脚本，但cron服务本身开机就没有被启动，那么自然开服脚本也不会被启动了

此时可以自行搜索如何设置你的系统开机自启动cron service，或者参考其他开机启动脚本的方式，这里推荐一篇教程：[linux设置开机启动脚本的3种方法_linux开机启动脚本-CSDN博客](https://blog.csdn.net/jinking01/article/details/126878417)
部分情况，你会遇到如下的报错
``` bash
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down
```
你会发现你的系统的systemd似乎有问题，这种多半发生在你使用了Docker或者WSL时出现，因为出于各种原因，你用的是阉割版的Linux。我尝试过很多种方法，至今未解决Docker中systemd的问题，如果你知道欢迎评论区指正。此时很遗憾，这种情况下没法做到开机自动开服

### 关服命令
值得一提的是，由于开服指令不间断执行，在你真正想要关服时，常规的游戏里使用`/stop`命令是没用的，我们只能关闭screen来彻底关服
#### 当你在**MC的命令界面**时，使用快捷键可以彻底关服
``` bash
Ctrl+A,K
#先按住ctrl和A，再按下K键
```
#### 或者当你在终端界面时，
先获取已经运行的screen
``` bash
screen -ls
```
如果你使用了我刚才编写的脚本，那么你会看到一个名为mc的screen，记住前面的数字id，使用命令
``` bash
screen -X -S 刚才记下的id quit
```
同样也能关服

# 功能2：自动备份
## 先说我的备份需求：
1. 每天的早上6点备份一次，这是为了在发生意外时（比如某位玩家的家不小心炸了）能及时回档到一天前的状态
2. 每天备份的同时删除昨天的备份。这是为了节省磁盘空间，因为玩到后期存档动辄就是几十个G
3. 每两周的周一保留一次备份而不删除。这是因为每隔两周存档都已经经过了比较大的变化和发展，这样做可以保留一些关键节点的回忆
4. 扩展功能：远程备份。将存档备份到另一台机子上，这样即便本机出问题了另一台机子也有存档

## 功能实现（每天的备份与清理）：
为了解决硬编码问题，我们在Minecraft游戏目录自带的config里创建一个.conf配置文件，用于存放我们备份存档的目录
``` bash
vim config/backup.conf
```
在其中编写你希望存放存档备份文件的位置、备份日志的位置以及游戏存档目录（**根据实际情况修改里面的路径**）。这里我多设置了几个远程主机的配置，因为有可能你希望把存档备份到别的机子上（似乎这样才更合理一点）。如果你只需要备份到本机，那么可以忽视
``` conf
# 备份文件名，如（三葉的服务器存档#1.20.1-fabric）
export backupNameTemplate=""

# 本机备份位置
export backupDir=""

# 存档源文件位置
export sourceDir=""

# 日志文件位置
export logFile=""

# 远程备份位置
export DESTINATION_DIR=""

# 远程备份用户
export DESTINATION_USER=""

# 远程备份主机
export DESTINATION_HOST=""

# 远程备份的ssh端口（默认22）
export DESTINATION_PORT=""
```
给配置文件赋权
``` bash
chmod 755 backup.conf
```
接着开始编写我们的备份脚本吧！
创建backup.sh
``` bash
vim backup.sh
```
脚本内容如下
``` bash
#!/bin/bash
# Copyright ©️LeavesWebber

cd "$(dirname "$0")"

# 从备份配置文件里读取备份目录
source config/backup.conf

# 创建备份目录（如果不存在）
mkdir -p "$backupDir"

# 定义备份文件名
backupName="${backupNameTemplate}($(date '+%m-%d-%Y'))"

# 创建备份文件并检查备份是否成功
if zip -r "${backupDir}/${backupName}.zip" "${sourceDir}" &> "${logFile}"; then
    echo "备份成功: ${backupName}.zip" | tee -a "${logFile}"

    # 获取昨天的日期
    yesterday=$(date -d "yesterday" '+%m-%d-%Y' 2>/dev/null || date -v -1d '+%m-%d-%Y' 2>/dev/null)

    # 如果获取昨天的日期失败，则跳过删除操作
    if [ -z "$yesterday" ]; then
        echo "获取昨天的日期失败，跳过删除操作" | tee -a "${logFile}"
    else
        # 构建昨天的备份文件名
        oldBackupName="${backupNameTemplate}(${yesterday})"

        # 删除昨天的备份文件
        if [ -f "${backupDir}/${oldBackupName}.zip" ]; then
            rm -f "${backupDir}/${oldBackupName}.zip"
            echo -e "删除昨天的备份成功: ${oldBackupName}.zip \n" | tee -a "${logFile}"
        else
            echo -e "删除昨天的备份失败: ${oldBackupName}.zip，文件不存在 \n" | tee -a "${logFile}"
        fi
    fi
else
    echo "备份失败" | tee -a "${logFile}"
    # 如果备份失败，则不执行删除昨天备份的操作
    exit 1
fi
```
运行这个脚本时会：
1. 压缩游戏的存档为.zip并且命名为当天的日期，然后放到你刚才设置的存放位置
2. 删除昨天备份的存档
3. 无论备份成功与否，都输出日志信息到刚才你设置的日志位置

给脚本赋权
``` bash
chmod 755 backup.sh
```
将这个脚本添加入计划任务，每天早上六点执行一次即可：
进入计划任务文件
``` bash
crontab -e
```
添加如下内容
``` bash
0 6 * * * /path/to/your/backup.sh
```

## 功能实现（每两周保留一次存档）：
刚才的步骤中已经实现了每日的备份和清理已备份的存档，但是我们还需要每两周的周一保留一次备份而不删除。
>说实话，“每两周的周一”这个逻辑还真不太好编程，作者苦思冥想了几天始终没有很满意的方案，偶然之间意识到奇偶之间不是正好错位相隔吗，很吻合每两周这个逻辑！！这样编程真是十分讨巧，那么代码就来了

创建每两周备份一次的脚本
``` bash
vim longTermBackup.sh
```
脚本内容如下：
``` bash
#!/bin/bash
cd "$(dirname "$0")"
# 从备份配置文件里读取备份目录
source config/backup.conf

# 获取当前的周数
week_number=$(date +%V)

# 如果周数是偶数，则执行任务
if (( week_number % 2 == 0 )); then

  # 创建备份目录（如果不存在）
  mkdir -p "$backupDir"

  # 定义备份文件名
  backupName="三葉的服务器周期存档#1.20.1-fabric($(date '+%m-%d-%Y'))"
  
  # 创建周期备份文件并检查备份是否成功
  if zip -r "${backupDir}/${backupName}.zip" "${sourceDir}" &> "${logFile}"; then
      echo "周期性备份成功: ${backupName}.zip" | tee -a "${logFile}"
  else
      echo "周期性备份失败" | tee -a "${logFile}"
      exit 1
  fi
fi
```
接下来就只需要设置**每周一运行一次**这个脚本即可，如果脚本检测到当前不是偶数周，则不会触发备份
给脚本赋权
``` bash
chmod 755 longTermBackup.sh
```
进入计划任务文件
``` bash
crontab -e
```
添加如下内容
``` bash
0 4 * * 1 /path/to/your/longTermBackup.sh
```

到这里，已经完美实现了预期的所有备份要求

## 功能实现（远端备份）
### 配置ssh密钥对
我使用`rsync`实现远端备份的需求，因为这个技术支持增量同步，很符合MC存档大但是每天的数据变化不太大这种场景。
`rsync`使用了ssh的端口，每次使用时都需认证，因此为了实现自动化脚本，最佳实践是配置ssh的密钥对而不是使用密码进行ssh连接。
#### 1.生成SSH密钥对
这些操作都在MC的服务器上进行。我们先提权
``` bash
sudo -i
```
生成密钥对
``` bash
ssh-keygen -t rsa
```




# 功能3：欢迎消息
> “如果我看得更远，那是因为我站在巨人的肩膀上”    --艾萨克·牛顿

欢迎消息的代码大概包括以下逻辑：
抓取screen里的MC控制台消息，然后用正则表达式匹配内容，最后推送需要的欢迎消息到控制台公屏

然而一个合格的程序员不应该只是埋头苦干，还应该懂得借鉴（真不是因为我懒=v=），这种常用的功能前辈们肯定已经把项目封装好了，果然，网上找到了个名为**Welcome Message**的模组，恰好满足我的简单的欢迎消息需求，既然如此，以逸待劳

模组下载地址：[Welcome Message - Minecraft Mod (modrinth.com)](https://modrinth.com/mod/welcome-message)

使用方法也很简单，模组装载到服务端后重启游戏，然后在服务端游戏目录的config里找到welcomemessage.json5，编辑即可
``` bash
vim welcomemessage.json5
```
配置字段作者注释也写的很清楚了，这里不赘述。编辑好以后重启游戏即可