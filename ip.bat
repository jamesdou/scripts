@echo off
cls
echo =============================
echo       Your IPv4 Address
echo =============================
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R "IPv4"') do (
    echo IPv4 Address:%%A
)

echo.
echo =============================
echo         Hostname
echo =============================
hostname

echo.
echo Press C to continue, or X to exit...

choice /c CX /n /m "Choice (C=Continue, X=Exit): "

if errorlevel 2 (
    echo Exiting...
    timeout /t 1 >nul
    exit /b
)

:: Continue with detailed info
cls
echo =============================
echo     System Information
echo =============================
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"System Boot Time"

echo.
echo =============================
echo       Network Interfaces
echo =============================
ipconfig /all | findstr /C:"Description" /C:"Physical Address" /C:"IPv4"

echo.
echo =============================
echo         Uptime
echo =============================
net stats workstation | find "since"

echo.
echo =============================
echo      Active Network Routes
echo =============================
route print

echo.
echo =============================
echo      Open TCP Connections
echo =============================
netstat -an | findstr /C:"TCP"

echo.
echo =============================
echo      Currently Logged Users
echo =============================
query user

paus
