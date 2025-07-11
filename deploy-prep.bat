@echo off
echo Preparing for deployment...

echo [1/5] Running backend tests...
call test-backend.bat

echo [2/5] Running frontend tests...
call test-frontend.bat

echo [3/5] Linting backend...
call lint-backend.bat

echo [4/5] Building frontend...
call react-build.bat

echo [5/5] Generating requirements.txt...
call pip-freeze.bat

echo Deployment preparation complete!
echo Check all tests passed before deploying.
pause