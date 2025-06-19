@echo off
if "%1"=="" (
  echo Usage: %0 [port]
  echo Example: %0 3000
  exit /b
)

echo Listing processes using port %1...
netstat -aon | findstr :%1
pause
