@echo off
 
sc query state=inactive | findstr BluetoothUserService_*

if %errorlevel% == 0 (
    cd %PROGRAMFILES%\HSChecker
    devcon remove =Bluetooth @USB*
    devcon rescan
)