rem default - demand
sc config wuauserv start= disabled
sc stop wuauserv
rem somebody report something restores autostart
sc sdset wuauserv D:(D;;CCWDWO;;;SY)(A;;CCLCSWRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)
takeown /a /f %systemroot%\system32\wuaueng.dll
icacls %systemroot%\system32\wuaueng.dll /deny *s-1-5-18:F

sc stop waasmedicsvc
%~dp0..\desktop.exe -t default "sc config waasmedicsvc start= disabled"
