@echo off
echo Starting Flask development server...
if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat
set FLASK_ENV=development
set FLASK_DEBUG=1
python app.py
pause