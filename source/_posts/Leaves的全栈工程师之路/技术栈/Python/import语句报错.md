---
title: 解决python“没有名称为 'xxx' 的模块”&&无法识别pip命令的import语句报错
tags:
  - python
  - 报错
categories:
  - Leaves的全栈工程师之路
  - 技术栈
  - Python
date:
updated:
---
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20241020232352.png)

---
# 解决“没有名称为 'xxx' 的模块”&&无法识别pip命令
> 我的环境：
> IDE:   PyCharm
> Python version:  3.12.1

从github上拉取的别人的项目大部分都会有这样的导入第三方软件包的语句，对于缺少的包，我们可以用pip命令安装
## 检查pip命令是否可用
右键你项目所在文件夹，选择在**终端**中打开；亦或是在 PyCharm 等IDE的底部工具栏中，点击 **Terminal** 选项卡，打开终端，输入以下命令
``` bash
pip --version
```
检查pip命令是否正常，若正常返回版本号，即可进入下一部分
若提示：
``` bash
pip : 无法将“pip”项识别为 cmdlet、函数、脚本文件或可运行程序的名称。请检查名称的拼写，如果包括路径，请确保路径正确，然后再试一次。
```
我们先在终端用这两个命令下载并更新一下pip
``` bash
python -m ensurepip --default-pip
python -m pip install --upgrade pip
```
接着，在[环境变量](关于环境变量)中的系统变量里找到path，添加两个路径
Python路径：
通常是 `C:\Users\<你的用户名>\AppData\Local\Programs\Python\PythonXX\`
以及 `Scripts` 文件夹路径（这个与**pip**有关）：
通常是 `C:\Users\<你的用户名>\AppData\Local\Programs\Python\PythonXX\Scripts\
然后**重新启动IDE和终端**

## 使用pip命令安装缺少的软件包
命令：
``` bash
pip install 软件包名
```