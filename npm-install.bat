@echo off
if "%1"=="" (
    echo Installing all dependencies...
    npm install
) else (
    echo Installing %*...
    npm install %*
)
pause