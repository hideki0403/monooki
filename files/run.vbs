Dim oShell
Set oShell = WScript.CreateObject ("WSCript.shell")
oShell.run "check.bat",0
Set oShell = Nothing