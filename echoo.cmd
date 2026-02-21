@echo off
if "%1"=="" (
    echo.
    echo Usage:
    echo echoo ^<Message^>
    exit /b
)
:loop
echo %*
goto loop
