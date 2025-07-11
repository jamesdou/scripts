@echo off
echo Creating project backup...

set BACKUP_DIR=backup_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set BACKUP_DIR=%BACKUP_DIR: =0%

echo Creating backup directory: %BACKUP_DIR%
mkdir %BACKUP_DIR%

echo Copying source files...
xcopy *.py %BACKUP_DIR%\ /y >nul 2>&1
xcopy *.js %BACKUP_DIR%\ /y >nul 2>&1
xcopy *.json %BACKUP_DIR%\ /y >nul 2>&1
xcopy *.txt %BACKUP_DIR%\ /y >nul 2>&1

if exist "src" xcopy src %BACKUP_DIR%\src\ /e /y >nul 2>&1
if exist "templates" xcopy templates %BACKUP_DIR%\templates\ /e /y >nul 2>&1
if exist "static" xcopy static %BACKUP_DIR%\static\ /e /y >nul 2>&1
if exist "public" xcopy public %BACKUP_DIR%\public\ /e /y >nul 2>&1

echo Backup created successfully in %BACKUP_DIR%
pause