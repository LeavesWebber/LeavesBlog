---
categories:
  - 我的世界
title: 【最新保姆级教程】我的世界怎么加mod/光影/材质？一文搞懂，一步到位
tags:
  - Minecraft
  - 视频配文
date: 
updated: 
sticky: 10
excerpt: 截止目前，该教程已于Bilibili获得超70万播放。MC是一个高度自定义的游戏，有着世界上最活跃的玩家社区。但也由于高度自定义，对一些只想玩游戏而不关注底层实现的电脑小白不太友好，该偏教程深入浅出，对windows/macos用户均受用
thumbnail: "https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/2024-08-25_15.42.00.png"
cover: "https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/2024-08-25_15.42.00.png"
---
# 【最新保姆级教程】我的世界怎么加mod/光影/材质？一文搞懂，一步到位
> 本文属于小白保姆级教程，写作风格力求细致，如您觉得冗长还请见谅

> 本文对macos用户也同样适用

不装mods和光影的MC就像没装修过的房子，没法把游戏体验拉满。
想在Minecraft里使用mods，材质光影的方式有很多种，本文采用**Fabric+iris**的方式。暂时不懂没关系，整个过程并不难，跟着我一步步操作叭！

# 1.前置工作：安装Fabric
## 1.1 为什么我需要Fabric?
+ 把MC游戏本体看作一个人，各种**mods**看作各种小物件。人本身是带不了多少物件的，她需要一个**背包**（或者理解为容器），来把各种物件装起来，这样才可以带着走(run the game)。Fabric就相当于这样一个容器。
+ 类似于这样的容器还有Forge，选择哪种全凭个人喜好。我在两者之间选择了Fabric，因为对于新版MC，Fabric支持的mods更多，个人也更喜欢他的安装方式
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723133028.png)

就拿“农夫乐事”这款mod举例，能看到它仅支持Fabric

## 1.2 从浏览器下载Fabric并安装
官网网址如下：
[Fabric | The home of the Fabric mod development toolchain. (fabricmc.net)](https://fabricmc.net/)
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723131941.png)
+ 进入后直接点这个最蓝的按钮下载就行了
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723132130.png)
+ 下载完成后双击打开，顶部菜单选择客户端（服务端是用于安装服务器的Fabric核心，这在想自己搭建MC mod服务器时会用到，本文先不探讨）
+ 游戏版本与你启动器里看到的想玩的MC版本对应就行，我这里是目前的最新版1.21
+ 加载器版本选最新的即可
+ 安装位置默认在C盘的`C:\Users\你的用户名\AppData\Roaming\.minecraft`里，这是游戏的根目录。强烈建议您将这个路径添加到资源管理器的快捷访问栏里，以后会很常用。
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723133645.png)
如果您是macos用户，实在找不到上文提到的游戏根目录，请打开您的mc启动器，如下图
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723135322.png)
单击打开，它也会助您索引到游戏根目录
安装完成后，它或许会提示您去安装Fabric api。
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723165546.png)
这里先不用管,点确定就行。打开上文提到的游戏根目录文件夹，你会发现相比之前，这里多了一个`mods`文件夹，如图所示。请记住它，以后你下载的mods会全部放在这里面
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723134452.png)
出现mods文件夹说明您的Fabric已经安装成功了

# 2. 安装mods
## 2.1 安装前置mod:Fabric api
Fabric api是很多mods的**前置模组**，前置模组本身不具备游戏玩法上的功能，但没有它大多数其他mods运行不了
官方网址：
[Fabric API - Minecraft Mods - CurseForge](https://www.curseforge.com/minecraft/mc-mods/fabric-api)
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723140259.png)
单击"View all"
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723140446.png)
按照上图所示下载即可
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723140634.png)
下载完成后把下载的东西复制进**mods文件夹**，如果您不知道mods文件夹在哪，请仔细阅读上面找游戏根目录的部分。到这里，所有的前置工作已经完成

