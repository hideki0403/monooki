@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/

echo �ŐV�̃Z�b�g�A�b�v�t�@�C�����_�E�����[�h���܂�...
timeout 3
curl -LO %filehost%setup.bat -o %tmp%\setup.bat -#
echo �_�E�����[�h�ɐ������܂���
powershell start-process %tmp%\setup.bat -verb runas