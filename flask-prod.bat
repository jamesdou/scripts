@echo off
echo Starting Flask production server...
if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat
set FLASK_ENV=production
set FLASK_DEBUG=0
python -m gunicorn --bind 0.0.0.0:5000 app:app
pause