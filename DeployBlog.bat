@echo off
cd /d "D:\Projects\LeavesBlog"
setlocal
:: 获取年、月、日
for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do set "dt=%%a"
set "year=%dt:~0,4%"
set "month=%dt:~4,2%"
set "day=%dt:~6,2%"
:: 获取小时、分钟、秒
set "hour=%dt:~8,2%"
set "minute=%dt:~10,2%"
set "second=%dt:~12,2%"
:: 构建日期字符串
set "DATE=%year%-%month%-%day% %hour%:%minute%:%second%"
:: 执行Hexo生成和Git命令
hexo g && git add . && git commit -m "ArticlePublish[%DATE%]" && git push
endlocal
pause