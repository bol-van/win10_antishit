if EXIST %SystemRoot%\System32\smartscreen.exe (
 taskkill /f /im smartscreen.exe
 call :disable_file %SystemRoot%\System32\smartscreen.exe

 %~dp0desktop -s default "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe \"Get-BitsTransfer -AllUsers ^| Remove-BitsTransfer\""
)

goto :eof

:disable_file

if EXIST "%1" (
takeown /F "%1" /A
icacls "%1" /grant *S-1-5-32-544:F /T
if EXIST "%1.bak" del "%1.bak"
move "%1" "%1.bak"
)
