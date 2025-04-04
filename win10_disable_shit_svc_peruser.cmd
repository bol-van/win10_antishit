@echo off
for %%v in (CDPUserSvc OneSyncSvc UdkUserSvc AarSvc) do (
 for /f %%I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f %%v ^| find /i "%%v" ') do (
  echo Disabling %%~nI
  reg add "%%I" /v "Start" /t REG_DWORD /d 4 /f
  sc config %%~nI start= disabled
  sc stop %%~nI
 )
)
