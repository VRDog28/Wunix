@echo off
setlocal EnableDelayedExpansion
for %%A in ("%cd%") do set "folderName=%%~nxA"
for /f %%A in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "timestamp=%%A"
set "zipName=%folderName%_!timestamp!.zip"
set "parentDir=%cd%\.."
echo Creating backup: !zipName!
echo.
powershell -NoProfile -Command ^
"Compress-Archive -Path '%cd%\*' -DestinationPath '%parentDir%\!zipName!' -Force"
if exist "%parentDir%\!zipName!" (
    echo Backup created successfully:
    echo %parentDir%\!zipName!
) else (
    echo Backup failed.
)
endlocal
