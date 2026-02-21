@echo off
setlocal
if "%~1"=="" (
    echo Usage:
    echo clipboard [view] ^<command^>
    exit /b
)
set "TMPFILE=%TEMP%\wunix_clipboard.tmp"
set "MODE=copy"
set "ARGS=%*" 
echo %ARGS% | findstr /b /i "view " >nul
if %errorlevel%==0 (
    set "MODE=view"
    set "ARGS=%ARGS:~5%"
)
if /i "%MODE%"=="copy" (
    set "ARGS=%*"
)
cmd /c %ARGS% > "%TMPFILE%" 2>&1
if not exist "%TMPFILE%" exit /b
for %%F in ("%TMPFILE%") do if %%~zF==0 (
    del "%TMPFILE%"
    echo Command returned empty output.
    exit /b
)
powershell -command "Get-Content '%TMPFILE%' | Set-Clipboard"
if /i "%MODE%"=="view" (
    type "%TMPFILE%"
)
del "%TMPFILE%"
echo.
echo.
echo Copied output to clipboard.
endlocal