## 2.2 我该如何发现好玩的mods？
+ 你可以在B站搜索“mc模组推荐”，会有很多视频展示一些好玩的mods
+ 部分B站和抖音的up主会不定期推荐有趣的mods，比如抖音的“奈奈KAna”
+ 图省事你可以去自行搜索下载别人的整合包（我个人不太推荐这样，因为你无法知道别人都在里面塞了什么，版本兼容也是个问题。）
文章结尾我也会附上我推荐的一些mods和材质、光影
## 2.3 安装你想玩的mods
> 相信您已经在心里有若干个想玩的模组了。下面我将通过一个具体的mod举例，告诉您如何安装

我想玩的mod叫做carry on（物品搬运），这个模组能让你把方块，生物甚至玩家给抱着走，就像下图这样（妈妈再也不用担心我农场里没有牛牛了）
![2023-09-03_23.42.27.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/2023-09-03_23.42.27.png)
在哪里找到这个mod呢？我推荐几个MC资源下载网站，你想要的mods在里面几乎都可以搜到，且免费，不需要登录就能下载
1. [Minecraft Mods & Modpacks - CurseForge](https://www.curseforge.com/minecraft)
2. [Search mods - Modrinth](https://modrinth.com/mods)
3. [MC百科|最大的Minecraft中文MOD百科 (mcmod.cn)](https://www.mcmod.cn/)
我们现在直接在CurseForge（上文提到的第一个网址）里搜索“carry on”（如果一个搜不到，三个网站都试试？）
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723143729.png)
能看到第一个就是。不要点右边的两个按钮，而是直接点这个选项卡，进入详情页
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723143832.png)
点这个View all
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723143948.png)

筛选器（Filter）里选一下游戏版本，后面的平台选择Fabric。Uploaded表示上传时间，直接选择最新的（即第一个）![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723144308.png)
点Download即可进入下载页面
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723144159.png)

出现这个页面就是已经开始自动下载了，这个位置点保留![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723144502.png)
老样子，复制下载好的.jar文件
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723144723.png)
粘贴进之前提到的mods文件夹即可
你也许会好奇自己的mod到底有没有装成功，其实在刚才的下载页面有一个描述详情，如图
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723145051.png)
大部分作者会贴心地告诉你mod该怎么用（比如这里人家就很详细的指明你应当使用shift+鼠标右键）。即使你英文不太好也能大概猜出来吧？

# 3.安装光影(shaders)
和mods一样，光影也需要一个“容器”去装载它。
你会看到很多教程让你去下载`Optifine`。
这个光影加载器的历史悠久，技术相对成熟，但也正因为年龄大了，越来越跑不动，兼容性问题频发。我强烈推荐大家选择`Iris`作为光影加载器，Iris采用最新算法，优化更好，和Fabric也完美兼容。下面我们来安装它
## 3.1 官网下载Iris并安装
下载地址：
[Iris Shaders - Minecraft Mod (modrinth.com)](https://modrinth.com/mod/iris)
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723151456.png)
打开网址，点击**See all**
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723151620.png)
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723151653.png)
老样子，点下载，下载好以后选择保留
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723151829.png)

然后把下载好的.jar文件粘贴进mods文件夹，这个操作类似于安装mods
此时此刻你可以留意一下你的游戏根目录，应该长得和我差不多，如图，并没有光影文件夹
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723150911.png)
所以关键的一步来了
请先打开您的MC 启动器（我这里用了官方启动器，PCL和HCML之类的第三方启动器如出一辙）
这里注意，请勾选启动如图所示的Fabric loader方式，然后点开始游戏看看能不能游玩
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723151201.png)

启动后你会发现竟然报错了。原来是缺少一个名为Sodium的前置模组，而且明确告诉你了该用0.5.11版本。
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723152013.png)
既然如此，直接去上文提到的资源网站里下载这个模组就行了。
这个Sodium在[CurseForge](https://www.curseforge.com/minecraft)里能找到，选一下游戏版本和Fabric，刚好有我们要找的0.5.11版本。下载以后装进mods文件夹里即可
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723152217.png)
以后你自己安装mods时候也可能遇到这样的报错，相信有了这个经验，你应该知道如何解决这种错误了吧。
另外说一句，很多mods开发者喜欢用化学元素去命名一些前置模组，比如这个Sodium就是原子序数为11的钠元素。下次看到这样的模组，您应该能猜到它的功能是前置模组
装好Sodium以后，游戏已经能正常启动了
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723153239.png)
左下角会出现Fabric字样，表明你在玩mod版本。我们先按耐住想玩游戏的心情，点退出游戏
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723153350.png)
来到游戏的根目录文件夹，你会发现相比之前，除了mods文件夹，还多了一个shaderpacks文件夹，请记住它，以后你的光影文件应该放在这里面

