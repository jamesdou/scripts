@echo off
echo Updating all npm packages...
npm update
npm audit fix
echo Package update complete!
pause