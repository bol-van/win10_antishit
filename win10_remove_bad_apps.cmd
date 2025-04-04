
rem skype periodically invokes itself and accesses internet resources
call :RemoveApp Microsoft.SkypeApp
rem it just launches and stays resident. useless shit-app
call :RemoveApp Microsoft.People
rem it just launches and stays resident
call :RemoveApp Microsoft.Windows.Photos

goto :eof

:RemoveApp
powershell "Get-AppXProvisionedPackage -online | Where-Object DisplayName -eq "%1"  | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxPackage -AllUsers | Where-Object Name -eq "%1" | Remove-AppxPackage"
