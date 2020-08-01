@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/

echo 最新のセットアップファイルをダウンロードします...
timeout 3
curl -LO %filehost%setup.bat -o %tmp%\setup.bat -#
echo ダウンロードに成功しました
powershell start-process %tmp%\setup.bat -verb runas