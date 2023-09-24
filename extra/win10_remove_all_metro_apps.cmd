@if "%1" NEQ "Y"  (
@echo All metro apps except Store will be deleted
@choice /M "Are you sure ?"
@if errorlevel 2 goto :eof
)

powershell "Get-AppXProvisionedPackage -online | Where DisplayName -ne "Microsoft.WindowsStore" | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxPackage -AllUsers | Where Name -ne "Microsoft.WindowsStore" | Remove-AppxPackage"

for /F "usebackq tokens=3*" %%f in (`powershell "Get-AppxPackage -AllUsers | Where Name -ne Microsoft.WindowsStore | Format-List -Property PackageFullName"`) do (
 powershell Remove-AppxPackage -AllUsers -Package "%%f"
)
