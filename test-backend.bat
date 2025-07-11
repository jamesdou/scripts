@echo off
echo Running backend tests...
if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat
if "%1"=="" (
    python -m pytest -v
) else (
    python -m pytest -v %1
)
pause