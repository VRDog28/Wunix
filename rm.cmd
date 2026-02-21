@echo off
setlocal EnableDelayedExpansion
set "WUNIX_DIR=%~dp0"
if /i "%1"=="wunix" (
    net session >nul 2>&1
    if !errorlevel! neq 0 (
        echo Run this as admin: admin rm wunix
        exit /b
    )
    rd /s /q "!WUNIX_DIR!"
    if exist "!WUNIX_DIR!" (
        echo Failed to delete Wunix folder. Make sure no files are in use.
    ) else (
        echo Wunix successfully uninstalled.
    )
    echo Make sure to remove Wunix from SYSTEM PATH
    exit /b
) else (
    if exist "%*" (
        del %*
    ) else (
        echo %* does not exist
    )
)
