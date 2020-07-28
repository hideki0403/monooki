Set Ws = WScript.CreateObject("WScript.Shell")
HSstatus = Ws.RegRead("HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\WiFi\AllowInternetSharing")

If HSstatus = 0 Then
    Ws.RegWrite "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\WiFi\AllowInternetSharing", 1, "REG_DWORD"
End If