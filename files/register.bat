@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/

echo �ŐV�̃Z�b�g�A�b�v�t�@�C�����_�E�����[�h���܂�...
timeout 3
curl -LO %filehost%setup.bat -o setup.bat -#
echo.
echo �_�E�����[�h�ɐ������܂���
echo.

powershell start-process setup.bat -verb runas

if %errorlevel% == 1 (
    del /f setup.bat
    echo ���炩�̖�肪�������܂����B�ēx���������������B
    pause
)