---
categories:
  - 我的世界
title: Forge+Optifine玩模组/材质/光影
tags:
  - Minecraft
  - 视频配文
date: 
updated:
---
前几期视频之后啊，有很多小伙伴入坑了国际版的MC。最近有很多小伙伴和我反应说很多热门模组，比如说天堂和暮色森林，都是只支持低版本`Forge`，但是却又苦于不会安装Forge，那难道我们只能去用pcl2之类的第三方启动器了吗？那么up可以很负责任的告诉大家，用官方启动器完全没问题啊，甚至还更方便。
话不多说，今天我就简单几步带大家玩上这些充满着童年回忆的热门模组吧，通过这篇文章，你能实现：
> 1.Forge+Optifine方式实现游玩几乎所有热门模组，并搭载光影
> 2.和之前玩的版本不冲突，玩老版不用卸载新版，可以一起玩
> 3.整个过程都使用官方启动器

# 1.下载Forge
官方网址：
[Downloads for Minecraft Forge for Minecraft 1.20.6](https://files.minecraftforge.net/net/minecraftforge/forge/)
进入后注意选择正确版本，在“Download Recommended”栏目里点击Installer下载

# 2.安装Forge
在forge-installer所处的文件夹里使用如下命令启动安装：
``` java
java -jar 文件名
```
窗口弹出后，直接无脑下一步安装即可，完成后打开启动器，已经能看到Forge的启动选项了

# 3.做版本隔离（如果你没玩过其他版本MC，可以不做）
为了防止新老版本冲突，得做一下版本隔离。步骤可见我的这个教程：
https://www.bilibili.com/video/BV1GqY4euEij/
本期视频也有带着做

# 4.下载Optifine以安装光影
官方网址：
[OptiFine Downloads](https://optifine.net/downloads)
选择对应版本下载即可，下载完成后，把名字类似于`OptiFine_1.7.10_HD_U_E7.jar`的文件放进==对应版本的==mods文件夹，然后启动一遍游戏，即可生成`shaderpacks`文件夹，以后光影都放在这里面即可

# 5.安装暮色森林，天堂等热门模组
这些模组都可以在Curseforge搜到，Curseforge网址如下：
[Minecraft Mods & Modpacks - CurseForge](https://www.curseforge.com/minecraft)
下载时注意选择对应版本，下完以后放进mods文件夹即可（如果你之前玩过其他版本MC，注意放进版本隔离后的versions文件夹的对应版本游戏目录的mods里)，然后开启游戏。过程中你们可能遇到两种报错
第一种：
![Minecraft 1.7.10 08-14-2024 12：14 .png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/Minecraft%201.7.10%2008-14-2024%2012%EF%BC%9A14%20.png)
这是因为你们缺少一个前置mod，名为`gilded-games-util`。去CurseForge下载它并装上即可。
第二种：
![Minecraft 1.7.10 08-14-2024 12：31 .png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/Minecraft%201.7.10%2008-14-2024%2012%EF%BC%9A31%20.png)
玩游戏过程中出现花屏。这个你们启用电脑显卡的独显直连功能即可（自行bing搜），还是不行就更新显卡驱动