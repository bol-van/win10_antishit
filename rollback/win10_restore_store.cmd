@echo off
for /F "tokens=*" %%f in ('powershell "Get-AppxPackage -AllUsers | Where-Object Name -eq "Microsoft.WindowsStore" | ForEach-Object {$_.InstallLocation}"') do (
 echo Store already installed
 goto :eof
)

for /F "usebackq skip=2 tokens=2*" %%f in (`reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx /v PackageRoot`) do (
 SET PKG_ROOT=%%g
)
takeown /a /f "%PKG_ROOT%"
icacls "%PKG_ROOT%" /grant "*S-1-5-32-544:(OI)(CI)F"

call :restore_container Microsoft.VCLibs*
call :restore_container Microsoft.NET.Native.Runtime*
call :restore_container Microsoft.WindowsStore*__*
call :restore_container Microsoft.WindowsStore*language*

goto :eof


:restore_container
for /D %%f in ("%PKG_ROOT%\ShitAppBackup\%1") do (
 echo Found backup package : %%f
 if exist "%PKG_ROOT%\%%~nxf" (
  echo Package already installed
 ) else (
  move "%%f" "%PKG_ROOT%"
  rem Users, "ALL APPLICATION PACKAGES"
  icacls "%PKG_ROOT%\%%~nxf" /grant "*S-1-5-32-545:(OI)(CI)RX" /grant "*S-1-15-2-1:(OI)(CI)RX"
  if errorlevel 1 (
   echo ERROR: could not move "%%f" to "%PKG_ROOT%"
   goto :eof
  )
  powershell "Add-AppxPackage -Path '%PKG_ROOT%\%%~nxf\AppxManifest.xml' -register -DisableDevelopmentMode"
  if not errorlevel 1 (
   echo Successfully restored to : %PKG_ROOT%\%%~nxf
  )
 )
)
goto :eof
