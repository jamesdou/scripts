@echo off
echo Viewing application logs...

if "%1"=="flask" (
    echo Showing Flask logs...
    if exist "app.log" (
        tail -f app.log
    ) else (
        echo No Flask log file found (app.log)
    )
) else if "%1"=="error" (
    echo Showing error logs...
    if exist "error.log" (
        tail -f error.log
    ) else (
        echo No error log file found (error.log)
    )
) else (
    echo Usage: logs.bat [flask^|error^|access]
    echo Or just 'logs' to see all recent logs
    if exist "*.log" (
        echo Available log files:
        dir *.log /b
    )
)
pause