@echo off
cd /d "D:\项目文件\LeavesBlog"
setlocal
set "DATE=%date:~-4%-%date:~4,2%-%date:~7,2% %time:~0,2%:%time:~3,2%"
hexo g && git add . && git commit -m "ArticlePublish[%DATE%]" && git push
endlocal
pause