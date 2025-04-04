if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
 set SD=%~dp0x64
) else (
 set SD=%~dp0x86
)
taskkill /f /im calc.exe

call :copy_with_grant %SD%\calc.exe %SystemRoot%\system32\calc.exe
call :copy_with_grant %SD%\en-US\calc.exe.mui %SystemRoot%\system32\en-US\calc.exe.mui
call :copy_with_grant %SD%\ru-RU\calc.exe.mui %SystemRoot%\system32\ru-RU\calc.exe.mui
cscript %~dp0calc_create_lnk.vbs
goto :eof

:copy_with_grant
if NOT EXIST "%2.orig" copy "%2" "%2.orig"
takeown /a /f "%2"
icacls "%2" /grant *S-1-5-32-544:F
attrib -R "%2"
copy "%1" "%2"
attrib -R "%2"
goto :eof
