@echo off
echo WARNING: This will delete all data in the database!
set /p confirm="Are you sure? (y/N): "
if /i not "%confirm%"=="y" (
    echo Cancelled.
    pause
    exit /b 0
)

if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat
python -c "
from app import app, db
with app.app_context():
    db.drop_all()
    db.create_all()
    print('Database reset successfully!')
"
pause