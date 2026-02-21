@echo off
setlocal
if "%~1"=="" goto :usage
if "%~2"=="" goto :usage
if "%~3"=="" goto :usage
set "action=%~1"
set "orig=%~2"
set "shortcut=%~3.cmd"
set "scriptFolder=%~dp0"
set "shortcutPath=%scriptFolder%%shortcut%"
if /i "%action%"=="remove" (
    if exist "%shortcutPath%" (
        del "%shortcutPath%"
        echo Alias "%~3" removed.
    ) else (
        echo Alias "%~3" does not exist.
    )
    exit /b
)
if /i "%action%"=="set" (
    if exist "%shortcutPath%" (
        echo Alias "%~3" already exists!
        exit /b
    )

    (
        echo @echo off
        echo %orig% %%*
    ) > "%shortcutPath%"

    echo Alias "%~3" created for "%orig%".
    exit /b
)
:usage
echo Usage:
echo alias set ^<OriginalCommand^> ^<ShortcutName^>
echo alias remove ^<OriginalCommand^> ^<ShortcutName^>
exit /b
