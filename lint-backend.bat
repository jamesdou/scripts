@echo off
echo Running Python linting...
if not exist ".venv" (
    echo Virtual environment not found. Run pyinit.bat first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat
echo Running flake8...
flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
echo Running black formatter...
black . --check
echo Running isort...
isort . --check-only
pause