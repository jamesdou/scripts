@echo off
echo Formatting Python code...
if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat
echo Running black formatter...
black .
echo Running isort...
isort .
echo Code formatting complete!
pause