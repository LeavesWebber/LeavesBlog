---
categories:
  - Web开发
  - HTML
  - 简介
---
# 元数据：`<meta>` 元素
## 1.指定字符编码
``` HTML
<meta charset="utf-8" />
```
UTF-8可以网页正确显示各国的字符

## 2.name 和 content属性
1. name:    指定meta的类型
2. content:     指定元数据内容
如：
``` html
<meta name="author" content="Chris Mills" />
<meta
  name="description"
  content="The MDN Web Docs site
  provides information about Open Web technologies
  including HTML, CSS, and APIs for both Web sites and
  progressive web apps." />
```
这个和搜索引擎优化（SEO）有关，描述里的内容会出现在如下图所示位置
![image.png](https://leaves520-1326362500.cos.ap-nanjing.myqcloud.com/20240802162858.png)

## 3.元数据协议
一些如facebook的公司会有[Open Graph Data](https://ogp.me/)这样的元数据协议，按照协议要求编辑元数据能使得在**facebook**上展示**你的网站链接**时候，获得官方设定的观感正确的链接卡片

# 为站点添加自定义图标
``` html
<!-- 不含高分辨率 Retina 显示的 iPhone、iPod Touch 和 Android 2.1+ 设备：-->
<link
  rel="apple-touch-icon-precomposed"  href="https://developer.mozilla.org/static/img/favicon57.png" />
<!-- 基本 favicon -->
<link
  rel="icon"
  href="https://developer.mozilla.org/static/img/favicon32.png" />
```
在收藏站点时，收藏夹里显示出的图标由此定义

# 在HTML中应用css和js
css:
``` html
<link rel="stylesheet" href="my-css-file.css" />
```
`rel`元素指明这link的是样式表，`href`给出了样式表文件的路径
js:
``` html
<script src="my-js-file.js" defer></script>
```
`defer` 以告诉浏览器在解析完成 HTML 后再加载 JavaScript
`<script>` 元素看起来像一个[空元素](https://developer.mozilla.org/zh-CN/docs/Glossary/Void_element)，但它并不是，因此需要一个结束标记

# 为文档设定主语言
通过添加 [lang 属性](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Global_attributes/lang)到 HTML 开始的标签中来实现
``` html
<html lang="zh-CN">
  …
</html>
```
这样做能够：
1. 帮搜索引擎更有效索引
2. 利于使用屏幕阅读器的视障人士
