@echo off
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :3000') do (
  if not %%a==0 (
    echo Killing process on port 3000 with PID %%a
    taskkill /F /PID %%a
  )
)
