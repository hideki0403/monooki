@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/


: 管理者権限確認
openfiles > NUL 2>&1
if %ERRORLEVEL% == 0 (
    : 管理者
    echo 最新のセットアップファイルをダウンロードします...
    timeout 3
    curl -LO %filehost%setup.bat -o %tmp%\setup.bat
    call %tmp%\setup.bat
) else (
    : 一般ユーザー
    echo 管理者権限で実行してください。
    echo このファイルを右クリックして「管理者として実行」を押すことで管理者権限での実行が可能です。
    pause
)