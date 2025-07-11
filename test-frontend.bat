@echo off
echo Running frontend tests...
if "%1"=="watch" (
    npm test
) else (
    npm test -- --coverage --watchAll=false
)
pause