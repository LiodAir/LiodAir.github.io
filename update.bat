@echo off

rem github Զ��ͬ���ű�

@ cd %~dp0../

echo ���±��ؽڵ�
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
echo �ļ�δ�иĶ�
) else (
@ git push -f origin master

echo �������
)


