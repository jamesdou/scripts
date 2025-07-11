@echo off
echo Checking development environment...

echo [Python Environment]
if exist ".venv" (
    echo ✓ Virtual environment exists
    call .venv\Scripts\activate.bat
    python --version
    pip --version
) else (
    echo ✗ Virtual environment not found - run pyinit.bat
)

echo.
echo [Node.js Environment]
node --version 2>nul && echo ✓ Node.js installed || echo ✗ Node.js not found
npm --version 2>nul && echo ✓ npm installed || echo ✗ npm not found

echo.
echo [Project Files]
if exist "app.py" (echo ✓ Flask app found) else (echo ✗ Flask app not found)
if exist "package.json" (echo ✓ package.json found) else (echo ✗ package.json not found)
if exist "requirements.txt" (echo ✓ requirements.txt found) else (echo ✗ requirements.txt not found)

echo.
echo [Running Processes]
netstat -aon | findstr :3000 >nul && echo ✓ Frontend running on port 3000 || echo ✗ Frontend not running
netstat -aon | findstr :5000 >nul && echo ✓ Backend running on port 5000 || echo ✗ Backend not running

pause