@echo off
if "%1"=="" (
    echo Usage: git-deploy.bat "commit message"
    echo Example: git-deploy.bat "Deploy v1.2.3"
    pause
    exit /b 1
)

echo Preparing deployment commit...
call deploy-prep.bat

echo Adding files to git...
git add .

echo Committing changes...
git commit -m "%1"

echo Pushing to repository...
git push origin main

echo Deployment pushed successfully!
pause