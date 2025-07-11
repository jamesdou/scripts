@echo off
echo Quick development setup...

echo [1/4] Checking environment...
call env-check.bat

echo [2/4] Installing dependencies...
if exist "requirements.txt" call pip-install.bat
if exist "package.json" call npm-install.bat

echo [3/4] Starting services...
start "Backend" cmd /k "call flask-dev.bat"
timeout /t 3 >nul
start "Frontend" cmd /k "call react-dev.bat"

echo [4/4] Opening development tools...
timeout /t 5 >nul
start http://localhost:3000
start http://localhost:5000

echo Quick setup complete!
echo Backend: http://localhost:5000
echo Frontend: http://localhost:3000
pause