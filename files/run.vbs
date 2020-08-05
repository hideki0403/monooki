Set Ws = WScript.CreateObject("WScript.Shell")
HSstatus = Ws.RegRead("HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\WiFi\AllowInternetSharing")

If HSstatus = 0 Then
    Ws.RegWrite "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\WiFi\AllowInternetSharing", 1, "REG_DWORD"
    Ws.RegWrite "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Connectivity\AllowBluetooth", 2, "REG_DWORD"
    Ws.RegWrite "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth\AllowAdvertising", 1, "REG_DWORD"
    Ws.RegWrite "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth\AllowDiscoverableMode", 1, "REG_DWORD"
    Ws.RegWrite "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth\AllowPromptedProximalConnections", 1, "REG_DWORD"
    Ws.RegWrite "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Settings\PageVisibilityList", "", "REG_SZ"
End If

' Ws.run "powershell start-process '%ProgramW6432%\HSChecker\bth.bat' -verb runas", 0, True
Ws.run "cmd /c ""%ProgramW6432%\HSChecker\bth.bat""", 1, True