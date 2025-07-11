@echo off
if "%1"=="" (
    echo Usage: docker-run.bat [image-name] [optional-port]
    echo Example: docker-run.bat myapp 8080
    pause
    exit /b 1
)

set PORT=5000
if not "%2"=="" set PORT=%2

echo Running Docker container: %1 on port %PORT%
docker run -p %PORT%:5000 --rm %1
pause