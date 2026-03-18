@echo off
title Scrcpy Wireless Reseter
color 0A
echo ==========================================
echo        Wireless Scrcpy Reseter
echo ==========================================
echo.
echo Make sure your phone is connected to the PC via USB first!
echo.

echo [*] Clearing previous connections and killing ADB server...
adb disconnect >nul 2>&1
adb kill-server >nul 2>&1
timeout /t 2 >nul

pause
echo.
echo [+] Reset Done...
