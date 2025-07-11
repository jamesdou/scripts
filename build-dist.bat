@echo off
echo Building Python distribution packages...
echo.

REM Check if setup.py exists
if not exist setup.py (
    echo Error: setup.py not found in current directory
    echo Please run this command from your project root directory
    pause
    exit /b 1
)

REM Create distribution packages
echo Running: python setup.py sdist bdist_wheel
python setup.py sdist bdist_wheel

if %errorlevel% neq 0 (
    echo.
    echo Error: Build failed
    pause
    exit /b 1
)

echo.
echo Build completed successfully!
echo Distribution files created in dist/ directory
pause