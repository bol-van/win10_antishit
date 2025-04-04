Set oWS = WScript.CreateObject("WScript.Shell")
Set wshShell = CreateObject( "WScript.Shell" )
sLinkFile = wshShell.ExpandEnvironmentStrings( "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Accessories\Calculator.lnk")
Set oLink = oWS.CreateShortcut(sLinkFile)
    oLink.TargetPath = "%SystemRoot%\system32\calc.exe"
 '  oLink.Arguments = ""
 '  oLink.Description = "MyProgram"   
 '  oLink.HotKey = "ALT+CTRL+F"
 '  oLink.IconLocation = "C:\Program Files\MyApp\MyProgram.EXE, 2"
 '  oLink.WindowStyle = "1"   
 '  oLink.WorkingDirectory = "C:\Program Files\MyApp"
oLink.Save