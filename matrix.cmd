@echo off
setlocal EnableDelayedExpansion
color 0A
mode 100,30
cls
:loop
set "line="
for /L %%A in (1,1,100) do (
    set /a rand=!random! %% 6
    if !rand! equ 0 (
        set "line=!line!0"
    ) else if !rand! equ 1  (
        set "line=!line!1"
    ) else (
        set "line=!line! "
    )
)
echo !line!
goto loop
