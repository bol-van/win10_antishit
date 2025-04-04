if "%1" NEQ "def"  (
 for /F "usebackq skip=2 tokens=3" %%f in (`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" /v Default`) do (
  call %0 def %%f\ntuser.dat
  goto :eof
 )
)


set x86="%SYSTEMROOT%\System32\OneDriveSetup.exe"
set x64="%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe"

echo Closing OneDrive process.
echo.
taskkill /f /im OneDrive.exe > NUL 2>&1

echo Uninstalling OneDrive.
echo.
if exist %x64% (
%x64% /uninstall
) else (
%x86% /uninstall
)

echo Removing OneDrive leftovers.
echo.
rd "%USERPROFILE%\OneDrive" /Q /S > NUL 2>&1
rd "C:\OneDriveTemp" /Q /S > NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S > NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S > NUL 2>&1 

echo Removing OneDrive from the Explorer Side Panel.
echo.
REG DELETE "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
REG DELETE "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1

rem Remove onedrive autoinstall from all registry paths
reg load HKLM\DEF %2
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "OneDriveSetup" /f
reg delete HKEY_LOCAL_MACHINE\DEF\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "OneDriveSetup" /f
reg delete HKEY_USERS\S-1-5-19\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "OneDriveSetup" /f
reg delete HKEY_USERS\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "OneDriveSetup" /f
reg unload HKLM\DEF

echo OneDrive remove finished
