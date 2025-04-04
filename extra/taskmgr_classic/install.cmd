set DD=%SystemRoot%\tm
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
 set SD=%~dp0x64
) else (
 set SD=%~dp0x86
)
mkdir "%DD%"
xcopy /Y /E "%SD%" "%DD%"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe" /v "Debugger" /d "%DD%\tm.exe" /f
