set SPDB=%TEMP%\secpol.db
set SPSP=%TEMP%\secpol.inf
copy "%~dp0secpol.inf" %SPSP%
secedit /import /cfg %SPSP% /db %SPDB%
secedit /configure /db %SPDB%
del %SPDB% %SPSP%

