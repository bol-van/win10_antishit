set F=%TEMP%\al.reg
set F2=%TEMP%\al2.reg
regedit /e "%F%" HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener
powershell -Command "Select-String -Pattern "\"Enabled\"", "\[HKEY", "Windows\sRegistry" -Path \"%F%\" | ForEach-Object {$_.Line} | Foreach-Object {$_ -replace '\"Enabled\"=dword:00000001', '\"Enabled\"=dword:00000000'} | Out-File \"%F2%\"" 
regedit /s "%F2%"
rem del "%F%" "%F2%"
del "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\*.etl" "%ProgramData%\Microsoft\Diagnosis\ETLLogs\ShutdownLogger\*.etl"
reg add HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener /v Start /t REG_DWORD /d 0 /f
sc config diagtrack start= disabled
sc stop diagtrack
sc config dmwappushservice start= disabled
sc stop dmwappushservice
