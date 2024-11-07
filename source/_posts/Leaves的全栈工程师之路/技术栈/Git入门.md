---
title: Git快速上手
tags:
  - git
categories:
  - Leaves的全栈工程师之路
  - 技术栈
date:
updated:
---

![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20241008174400.png)

> 教程为git的学习笔记，仅作为快速上手和命令备忘

> 作者：©️LeavesWebber

> 参考教程：[安装Git - Git教程 - 廖雪峰的官方网站 (liaoxuefeng.com)](https://liaoxuefeng.com/books/git/install-git/index.html)

---

# §1 安装和初始化

## Windows11

### 下载地址

[Git - Downloads (git-scm.com)](https://git-scm.com/downloads)

### 初始化命令

```bash
$ git config --global user.name "Your Name"
$ git config --global user.email "email@example.com"
```

> 关于配置级别：
> l 系统级配置 git conifg --system  配置文件路径~/.gitconifg
> l 用户级配置 git config --global  配置文件路githome/etc/gitconfig
> l 仓库级配置 git config --local   配置文件路径gitrepo/.git/config

对于Windows11，配置文件通常存放在:
`C:\Users\你的用户名\.gitconfig`

# §2 创建版本库，本地使用

## 初始化版本库

新建一个文件夹作为项目地址，在这个文件夹里开启git bash并执行

```bash
git init
```

目录会生成一个隐藏的`.git`文件，存放了一些配置信息。从此以后，这个文件夹就像被佛祖开过光一样具备了git功能。

## 工作区，暂存区与仓库

文件夹里能看到的所有的东西都是在**工作区**，三者的关系如下：
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20241008183207.png)

### 将文件添加到暂存区

对某个文件使用

```bash
git add 文件名
```

会把文件提交到**暂存区**
使用如下命令会一次性提交所有项目文件

```bash
git add .
```

### 提交文件到版本仓库

命令：

```bash
git commit -m "这是一段提交说明"
```

这个命令把所有**暂存区**的玩意提交到版本仓库

## 版本管理

### 查看当前状态

```bash
git status
```

如果

1. 工作区的修改没被提交
2. 暂存区的玩意没被提交
   状态都会提示

### 比较文件不同

```bash
git diff 文件名
```

这会把**工作区**的文件和**仓库**内已经提交的最新版本进行对比
如果文件是**文本类文件**，会列出不同。不过反直觉的是word文件这些富文本编辑器的格式不是文本类文件，此时Markdown文档的优势又一次被提现了出来😊

### 查看日志

日志记录了提交过的修改，能看出版本号（哈希值），提交作者、日期、说明等

```bash
git log
```

只能看出版本号和提交说明的简略日志

```bash
git log --pretty=oneline
```

关闭终端后若想找回之前的日志，可以用

```bash
git reflog
```

### 版本回退

#### 回退到上一个版本：

```bash
git reset --hard HEAD^
```

`HEAD^`表示当前版本的上一个版本，`HEAD^^`则是上上个，等价于`HEAD~2`

#### 回退到指定版本

```bash
$ git reset --hard 版本号
```

版本号只需要输入前几位然后执行命令（无需tab）就行，会有自动补全。

### 撤销修改

撤销修改的命令会在使用`git status`后提醒你

#### 撤销工作区修改

如果你仅仅修改了工作区文件，使用

```bash
git checkout -- 文件名
```

这个命令会把工作区的文件恢复到版本仓库里最新的版本

#### 撤销暂存区修改

如果你不光修改了文件，还`git add`了，使用

```bash
git reset HEAD 文件名
```

这个命令会**撤销暂存区的修改**，之后你可以**再撤销工作区修改**就可以完全丢弃修改

# §3 远程仓库

## 生成ssh密钥

```bash
ssh-keygen -t rsa -C "youremail@example.com"
```

对于Windows，生成的密钥会存在`C:\Users\你的用户名\.ssh`这样的位置，里面有`id_rsa`（私钥）和`id_rsa.pub`（公钥）两个文件

## 绑定github

在github的账户设置里，能看到SSH Keys页面，在里面点击“Add SSH Key”，然后把刚才公钥的内容（公钥以文本文件打开）输进去

## 添加远程仓库

ssh方式：

```bash
git remote add origin git@github.com:你的github账户名/你的仓库名称.git
```

https方式：

```bash
git remote add origin https://github.com/你的github账户名/仓库名.git
```

`orgin`是默认的远程仓库别名，可以换成其他的
ssh和https两种方式都可以与github通信，但ssh据说速度会更快

## 推送（push）本地库内容到远程

### 首次

```bash
git push -u origin master
```

`master`是默认的主分支名称，这在github上默认是`main`，可以在github的账户设置里修改
参数`-u`会关联本地库与远程库，以此在以后的推送或者拉取时简化命令
如果要改本地仓库主分支名称，可以用如下命令

```bash
#由默认的master改为github默认的main
git branch -m master main
```

### 之后

```bash
git push origin master
```

## 查看远程仓库信息

```bash
git remote -v
```

## 本地删除远程库信息

```bash
git remote rm origin
```

## 克隆（clone）远程库到本地

通过这种方式能把自己的远程库克隆本地

```bash
git clone ssh仓库地址
```

ssh地址的格式上面已经交代过了

## 拉取（pull）远程库到本地

从远程仓库拉取数据并尝试与本地分支合并。

```bash
git pull origin master
```

这会从名为 `origin` 的远程仓库拉取 `master` 分支的更新，并尝试将这些更改合并到当前本地的 `master` 分支。

## 参与github上别人的项目

我们并不能直接克隆别人的仓库，即使这样做了之后也无权限提交修改，正确做法是：

1. 在别人的项目主页点**fork**，以此把东西克隆到自己的远程仓库
2. 用clone，把这个项目对应的自己远程仓库的东西，弄到本地
3. 修改后再push到自己的远程仓库
4. 在别人的仓库发起`pull resquest`，别人接受后则完成参与
