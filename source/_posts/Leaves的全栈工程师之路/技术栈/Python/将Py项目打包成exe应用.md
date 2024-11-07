---
title: 如何将Py项目打包成exe应用？
tags:
  - python
categories:
  - Leaves的全栈工程师之路
  - 技术栈
  - Python
date:
updated:
---
# 使用 **PyInstaller**在 Windows 上将 `.py` 文件转换为可执行文件（`.exe`）

## 步骤 1：安装 PyInstaller
1. **打开命令提示符** 或 **PowerShell**。
2. 使用 `pip` 安装 PyInstaller：
``` bash
pip install pyinstaller
```

### 步骤 2：转换 .py 文件为 .exe

1. 导航到 Python 项目所在的目录（可以使用 `cd` 命令）

2. 使用以下命令将 `.py` 文件转换为 `.exe` 文件：
``` bash
pyinstaller --onefile your_script.py
```
将 `your_script.py` 替换为 Python 文件名

 `--onefile` 选项会生成一个单独的可执行文件。

### 步骤 3：查找生成的 .exe 文件

转换完成后，PyInstaller 会在当前目录下生成一个名为 `dist` 的文件夹，里面包含转换后的 `.exe` 文件。

### 附加选项

- 如果 Python 脚本需要额外的资源文件（如图片、数据文件等），可以使用 `--add-data` 选项指定这些文件。例如：
``` bash
pyinstaller --onefile --add-data "data.txt;." your_script.py
```

- 如果需要隐藏控制台窗口（适用于 GUI 应用），可以添加 `--noconsole` 选项：
``` bash
pyinstaller --onefile --noconsole your_script.py
```

完成后，就可以像使用普通的 `.exe` 文件一样双击执行 Python 程序了