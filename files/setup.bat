@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/
set defaultDir=%PROGRAMFILES%\HSChecker

cls

echo ���o�C���z�b�g�X�|�b�g�EBluetooth�L�����Z�b�g�A�b�v Ver1.2.1

echo.
echo 1. �t�@�C���̃_�E�����[�h
timeout 3

mkdir "%defaultDir%"
curl -LO %filehost%run.vbs -o "%defaultDir%\run.vbs" -#
echo �_�E�����[�h�ɐ������܂����B

echo.
echo 2. �������s�^�X�N�̍쐬
echo.
schtasks /create /tn HSChecker /tr "'wscript.exe' '%defaultDir%\run.vbs'" /sc minute /mo 10 /rl highest /F
echo �^�X�N�̍쐬�ɐ������܂����B

echo.
echo 3. �^�X�N�ݒ�̕ύX

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
echo �ݒ�̕ύX�ɐ������܂����B

echo.
echo.
echo �Z�b�g�A�b�v���������܂����B
pause

del /f "%~dp0%~nx0"