@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/

cls

echo ���o�C���z�b�g�X�|�b�g�L�����Z�b�g�A�b�v Ver1.0.0
echo 
echo 1. �t�@�C���̃_�E�����[�h
timeout 3

mkdir "%PROGRAMFILES%\HSChecker"
bitsadmin /transfer download %filehost%check.bat "%PROGRAMFILES%\HSChecker\check.bat"
bitsadmin /transfer download %filehost%run.vbs "%PROGRAMFILES%\HSChecker\run.vbs"