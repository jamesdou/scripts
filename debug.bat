@echo off
if "%1"=="" (
    echo Usage: debug.bat [flask^|react^|full]
    echo   flask - Debug Flask app with pdb
    echo   react - Start React in debug mode
    echo   full  - Debug both frontend and backend
    pause
    exit /b 1
)

if "%1"=="flask" (
    echo Starting Flask in debug mode...
    if not exist ".venv" (
        echo Virtual environment not found. Run pyinit.bat first.
        pause
        exit /b 1
    )
    call .venv\Scripts\activate.bat
    set FLASK_DEBUG=1
    set FLASK_ENV=development
    python -m pdb app.py
) else if "%1"=="react" (
    echo Starting React in debug mode...
    set BROWSER=none
    npm start
) else if "%1"=="full" (
    echo Starting full-stack debug mode...
    start "Flask Debug" cmd /k "call debug.bat flask"
    start "React Debug" cmd /k "call debug.bat react"
    echo Both servers started in separate windows
)
pause