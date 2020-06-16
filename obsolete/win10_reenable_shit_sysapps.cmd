rem rollback disabling cortana and content delivery manager

for %%f in (%SystemRoot%\SystemApps\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\*.bak %SystemRoot%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy\*.bak %SystemRoot%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy\*.bak) do (
 move "%%f" "%%~dpnf"
 if errorlevel 1 del "%%f"
)
