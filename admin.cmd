@echo off
if /i "%~1"=="" (
    echo Usage: admin ^<Command^>
    exit /b
)
if /i "%~1"=="help" (
    echo Usage: admin ^<Command^>
    exit /b
)
set "tmpfile=%TEMP%\admin_output.txt"
net session >nul 2>&1
if %errorlevel% neq 0 (
    set "cdfile=%TEMP%\cdfile.txt"
    powershell -NoProfile -Command ^
        "$path = Join-Path $env:TEMP 'cdfile.txt'; Set-Content -Path $path -Value (Get-Location).Path -Encoding ASCII"

    powershell -Command ^
        "Start-Process cmd -ArgumentList '/c ""\"%~f0\" %* > \"\"%tmpfile%\"\"""' -Verb RunAs -Wait"
    
    if exist "%tmpfile%" type "%tmpfile%" & del "%tmpfile%"
    exit /b
)
set "file=%TEMP%\cdfile.txt"

if exist "%file%" (
    for /f "usebackq delims=" %%A in ("%file%") do (
        cd /d "%%A" || echo Failed to cd into "%%A"
    )
    del "%file%"
)

%*
