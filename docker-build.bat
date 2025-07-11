@echo off
if "%1"=="" (
    echo Usage: docker-build.bat [image-name]
    echo Example: docker-build.bat myapp
    pause
    exit /b 1
)

echo Building Docker image: %1
docker build -t %1 .

if %errorlevel%==0 (
    echo Docker image built successfully!
    echo Run: docker run -p 5000:5000 %1
) else (
    echo Docker build failed!
)
pause