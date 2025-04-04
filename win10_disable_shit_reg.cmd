rem win11 tamper protection setting unblock
setacl -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" -ot reg -actn setowner -ownr "n:S-1-5-32-544"
setacl -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" -ot reg -actn ace -ace "n:S-1-5-32-544;p:full"

if "%1" NEQ "def"  (
 for /F "usebackq skip=2 tokens=3" %%f in (`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" /v Default`) do (
  call %0 def %%f\ntuser.dat
  goto :eof
 )
)
reg load HKLM\DEF %2
regedit /s "%~dp0win10_disable_shit.reg"
reg unload HKLM\DEF
