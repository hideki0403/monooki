@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/

cls

echo モバイルホットスポット有効化セットアップ Ver1.0.0
echo 
echo 1. ファイルのダウンロード
timeout 3

mkdir "%PROGRAMFILES%\HSChecker"
bitsadmin /transfer download %filehost%check.bat "%PROGRAMFILES%\HSChecker\check.bat"
bitsadmin /transfer download %filehost%run.vbs "%PROGRAMFILES%\HSChecker\run.vbs"