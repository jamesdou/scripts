@echo off
echo Listing processes using ports 3000, 5000, and 6019...
for %%p in (3000 5000 6019) do (
  echo ----------------------
  echo Port %%p:
  netstat -aon | findstr :%%p
)
pause
