@echo off
setlocal

: Config
set filehost=https://github.com/hideki0403/monooki/raw/master/files/


: �Ǘ��Ҍ����m�F
openfiles > NUL 2>&1
if %ERRORLEVEL% == 0 (
    : �Ǘ���
    echo �ŐV�̃Z�b�g�A�b�v�t�@�C�����_�E�����[�h���܂�...
    timeout 3
    curl -LO %filehost%setup.bat -o %tmp%\setup.bat
    call %tmp%\setup.bat
) else (
    : ��ʃ��[�U�[
    echo �Ǘ��Ҍ����Ŏ��s���Ă��������B
    echo ���̃t�@�C�����E�N���b�N���āu�Ǘ��҂Ƃ��Ď��s�v���������ƂŊǗ��Ҍ����ł̎��s���\�ł��B
    pause
)