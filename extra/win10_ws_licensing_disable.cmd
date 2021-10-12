sc stop clipsvc
sc stop wsservice
reg add HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC /v Start /t REG_DWORD /d 4 /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\wsservice /v Start /t REG_DWORD /d 4 /f
sc config LicenseManager start= disabled
sc stop LicenseManager


