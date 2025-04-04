rem disable cortana and content delivery manager

taskkill /f /im SearchUI.exe

for %%f in (%SystemRoot%\SystemApps\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\*.dll %SystemRoot%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy\*.exe %SystemRoot%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy\*.dll) do (
 takeown /A /f "%%f"
 if exist "%%f.bak" del "%%f.bak"
 icacls "%%f" /grant *S-1-5-32-544:F
 move "%%f" "%%f.bak"
)
