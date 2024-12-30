@echo off

sc qc windefend | find ": 4" >nul && (
 echo windows defender already eradicated
 goto :eof
)

if x%1==xact goto act
choice /M "Eradicate windows defender. Are you sure ?"
if errorlevel 2 goto :eof
reg add HKLM\SYSTEM\Setup /v SetupType /t REG_DWORD /f /d 1
reg add HKLM\SYSTEM\Setup /v CmdLine /t REG_SZ /f /d "\"%0\" act"
echo reboot now to start process
goto :eof

:act
echo eradicating windefend ...
reg add HKLM\SYSTEM\Setup /v CmdLine /t REG_SZ /f /d ""
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -DisableService
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d 0 /f
sc stop windefend
sc stop sense
sc stop wdboot
sc stop wdfilter
sc config windefend start= disabled
sc config sense start= disabled
sc config wdboot start= disabled
sc config wdfilter start= disabled
