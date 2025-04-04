taskkill /f /im browser_broker.exe
taskkill /f /im MicrosoftEdge.exe
timeout /t 1

"%~dp0..\install_wim_tweak.exe" /o /c Microsoft-Windows-Internet-Browser /r
