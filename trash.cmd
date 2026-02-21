@echo off
setlocal
if "%~1"=="" (
    echo Usage: trash ^<file_or_folder^>
    exit /b
)
if not exist "%~1" (
    echo File or folder not found.
    exit /b
)
powershell -NoProfile -Command "Add-Type -AssemblyName Microsoft.VisualBasic; if (Test-Path -LiteralPath '%~f1' -PathType Container) { [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory('%~f1','OnlyErrorDialogs','SendToRecycleBin') } else { [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile('%~f1','OnlyErrorDialogs','SendToRecycleBin') }"
echo Sent to Recycle Bin: %~1
