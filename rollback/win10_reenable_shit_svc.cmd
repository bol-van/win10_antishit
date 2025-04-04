sc config dsmsvc start= demand
sc config mapsbroker start= auto
sc config pcasvc start= auto
sc config wersvc start= demand
sc config lfsvc start= demand
sc config wisvc start= demand
sc config dosvc start= auto
reg add HKLM\SYSTEM\CurrentControlSet\Services\dosvc /f /t REG_DWORD /v Start /d 2
sc config wpnservice start= auto
rem default - demand. permissions allow change config only to TrustedInstaller
reg add HKLM\SYSTEM\CurrentControlSet\Services\WpnService /f /t REG_DWORD /v Start /d 3
rem default - auto. permissions allow change config only to TrustedInstaller
reg add HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService /f /t REG_DWORD /v Start /d 2
sc config wlidsvc start= manual
sc config cdpsvc start= auto
sc config ncbservice start= demand
sc config wscsvc start= demand
reg add HKLM\SYSTEM\CurrentControlSet\Services\wscsvc /f /t REG_DWORD /v Start /d 2
sc config pushtoinstall start= demand
reg add HKLM\SYSTEM\CurrentControlSet\Services\SgrmBroker /f /t REG_DWORD /v Start /d 2
reg add HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /f /t REG_DWORD /v Start /d 2
reg add HKLM\SYSTEM\CurrentControlSet\Services\Windefend /f /t REG_DWORD /v Start /d 3
sc config waasmedicsvc start= demand
