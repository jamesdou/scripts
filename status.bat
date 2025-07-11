@echo off
cls
echo ========================================
echo       DEVELOPMENT STATUS
echo ========================================

echo.
echo [GIT STATUS]
git status --porcelain 2>nul | findstr /v "^$" && echo Changes detected || echo Working tree clean
git log --oneline -1 2>nul

echo.
echo [SERVICES]
netstat -aon | findstr :3000 >nul && echo ✓ Frontend (3000) RUNNING || echo ✗ Frontend (3000) STOPPED
netstat -aon | findstr :5000 >nul && echo ✓ Backend (5000) RUNNING || echo ✗ Backend (5000) STOPPED
netstat -aon | findstr :6379 >nul && echo ✓ Redis (6379) RUNNING || echo ✗ Redis (6379) STOPPED

echo.
echo [LAST TESTS]
if exist ".pytest_cache" (
    echo ✓ Backend tests available
) else (
    echo - No backend test cache
)
if exist "coverage" (
    echo ✓ Test coverage reports available
) else (
    echo - No test coverage data
)

echo.
echo [PROJECT HEALTH]
if exist "requirements.txt" (echo ✓ Python dependencies) else (echo ✗ Missing requirements.txt)
if exist "package.json" (echo ✓ Node dependencies) else (echo ✗ Missing package.json)
if exist ".venv" (echo ✓ Virtual environment) else (echo ✗ Missing virtual environment)

echo.
pause