## 3.2 我该如何找到并选择适合我的光影
### 3.2.1 找到光影
之前推荐的MC资源下载网站可以下到光影，除此之外我再推荐几个光影下载站
1. [Minecraft Shaders & Best Shader Packs - Free Download (texture-packs.com)](https://texture-packs.com/minecraft-shaders/)
2. [我的世界光影大全下载_我的世界光影材质包大全 - 我的世界中文站 (minecraftzw.com)](https://www.minecraftzw.com/tag/shader)

### 3.2.1 选择光影
你也许会羡慕很多网上视频里出现的逼真细腻的mc光效，有的写实程度甚至可以让人误以为是现实世界。mc的画质上限是没有止境的，光影是算力密集型任务，部分MC光影对显卡性能的要求不亚于满画质3A大作。所以你应当先了解自己电脑是什么性能
1. 对于windows
   首先确认您的显卡型号。如果是rtx10系或者20系或者没有独立显卡，您只能选择部分中低配光影，否则游戏会变得很卡（帧率低），这种情况下游戏体验反而差
   如果是rtx3060以上级别的显卡，您可以试着选择中高配的光影测试体验
2. 对于mac
   1.1w元以下的Macbook建议选择低配光影。台式机另当别论

## 3.3 安装光影
我在Youtube上找到了个名为*Complementary Shaders*的光影
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723161735.png)

下面我将演示怎么安装它。
这款光影在[Modrinth](https://modrinth.com/mods)上能搜到，老样子选择Iris，你游戏的对应版本，然后下载第一个就行
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723161801.png)
光影通常都是以压缩包的形式下载给你的，你不必解压，直接复制进上面提到的shaderpacks文件夹就行
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723161959.png)
复制好以后启动游戏
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723162343.png)
随便开个世界，按ESC键后点击**选项-视频设置-光影包**
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723162451.png)

![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723162515.png)
如图所示列出的就是我们刚才装的光影了，选择后点击应用即可
![2024-07-23_17.00.45.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/2024-07-23_17.00.45.png)
![2024-07-23_17.00.45.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/2024-07-23_17.01.13.png)
成功。对比一下可以看到差别还是很大的

# 4.安装材质
在此之前，有必要再次介绍一下游戏根目录的一些事情
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723171047.png)

如图所示，不难看出我们即将下载的材质包应该放进resourcepacks文件夹里
找到材质、下载材质的步骤和之前光影，模组差不多，这里不再赘述
但是安装的过程有点差别。我们先把下载好的材质放进resourcepacks文件夹
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723173623.png)
启动游戏，点选项-资源包
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723173558.png)
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240723173820.png)
只保留图中红框内的两个，其他的（即为你下载的材质）全移到右边
> 这里有个细节。就是资源包的顺序是有说法的。例如图中我将`FreshAnimations`资源包放在了最上面，才得以生效。如果我把它放在列表最下面，则你会发现游戏里材质并没生效。具体该怎么排序，你可以自己多试试确保每个资源包都生效，也可以看官方的描述文档。

# 5.mods、光影、材质推荐
## 5.1 mods推荐
我这里只推荐一些优化你原版游戏体验的mods。这些mods不会让你感觉自己太过“作弊”，大多都是在细节上对原版生存体验进行优化

