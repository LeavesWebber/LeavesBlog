---
categories:
  - Linux基础
  - 实验报告
title: fork进程实验
tags:
  - 实验
date:
updated:
---

# 实验要求：

1. Ubuntu操作系统，C语言编程。
2. 创建多个父进程与子进程，并撤销这些进程。
3. 编写一段程序，使用系统调用fork()创建两个子进程。当此程序运行时，在系统中有一个父进程和两个子进程活动。让每一个进程在屏幕上显示一个字符：父进程显示字符a；子进程分别显示字符b和字符c。试观察记录屏幕上的显示结果并分析原因

# 源码展示

```c
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid1, pid2;

    // 创建第一个子进程
    pid1 = fork();

    if (pid1 < 0) {
        // fork失败
        fprintf(stderr, "Fork failed\n");
        return 1;
    } else if (pid1 == 0) {
        // 子进程1
        printf("b");
        fflush(stdout); // 确保立即输出
        sleep(1); // 添加延迟
    } else {
        // 父进程
        pid2 = fork();

        if (pid2 < 0) {
            // fork失败
            fprintf(stderr, "Fork failed\n");
            return 1;
        } else if (pid2 == 0) {
            // 子进程2
            printf("c");
            fflush(stdout); // 确保立即输出
            sleep(1); // 添加延迟
        } else {
            // 父进程
            printf("a");
            fflush(stdout); // 确保立即输出
            wait(NULL); // 等待第一个子进程结束
            wait(NULL); // 等待第二个子进程结束
            sleep(1); // 添加延迟
        }
    }

    return 0;
}
```

# 实验步骤

代码AI写的，因为进程这些概念雀食不太懂

刚开始程序输出结果还看不到，加了`sleep(1)`后得以解决

![网络异常，图片加载失败](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20241009200748.png) 可以看到，每次输出的字符顺序不一样