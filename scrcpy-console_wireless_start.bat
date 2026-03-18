@echo off
title Scrcpy Wireless Connector (Auto IP)
color 0A
echo ==========================================
echo        Wireless Scrcpy Connector
echo ==========================================
echo.
echo Make sure your phone is connected to the PC via USB first!

echo.
echo [*] Searching for phone's Wi-Fi IP address...
set "ip="

:: Fixing the CMD IP extraction error
for /f "tokens=2 delims= " %%A in ('adb shell ip addr show wlan0 ^| find "inet "') do (
    for /f "tokens=1 delims=/" %%B in ("%%A") do set "ip=%%B"
)

if "%ip%"=="" (
    echo [!] Could not find IP automatically. Make sure Wi-Fi is on.
    set /p ip="Please enter your phone's Wi-Fi IP manually: "
) else (
    echo [+] Auto-detected IP: %ip%
)

echo.
echo [+] Enabling TCP/IP port 5555...
adb tcpip 5555
timeout /t 3 >nul

echo.
echo [+] Connecting to %ip%...
adb connect %ip%:5555
timeout /t 2 >nul

echo.
echo [!] Connection request sent!
echo (If any Allow/Permission prompts appear on your phone screen, just tap OK)
echo.
echo You can unplug the USB cable now (or leave it plugged in, no problem!).
pause
echo.
echo [+] Starting Scrcpy...
:: Forcing Scrcpy to use the Wi-Fi IP so it doesn't get confused by the USB
scrcpy -s %ip%:5555