@echo off
echo Seeding database with sample data...
if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat
if exist "seed.py" (
    python seed.py
) else (
    echo seed.py not found. Create a seed.py file with sample data.
)
pause