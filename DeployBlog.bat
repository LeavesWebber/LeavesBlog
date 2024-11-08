@echo off
cd /d "D:\项目文件\LeavesBlog"
hexo g
git add .
git commit -m "文章更新[%date%]"
git push
pause