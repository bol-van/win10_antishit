sc config wuauserv start= demand
rem somebody report something restores autostart
sc sdset wuauserv D:(A;;CCLCSWRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)
icacls %systemroot%\system32\wuaueng.dll /remove *s-1-5-18

%~dp0..\desktop.exe -t default "sc config waasmedicsvc start= demand"
