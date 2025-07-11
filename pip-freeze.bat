@echo off
if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat
echo Updating requirements.txt...
pip freeze > requirements.txt
echo Requirements updated successfully!
pause