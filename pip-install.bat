@echo off
if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat

if "%1"=="" (
    echo Installing from requirements.txt...
    pip install -r requirements.txt
) else (
    echo Installing %*...
    pip install %*
    echo Updating requirements.txt...
    pip freeze > requirements.txt
)
pause