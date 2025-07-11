@echo off
if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat

if "%1"=="" (
    echo Running database migration...
    flask db upgrade
) else (
    echo Creating migration: %1
    flask db migrate -m "%1"
    echo Migration created. Run 'db-migrate' to apply it.
)
pause