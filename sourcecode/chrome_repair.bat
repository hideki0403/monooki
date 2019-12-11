@echo off
title 修正パッチ

echo netsh winsock reset > fix.bat

echo 修復を開始します。
powershell start-process fix.bat -verb runas -wait

del fix.bat

echo 修復に成功しました。何かキーを押すことで再起動します。
echo.

pause

shutdown -r -t 0