@echo off
echo Starting React development server...
if not exist "node_modules" (
    echo Node modules not found. Running npm install...
    npm install
)
npm start
pause