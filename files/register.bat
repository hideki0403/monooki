@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/

echo 最新のセットアップファイルをダウンロードします...
timeout 3
curl -LO %filehost%setup.bat -o setup.bat -#
echo.
echo ダウンロードに成功しました
echo.

powershell start-process setup.bat -verb runas

if %errorlevel% == 1 (
    del /f setup.bat
    echo 何らかの問題が発生しました。再度お試しください。
    pause
)