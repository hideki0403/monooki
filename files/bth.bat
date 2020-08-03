: @echo off
 
sc query state= inactive | findstr BluetoothUserService_* > nul

if %errorlevel% == 0 (
    cd %ProgramW6432%\HSChecker
    devcon remove =Bluetooth @USB*
    devcon rescan
)