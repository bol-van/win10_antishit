@echo off
set HOSTS=%SystemRoot%\system32\drivers\etc\hosts
md %SystemRoot%\system32\drivers\etc 2>nul
attrib -R %HOSTS%
for /F "tokens=*" %%v in ('findstr "0.0.0.0" "%~dp0win10_disable_shit_hosts.txt"') do (
 find "%%v" %HOSTS% >nul
 if errorlevel 1 (
  echo %%v>>%HOSTS%
 )
)
