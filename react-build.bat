@echo off
echo Building React for production...
npm run build
if %errorlevel%==0 (
    echo Build completed successfully!
    echo Build files are in the 'build' directory
) else (
    echo Build failed!
)
pause