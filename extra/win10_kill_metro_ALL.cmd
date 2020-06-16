@echo All metro apps including store will be deleted, licensing will be disabled
@choice /M "Are you sure ?"
@if errorlevel 2 goto :eof
call %~dp0win10_remove_all_metro_apps.cmd Y
call %~dp0win10_remove_store.cmd Y
call %~dp0win10_ws_licensing_disable.cmd
call %~dp0calculator_classic\install.cmd