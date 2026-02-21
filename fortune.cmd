@echo off
setlocal EnableDelayedExpansion
set "FORTUNE_FILE=%~dp0Assets\fortunes.txt"
if not exist "%FORTUNE_FILE%" (
    echo Fortune file not found.
    exit /b
)
set "skin=%3"
if "%3"=="" set "skin=cow"
set /a COUNT=0
for /f "usebackq delims=" %%A in ("%FORTUNE_FILE%") do (
    set /a COUNT+=1
)
if %COUNT% EQU 0 (
    echo No fortunes found.
    exit /b
)
set /a RAND=%random% %% COUNT + 1
set /a LINE_NUM=0
for /f "usebackq delims=" %%A in ("%FORTUNE_FILE%") do (
    set /a LINE_NUM+=1
    if !LINE_NUM! EQU %RAND% (
        set "fortune=%%A"
        goto :found
    )
)
:found
if "%1"=="\" (
    if "%2"=="cowsay" (
        call cowsay %skin% !fortune! 
    )
) else (
    echo !fortune!
)

endlocal