|          模组名称           |                                                                   模组概述                                                                    |    推荐指数    |
| :---------------------: | :---------------------------------------------------------------------------------------------------------------------------------------: | :--------: |
|         modmenu         |                          这是必备的模组。它会在游戏启动界面给你提供一个管理mods的界面，由此你才可以通过它对很多mods进行设置。这在你mods多起来以后，或者你想高度定制你的游戏体验时尤为有用                           | 🌟🌟🌟🌟🌟 |
|        Essential        |                                              极大方便你和你朋友联机游玩。有了这个，你就可以像王者荣耀那样搜id加好友，然后邀请朋友进房间玩                                              | 🌟🌟🌟🌟🌟 |
|  InventoryProfilesNext  |                                    是个必备的模组。相信你一定因为整理mc背包物品栏而头痛过，这个模组可以一键整理背包，此外，当你快捷键里的物品用光后，会自动从你背包补充                                    | 🌟🌟🌟🌟🌟 |
| Just Enough Items (JEI) |                                      你也许想起某样东西但是忘记了怎么合成它，或是获得了某个东西但是不知道它能用来合成什么。JEI能方便你查询每个MC物品的来龙去脉                                      | 🌟🌟🌟🌟🌟 |
|     Xaeros_Minimap      | 你的界面中会多一个小地图。这个小地图支持高度自定义。此外，还提供了标记传送，你可以快捷的在各个地点之间穿梭（妈妈再也不用担心我找不到回家的路）。当你联机游玩时，有时你会找不到你好友的位置。有了这个，你可以很快的找到人。但是由于这个会极大改变你游戏的节奏（有点作弊）所以慎用吧 |  🌟🌟🌟🌟  |
|   notenoughanimations   |                                                               更真实的交互动画，战斗特效                                                               |  🌟🌟🌟🌟  |
|       FallingTree       |                                                    当你砍了最底下的一颗木头时，整棵树都会掉落。再也不用因为处理树叶烦恼了                                                    |  🌟🌟🌟🌟  |
|    auto_third_person    |                                                      你在骑马，划船，鞘翅飞行之类的活动时会自动帮你切换为第三人称                                                       |  🌟🌟🌟🌟  |
|         carryon         |                                                能把方块或者生物甚至玩家抱起来，运来运去。这在你想移动箱子但又不改变其中物品时尤为有用                                                | 🌟🌟🌟🌟🌟 |
|       continuity        |                                                         方块与方块间有了交错纹理过渡，无缝玻璃也与此有关                                                          | 🌟🌟🌟🌟🌟 |
|    eating-animation     |                                                         你在进食的时候食物会逐渐被吃掉，而不像原版瞬间消失                                                         |  🌟🌟🌟🌟  |
|        visuality        |                                                                 更多可视化交互动画                                                                 |  🌟🌟🌟🌟  |
|     farmers-delight     |                                                    前阵子火遍短视频平台的“农夫乐事”模组。添加了一套烹饪系统，可玩性很高                                                    |  🌟🌟🌟🌟  |
|         WI-Zoom         |                                                       能一键缩放画面，这个动画效果很真实，有“定睛一看”的感觉                                                        |  🌟🌟🌟🌟  |

## 5.2 材质推荐
1. Stay_True
   是一个原版风格的材质，但做了很多很棒的优化。如果你不喜欢自己的世界看起来和原版相差太大，可以试试这个
2. FreshAnimations
   强烈推荐。这个其实并不是材质，而是一种资源包，可以和上面的Stay_True一起使用。有了这个，你世界里所有生物都会有表情和神态，就像mc动漫里的村民那样生动

## 5.3 光影推荐
1. SEUS-Renewed-v1.0.1
2. SEUS-v11.0
3. Chocapic13_V9
4. Sildur's+Vibrant+Shaders+v1.51+Lite（低配机适用）
不知道选什么就用SEUS吧，已经多次迭代优化过，体积云，水流什么的该有的都有，新的Renewed版也独具特色

# 6.mods是否影响联机游玩？
最后，部分小伙伴还会疑惑：
> 我装载了mods、材质、光影，我朋友没装，这还能联机玩吗？或者我还能加入别人的服务器吗？

答案是，与**世界交互行为**有关的模组，联机游玩时不会生效。比如添加了新方块，新物品的模组，再比如一键砍树这种有交互行为的模组；
而背包整理、小地图这样的更多运行在你本机上，不与游戏世界有交互的模组，通常都可以正常使用。

有时候这个问题还与你联机时候获取的**权限**有关。比如与传送有关的模组，大多都是调用了Minecraft的tp指令。如果服务器的房主给你了tp指令的权限，那你这个模组的使用也自然不会受到影响了