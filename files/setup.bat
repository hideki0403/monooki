@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/
set defaultDir=%PROGRAMFILES%\HSChecker

cls

echo ���o�C���z�b�g�X�|�b�g�L�����Z�b�g�A�b�v Ver1.0.4
echo.
echo 1. �t�@�C���̃_�E�����[�h
timeout 3

mkdir "%defaultDir%"
bitsadmin /transfer download %filehost%run.vbs "%defaultDir%\run.vbs"
echo �_�E�����[�h�ɐ������܂����B

cls

echo 2. �������s�^�X�N�̍쐬
echo.
schtasks /create /tn HSChecker /tr "'wscript.exe' '%defaultDir%\run.vbs'" /sc minute /mo 10 /rl highest /F
echo �^�X�N�̍쐬�ɐ������܂����B

echo.
echo �Z�b�g�A�b�v���������܂����B
pause