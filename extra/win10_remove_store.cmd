@echo off
setlocal enableextensions enabledelayedexpansion

if "%1" NEQ "Y"  (
echo Remove windows store
choice /M "Are you sure ?"
if errorlevel 2 goto :eof
)

for /F "usebackq skip=2 tokens=2*" %%f in (`reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx /v PackageRoot`) do (
 SET PKG_ROOT=%%g
)
takeown /a /f "%PKG_ROOT%"
icacls "%PKG_ROOT%" /grant "*S-1-5-32-544:(OI)(CI)F"

call :backup Microsoft.VCLibs*
IF errorlevel 1 goto backup_failed
call :backup Microsoft.NET.Native.Runtime*
IF errorlevel 1 goto backup_failed
call :backup Microsoft.WindowsStore
IF errorlevel 1 goto backup_failed
echo Backup successful

powershell "Get-AppXProvisionedPackage -online | Where-Object DisplayName -eq "Microsoft.WindowsStore" | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxPackage -AllUsers | Where-Object Name -eq "Microsoft.WindowsStore" | Remove-AppxPackage"

for /F "usebackq tokens=3*" %%f in (`powershell "Get-AppxPackage -AllUsers | Where Name -eq Microsoft.WindowsStore | Format-List -Property PackageFullName"`) do (
 powershell Remove-AppxPackage -AllUsers -Package "%%f"
)


goto :eof

:backup_failed
echo Package backup failed
goto :eof

:backup

for /F "tokens=*" %%f in ('powershell "Get-AppxPackage -AllUsers -PackageTypeFilter "Resource","Main","Framework","Bundle" | Where-Object Name -like "%1" | ForEach-Object {$_.InstallLocation}"') do (
 echo Backing up package in "%%f"
 set PKG_DIR=%%f
 set PKG_BASE_DIR=%%~dpf
 set PKG_FOLDER_NAME=%%~nxf
 if !PKG_BASE_DIR:~-1!==\ SET PKG_BASE_DIR=!PKG_BASE_DIR:~0,-1!

 if not exist "!PKG_BASE_DIR!\ShitAppBackup" (
   mkdir "!PKG_BASE_DIR!\ShitAppBackup"
   icacls "!PKG_BASE_DIR!\ShitAppBackup" /grant "*S-1-5-32-544:(OI)(CI)F"
 )
 if exist "!PKG_BASE_DIR!\ShitAppBackup\!PKG_FOLDER_NAME!" rd /q /s "!PKG_BASE_DIR!\ShitAppBackup\!PKG_FOLDER_NAME!"
 mkdir "!PKG_BASE_DIR!\ShitAppBackup\!PKG_FOLDER_NAME!"
 xcopy /Y /E /Q "!PKG_DIR!" "!PKG_BASE_DIR!\ShitAppBackup\!PKG_FOLDER_NAME!"
 if errorlevel 1 (
  echo Backup failed. Operation aborted.
  goto :eof
 )
)
goto :eof
