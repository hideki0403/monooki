@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/
set defaultDir=%PROGRAMFILES%\HSChecker

cls

echo モバイルホットスポット・Bluetooth有効化セットアップ Ver1.2.1

echo.
echo 1. ファイルのダウンロード
timeout 3

mkdir "%defaultDir%"
curl -LO %filehost%run.vbs -o "%defaultDir%\run.vbs" -#
echo ダウンロードに成功しました。

echo.
echo 2. 自動実行タスクの作成
echo.
schtasks /create /tn HSChecker /tr "'wscript.exe' '%defaultDir%\run.vbs'" /sc minute /mo 10 /rl highest /F
echo タスクの作成に成功しました。

echo.
echo 3. タスク設定の変更

schtasks /query /tn HSChecker /xml > hsc.xml
setlocal enabledelayedexpansion
for /f "delims=" %%a in (hsc.xml) do (
  set str=%%a
  echo !str:^<DisallowStartIfOnBatteries^>true=^<DisallowStartIfOnBatteries^>false! >> temp.xml
)
endlocal
schtasks /create /tn HSChecker /xml temp.xml /f
del temp.xml
del hsc.xml
echo 設定の変更に成功しました。

echo.
echo.
echo セットアップが完了しました。
pause

del /f "%~dp0%~nx0"