@echo off
setlocal

reg query HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\WiFi /v AllowInternetSharing | find "0x0"

: AllowInternetSharing�̒l��hex��0���ۂ�
if %errorlevel% == 0 (
    reg add HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\WiFi /v AllowInternetSharing /t REG_DWORD /d "0x1" /f
)