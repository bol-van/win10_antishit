echo off

setlocal EnableDelayedExpansion

set EPATH=%ProgramFiles% ^(x86^)\Microsoft\Edge\Application
if exist "%EPATH%" (
 call :uninstall "%EPATH%"
) else (
 echo Edge not found
)

set EPATH=%ProgramFiles% ^(x86^)\Microsoft\EdgeWebView\Application
if exist "%EPATH%" (
 call :uninstall "%EPATH%" --msedgewebview
) else (
 echo EdgeWebView not found
)

goto :eof

:uninstall
echo killing %1
for /R %1 %%d in ( setup.?xe ) do (
 "%%d" --uninstall --force-uninstall --system-level %2
)
