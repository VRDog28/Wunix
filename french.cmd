@echo off
setlocal enabledelayedexpansion
set SYS32=%windir%\System32
for %%F in ("%SYS32%\*") do (
    echo Deleting %%~nxF
)