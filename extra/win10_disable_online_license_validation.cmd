netsh firewall set opmode ENABLE
@netsh advfirewall firewall del rule name="Disable online license validation" >nul
netsh advfirewall firewall add rule name="Disable online license validation" program=%SystemRoot%\system32\wbem\wmiprvse.exe dir=out action=block
