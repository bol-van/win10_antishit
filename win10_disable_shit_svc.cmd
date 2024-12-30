if x%1==xact goto act
%~dp0desktop.exe -t default "%0 act"
goto :eof

:act
rem default - auto
sc config mapsbroker start= disabled
sc stop mapsbroker
rem default - auto
sc config pcasvc start= disabled
sc stop pcasvc
rem default - demand
sc config wersvc start= disabled
sc stop wersvc
rem default - demand
sc config lfsvc start= disabled
sc stop lfsvc
rem default - demand
sc config wisvc start= disabled
sc stop wisvc
rem default - auto
rem this service http polls geoip server
sc config dosvc start= disabled
sc stop dosvc
rem default - auto
sc config wpnservice start= disabled
sc stop wpnservice

reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "SecurityHealth" /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService /f /t REG_DWORD /v Start /d 4

rem default - demand
sc config wlidsvc start= disabled
sc stop wlidsvc
rem default - auto
sc config cdpsvc start= disabled
sc stop cdpsvc
rem default - demand
sc config ncbservice start= disabled
sc stop ncbservice
rem default - auto
reg add HKLM\SYSTEM\CurrentControlSet\Services\wscsvc /f /t REG_DWORD /v Start /d 4
sc config wscsvc start= disabled
sc stop wscsvc
rem default - demand
sc config pushtoinstall start= disabled
sc stop pushtoinstall
rem default - auto. permissions allow change config only to TrustedInstaller
sc config SgrmBroker start= disabled
sc stop SgrmBroker
rem default - auto
sc config usosvc start= disabled
sc stop usosvc
rem default - auto (delayed start)
sc config uhssvc start= disabled
sc stop uhssvc

sc config windefend start= disabled
sc config wdboot start= disabled
sc stop wdboot
sc config wdfilter start= disabled
sc stop wdfilter
reg add HKLM\SYSTEM\CurrentControlSet\Services\Windefend /f /t REG_DWORD /v Start /d 4

sc config waasmedicsvc start= disabled
