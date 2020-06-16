if "%1" NEQ "def"  (
 for /F "usebackq skip=2 tokens=3" %%f in (`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" /v Default`) do (
  call %0 def %%f\ntuser.dat
  goto :eof
 )
)
reg load HKLM\DEF %2
regedit /s "%~dp0win10_reenable_shit.reg"
reg unload HKLM\DEF
