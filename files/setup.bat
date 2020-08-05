@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/
set defaultDir=%ProgramW6432%\HSChecker

cls

echo モバイルホットスポット・Bluetooth有効化セットアップ Ver1.4.0

timeout 3

mkdir "%defaultDir%"
cd "%defaultDir%"

curl -LO %filehost%run.vbs -#
curl -LO %filehost%bth.bat -#
curl -LO https://download.microsoft.com/download/1/4/0/140EBDB7-F631-4191-9DC0-31C8ECB8A11F/wdk/Installers/787bee96dbd26371076b37b13c405890.cab -#
expand 787bee96dbd26371076b37b13c405890.cab -F:filbad6e2cce5ebc45a401e19c613d0a28f -R ./
ren filbad6e2cce5ebc45a401e19c613d0a28f devcon.exe

copy %SystemRoot%\System32\sc.exe . /Y

schtasks /create /tn HSChecker /tr "'wscript.exe' '%defaultDir%\run.vbs'" /sc minute /mo 10 /rl highest /F /RU "SYSTEM"
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
del 787bee96dbd26371076b37b13c405890.cab

cls

echo.
echo セットアップが完了しました。
echo.
timeout 3
del /f "%~dp0%~nx0"