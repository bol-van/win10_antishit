rem disable cortana and content delivery manager

taskkill /f /im SearchUI.exe
call :disable_sysapp %SystemRoot%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy SearchUI.exe
taskkill /f /im SearchUI.exe
taskkill /f /im RemindersServer.exe
call :disable_sysapp %SystemRoot%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy RemindersServer.exe
taskkill /f /im RemindersServer.exe
call :disable_sysapp %SystemRoot%\SystemApps\Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy PeopleExperienceHost.exe
call :disable_sysapp %SystemRoot%\SystemApps\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy ContentManagementSDK.dll

"%~dp0install_wim_tweak.exe" /o /c Microsoft-Windows-ContentDeliveryManager /r
"%~dp0install_wim_tweak.exe" /o /c Microsoft-Windows-Cortana /r

rd /q /s %SystemRoot%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy %SystemRoot%\SystemApps\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy

goto :eof

:disable_sysapp

takeown /F "%1" /A /R
icacls "%1" /grant *S-1-5-32-544:F /T
if exist "%1\%2" (
 if exist "%1\%1" del "%1\%2.disable"
 ren "%1\%2" "%2.disable"
)
