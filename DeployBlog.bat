@echo off
cd /d "D:\项目文件\LeavesBlog"
hexo g && git add . && git commit -m "ArticlePublish[%date%]" && git push
pause