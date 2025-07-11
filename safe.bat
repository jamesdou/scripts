@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Usage: safe.bat [script-name] [args...]
    echo Example: safe.bat flask-dev
    echo Example: safe.bat db-migrate "add users"
    echo.
    echo Runs scripts safely with automatic backup/restore on failure
    pause
    exit /b 1
)

set SCRIPT=%1
set BACKUP_DIR=.safe_backup_%random%
set ERROR_OCCURRED=0

:: Shift to get remaining arguments
shift
set ARGS=
:loop
if "%1"=="" goto continue
set ARGS=!ARGS! %1
shift
goto loop
:continue

echo [SAFE] Running: %SCRIPT%.bat !ARGS!
echo [SAFE] Creating backup...

:: Create backup of critical files
mkdir %BACKUP_DIR% 2>nul
copy *.py %BACKUP_DIR%\ 2>nul
copy *.json %BACKUP_DIR%\ 2>nul
copy *.txt %BACKUP_DIR%\ 2>nul
if exist ".venv" xcopy .venv %BACKUP_DIR%\.venv\ /e /q 2>nul
if exist "node_modules\package.json" copy node_modules\package.json %BACKUP_DIR%\ 2>nul

echo [SAFE] Backup created: %BACKUP_DIR%

:: Run the actual script and capture exit code
call %SCRIPT%.bat !ARGS!
set ERROR_OCCURRED=!errorlevel!

if !ERROR_OCCURRED! neq 0 (
    echo.
    echo [SAFE] ERROR: Script failed with exit code !ERROR_OCCURRED!
    echo [SAFE] Restoring from backup...
    
    :: Restore files
    copy %BACKUP_DIR%\*.py . 2>nul
    copy %BACKUP_DIR%\*.json . 2>nul
    copy %BACKUP_DIR%\*.txt . 2>nul
    if exist "%BACKUP_DIR%\.venv" (
        rmdir /s /q .venv 2>nul
        xcopy %BACKUP_DIR%\.venv .venv\ /e /q 2>nul
    )
    
    echo [SAFE] Files restored from backup
    echo [SAFE] Check the error above and try again
) else (
    echo [SAFE] Script completed successfully
)

:: Cleanup backup
echo [SAFE] Cleaning up backup...
rmdir /s /q %BACKUP_DIR% 2>nul

if !ERROR_OCCURRED! neq 0 (
    echo [SAFE] Script failed - state restored
    pause
    exit /b !ERROR_OCCURRED!
) else (
    echo [SAFE] All done!
)

endlocal