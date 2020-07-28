@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/
set defaultDir=%PROGRAMFILES%\HSChecker

cls

echo モバイルホットスポット有効化セットアップ Ver1.0.4
echo.
echo 1. ファイルのダウンロード
timeout 3

mkdir "%defaultDir%"
bitsadmin /transfer download %filehost%run.vbs "%defaultDir%\run.vbs"
echo ダウンロードに成功しました。

cls

echo 2. 自動実行タスクの作成
echo.
schtasks /create /tn HSChecker /tr "'wscript.exe' '%defaultDir%\run.vbs'" /sc minute /mo 10 /rl highest /F
echo タスクの作成に成功しました。

echo.
echo セットアップが完了しました。
pause