@if "%1" NEQ "Y"  (
@echo All metro apps except Store will be deleted
@choice /M "Are you sure ?"
@if errorlevel 2 goto :eof
)

powershell "Get-AppXProvisionedPackage -online | Where DisplayName -ne "Microsoft.WindowsStore" | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxPackage -AllUsers | Where Name -ne "Microsoft.WindowsStore" | Remove-AppxPackage"
