Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c Backend\Script\launch.bat"
oShell.Run strArgs, 0, false
