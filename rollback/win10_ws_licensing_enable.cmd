reg add HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC /v Start /t REG_DWORD /d 3 /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\wsservice /v Start /t REG_DWORD /d 3 /f
sc config LicenseManager start= demand


