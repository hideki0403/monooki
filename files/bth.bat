@echo off
 
sc query state= inactive | findstr BluetoothUserService_* > nul

if %errorlevel% == 0 (
    cd %PROGRAMFILES%\HSChecker
    devcon remove =Bluetooth @USB*
    devcon rescan
)