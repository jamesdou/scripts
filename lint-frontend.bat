@echo off
echo Running frontend linting...
npm run lint
if %errorlevel%==0 (
    echo Linting passed!
) else (
    echo Linting failed. Run 'npm run lint -- --fix' to auto-fix issues.
)
pause