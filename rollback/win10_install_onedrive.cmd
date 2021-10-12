set x86="%SYSTEMROOT%\System32\OneDriveSetup.exe"
set x64="%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe"

echo Closing OneDrive process.
echo.
taskkill /f /im OneDrive.exe > NUL 2>&1

echo Installing OneDrive.
echo.
if exist %x64% (
%x64% /install
) else (
%x86% /install
)

echo OneDrive install finished
