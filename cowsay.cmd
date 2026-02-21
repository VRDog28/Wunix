@echo off
setlocal EnableDelayedExpansion
if "%1"=="list" goto list
if "%1"=="help" goto help
set "after1="
set /a count=0
for %%A in (%*) do (
    set /a count+=1
    if !count! gtr 1 (
        if "!after1!"=="" (
            set "after1=%%A"
        ) else (
            set "after1=!after1! %%A"
        )
    )
)
set "msg=!after1!"
if "%msg%"=="" set "msg=moo"
set "skin=%1"
if "%skin%"=="" (
    set "skin=cow"
)
if "%2"=="" (
    set "skin=cow"
    set "msg=%*"
)
set "tmp=%msg%"
set /a len=0
:lenloop
if defined tmp (
    set "tmp=!tmp:~1!"
    set /a len+=1
    goto lenloop
)
set /a width=len+2
set "top= "
set "bottom= "
for /L %%A in (1,1,%width%) do (
    set "top=!top!_"
    set "bottom=!bottom!-"
)


if not exist "%~dp0Styles\%skin%.moo" (
    echo.
    echo %skin% is not a valid skin
    exit /b
)

echo.
echo !top!
echo ^< !msg! ^>
echo !bottom!

type "%~dp0Styles\%skin%.moo"

echo.
endlocal
exit /b
:list
echo.
echo Available cows:
echo -------------------------------
for %%F in ("%~dp0Styles\*.moo") do (
    echo %%~nF
)
exit /b
:help
echo Usage:
echo Cowsay ^<skin^> ^<message^>
exit /b