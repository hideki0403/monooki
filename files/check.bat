@echo off
setlocal

reg query HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\WiFi /v AllowInternetSharing | find "0x0"

: AllowInternetSharingの値がhexで0か否か
if %errorlevel% == 0 (
    reg add HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\WiFi /v AllowInternetSharing /t REG_DWORD /d "0x1" /f
)