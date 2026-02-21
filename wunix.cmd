@echo off
setlocal enabledelayedexpansion
set "COLOR=07"
if /i "%1"=="SetStyle" (
    <nul set /p="%~2" > "%~dp0style.txt"
)
if /i "%~1"=="help" (
    echo.
    echo Available commands:
    echo -------------------------------
    for %%F in ("%~dp0*.cmd" "%~dp0*.exe") do (
        echo %%~nF
    )
    exit /b
)
if /i "%~1"=="?" (
   if not "%2"=="" (
        if exist "%~dp0%2.cmd" (
            echo %2 is a wunix command
            exit /b
        ) else if exist "%~dp0%2" (
            echo %2 is a wunix command
            exit /b
        ) else if exist "%~dp0%2.exe" (
            echo %2 is a wunix command
            exit /b
        ) else (
            echo %2 is not a wunix command
            exit /b
        )
   )
)
if /i "%1"=="list" (
    echo.
    echo Available commands:
    echo -------------------------------
    for %%F in ("%~dp0*.cmd" "%~dp0*.exe") do (
        echo %%~nF
    )
    exit /b
)
if /i "%1"=="count" (
    set c=0
    for %%F in ("%~dp0*.cmd" "%~dp0*.exe") do set /a c+=1
    echo !c!
    exit /b
)
if /i "%~1"=="test" goto TEST
:start
set /p STYLE=<"%~dp0style.txt"
if exist "%~dp0Styles\%STYLE%.wstyle" (
    type "%~dp0Styles\%STYLE%.wstyle"
)
echo.
echo ===================================================
echo       Wunix - Portable Linux-Like Subsystem
echo ===================================================
echo.
echo User:        %USERNAME%
echo Computer:    %COMPUTERNAME%
echo OS:          %OS%
echo Processor:   %PROCESSOR_IDENTIFIER%
echo Architecture:%PROCESSOR_ARCHITECTURE%
echo.
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R /C:"IPv4 Address"') do echo IP Address: %%A
echo.
echo Wunix Version: 1.0.0 (Portable)
echo ===================================================
:end
exit /b
:TEST

if "%~2"=="" (
    echo Usage: wunix test ^<command^>
    exit /b
)

set "CMDTEST=%~2"

echo Testing %CMDTEST% command...

cmd /c "%CMDTEST%" >nul 2>&1

if errorlevel 1 (
    echo %CMDTEST% FAILED
    echo FAILED to run %CMDTEST% without any arguments
) else (
    echo %CMDTEST% OK
)
cmd /c "%CMDTEST% arg1 arg2 arg3" >nul 2>&1

if errorlevel 1 (
    echo %CMDTEST% FAILED
    echo FAILED to run %CMDTEST% with arguments arg1 arg2 arg3
) else (
    echo %CMDTEST% OK
)
cmd /c "%CMDTEST% ?hi hel*lo" >nul 2>&1

if errorlevel 1 (
    echo %CMDTEST% FAILED
    echo FAILED to run %CMDTEST% with arguments ?hi hel*lo
) else (
    echo %CMDTEST% OK
)

endlocal