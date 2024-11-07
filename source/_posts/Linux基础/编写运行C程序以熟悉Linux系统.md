---
categories:
  - Linux基础
---
在前一章初始化配置完成后，下面的步骤就尤为简单了
在终端（Terminal）中运行下面的命令，部分命令需要依赖于特定的目录，可以右键文件夹空白处，选择在终端中打开即可
# 1. 更新软件包索引
命令：
``` bash
sudo apt update
```

# 2.配置C环境
后续需要使用GCC作为编译工具，这里用apt命令安装
``` bash
sudo apt install gcc

sudo apt install g++
```

# 3.使用Vim创建.c文件
如果你还没安装过vim编辑器，可以参考前面的文章。我选择直接在GUI界面索引到/home/Documents，然后在此目录环境运行终端，进行C语言测试。
我将编写一个名为`factorial.c`的文件，用于计算N!（其能接收用户传入的整数N，并给出这个整数阶乘后的结果）
``` bash
vim factorial.c
```
创建后即可进入编辑器，默认在命令模式，按`i`键进入输入模式，按`Esc`可以退出输入模式，更详细的教程链接如下
[Linux vi/vim | 菜鸟教程 (runoob.com)](https://www.runoob.com/linux/linux-vim.html)
在输入模式下，编写如下代码
``` c
#include<stdio.h>
int main(){
	int i,j,k;
	int N;
	printf("The value of N is: ");
	scanf("%d",&N);
	for(i=N,j=1;i>0;i--){
		j=j*i;
	}
	printf("The reslut of factorial %d is %d",N,j);
}
```
进入命令模式后，使用命令`:wq`保存并退出来到终端，使用如下命令编译刚才创建的.c文件
``` bash
gcc factorial.c
```
之后文件夹中会多出一个`a.out`文件，这就是Linux的可执行文件，终端中使用如下命令执行
``` bash
./a.out
```
即可运行刚才编写的C程序
此外，使用GCC编译.c文件同时，还能对结果进行重命名，如
``` bash
gcc factorial.c -o factorialN
```
这样编译后得到的东西就是factorialN而不是令人费解的a.out了