@echo off
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5000') do (
  if not %%a==0 (
    echo Killing process on port 5000 with PID %%a
    taskkill /F /PID %%a
  )
)
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :6019') do (
  if not %%a==0 (
    echo Killing process on port 6019 with PID %%a
    taskkill /F /PID %%a
  )
)
