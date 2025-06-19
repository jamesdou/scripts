@echo off
echo Listing processes using port 3000...
netstat -aon | findstr :3000
pause
