---
cssclass: cards
usage: 对dataview表格渲染成卡片视图
banner: 99-Attachment/banner/book.jpg
obsidianUIMode: preview
aliases: 图书阅读清单(dv)
categories:
  - TIPS for Blue Topaz
  - Example
  - ◾ Cssclass声明样式举例
updated: 2022-10-08 05:30:50
created: 2022-08-13 12:45:38
---



```dataview
table without id ("![](" + cover + ")") as Cover,  "<progress value=" + pageprogress + " max="+pagecount+"  class='yellow'>" as progress,file.link as Name, author as Author,publish,rating as Rating
from #book 
sort rating desc

```