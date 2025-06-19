@echo off
setlocal


set "DEFAULT_TO==+12484442113"


:: ==== CHECK FOR ARGUMENTS ====
if "%~1"=="" (
    echo Usage:
    echo   txt your message here
    echo   txt +15551234567 your message here
    exit /b 1
)

:: ==== CHECK IF FIRST ARG IS A PHONE NUMBER ====
echo %~1 | findstr /R "^+[0-9][0-9]*$" >nul
if %errorlevel%==0 (
    :: First argument is a phone number
    set "TO=%~1"
    shift
) else (
    :: No phone number, use default
    set "TO=%DEFAULT_TO%"
)

:: ==== COMBINE REMAINING ARGS INTO MSG ====
set "MSG=%~1"
shift
:loop
if "%~1"=="" goto done
set "MSG=%MSG% %~1"
shift
goto loop
:done

:: ==== SEND SMS ====
aws sns publish --phone-number "%TO%" --message "%MSG%" ^
--message-attributes "{\"AWS.SNS.SMS.SMSType\":{\"DataType\":\"String\",\"StringValue\":\"Transactional\"}}"

endlocal