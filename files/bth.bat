@echo off

cd %ProgramW6432%\HSChecker

sc query state= inactive | findstr BluetoothUserService_* > nul

if %errorlevel% == 0 (
    devcon remove =Bluetooth @USB*
    devcon rescan
)