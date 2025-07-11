@echo off
echo Cleaning project files...

echo Removing Python cache files...
for /r %%i in (__pycache__) do (
    if exist "%%i" (
        echo Removing %%i
        rmdir /s /q "%%i"
    )
)

echo Removing .pyc files...
del /s /q *.pyc 2>nul

echo Removing React build files...
if exist "build" (
    echo Removing build directory...
    rmdir /s /q build
)

echo Removing node_modules (if requested)...
set /p clean_node="Remove node_modules? (y/N): "
if /i "%clean_node%"=="y" (
    if exist "node_modules" (
        echo Removing node_modules...
        rmdir /s /q node_modules
    )
)

echo Removing log files...
del /q *.log 2>nul

echo Cleanup complete!
pause