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
powershell clear-tpm
echo.
powershell Disable-TpmAutoProvisioning
echo.
exit