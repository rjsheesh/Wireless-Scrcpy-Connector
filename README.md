# 📱 Auto Wireless Scrcpy Connector

A simple, automated script to connect your Android device to your PC wirelessly using [Scrcpy](https://github.com/Genymobile/scrcpy), without the hassle of manually finding and typing IP addresses!

## 📥 Prerequisites

Before using these scripts, you need to have the official Scrcpy files on your PC.
1. Download the latest version of Scrcpy from the official release page:
   **[Download Scrcpy Official Releases](https://github.com/Genymobile/scrcpy/releases)**
2. Extract the downloaded `.zip` file into a folder.
3. Place the scripts from this repository into that same extracted Scrcpy folder.

## 🚀 Features

* **Auto IP Detection:** Automatically finds your phone's Wi-Fi IP address.
* **One-Click Start:** Connects to TCP/IP port 5555 and starts screen mirroring instantly.
* **Auto Reset:** Kills stuck ADB servers and clears old connections with a single click.
* **No Console Clutter:** The `.vbs` version runs everything silently in the background!

## 🛠️ How to Use

1. **Connect your phone to the PC via USB cable** (Required only for the initial connection setup).
2. Ensure both your PC and phone are connected to the **same Wi-Fi network**.
3. Run one of the following scripts based on your need:

### 🟢 1. `scrcpy-console_wireless_start.bat` (Recommended)
Run this file to automatically detect your phone's IP, connect via ADB, and launch Scrcpy. Once the connection is established, you can safely unplug the USB cable!

### 🧹 2. `scrcpy-console_wireless_reset.bat` (Troubleshooting)
If Scrcpy refuses to connect, hangs, or shows ADB errors, run this file. It will safely disconnect previous sessions and kill the ADB server to give you a fresh start.

### 🤫 3. `scrcpy-console_wireless.vbs` (Silent Mode)
Does the exact same thing as the start file, but uses popup windows instead of the black CMD screen. Perfect for a cleaner look!

## ⚠️ Note
* Make sure **USB Debugging** is enabled in your Android phone's Developer Options.
* If a popup appears on your phone asking to "Allow USB debugging", check "Always allow from this computer" and tap **OK**.

---
**Developed by:** fabiTECH
