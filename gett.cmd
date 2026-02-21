@echo off
setlocal

if "%~1"=="" (
    echo Usage: gett ^<package^>
    exit /b
)

set "PACKAGE=%~1"

set "LIB=%~dp0Assets\gett_library.txt"

if not exist "%LIB%" (
    echo Package database missing.
    exit /b
)

set "URL="
set "TYPE="

:: Repository lookup (package URL + type)
for /f "tokens=1,2,3 delims= " %%A in (%LIB%) do (
    if /i "%%A"=="%PACKAGE%" (
        set "URL=%%B"
        set "TYPE=%%C"
    )
)

if "%URL%"=="" (
    echo Package URL missing.
    exit /b
)

echo Installing %PACKAGE%...

:: Extract filename
for %%F in ("%URL%") do set "FILENAME=%%~nxF"

:: Pipeline directories
set "INSTALL_DIR=%~dp0Packages\%PACKAGE%"
set "DOWNLOAD_TMP=%INSTALL_DIR%\gett_download.tmp"

set "DOWNLOAD_FINAL=%USERPROFILE%\Downloads\%FILENAME%"

if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

:: Download into staging tmp file
curl -L -s "%URL%" -o "%DOWNLOAD_TMP%"

if not exist "%DOWNLOAD_TMP%" (
    echo Download failed.
    exit /b
)

:: Move executable to Downloads folder
move /Y "%DOWNLOAD_TMP%" "%DOWNLOAD_FINAL%" >nul

:: Cleanup package staging folder
rd /s /q "%INSTALL_DIR%" 2>nul

echo Package %PACKAGE% installed successfully.

if /i "%TYPE%"=="installer" (
    start "" "%DOWNLOAD_FINAL%"
)

endlocal