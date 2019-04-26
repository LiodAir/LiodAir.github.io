@echo off

rem github 远程同步脚本

@ cd %~dp0../

echo 更新本地节点
@ hugo -D

@ cd %~dp0

@ git add .

set h=%time:~0,2%
set h=%h: =0%

set THISDATETIME=%date:~0,4%%date:~5,2%%date:~8,2%%h%%time:~3,2%%time:~6,2%
echo  %THISDATETIME%

@ git commit -m %THISDATETIME%

set result=%ERRORLEVEL%

echo %0 | findstr "^nothing to commit" > null
if %errorlevel% equ 0 (
echo 文件未有改动
) else (
@ git push -f origin master

echo 更新完成
)


