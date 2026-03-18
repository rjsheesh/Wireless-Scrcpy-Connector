Dim objShell, ip
Set objShell = CreateObject("Wscript.Shell")

' Reminder to connect USB first
MsgBox "Make sure your phone is connected to the PC via USB first!", 64, "Scrcpy Wireless Connector"

' Get IP Address via pop-up box
ip = InputBox("Enter your phone's WiFi IP Address (e.g., 192.168.0.100):", "WiFi IP Address")

' If canceled or left blank, the script will close
If ip = "" Then
    WScript.Quit
End If

' Disconnect all previous connections and kill ADB server to refresh
objShell.Run "cmd /c adb disconnect", 0, True
objShell.Run "cmd /c adb kill-server", 0, True

' Wait 2 seconds for the server to fully shut down
WScript.Sleep 2000

' Enable TCP/IP port 5555 (hidden mode) - this will also auto-start the fresh server
objShell.Run "cmd /c adb tcpip 5555", 0, True

' Wait 3 seconds (3000 milliseconds)
WScript.Sleep 3000

' Connect to IP (hidden mode)
objShell.Run "cmd /c adb connect " & ip & ":5555", 0, True

' Wait 2 seconds
WScript.Sleep 2000

' Connection complete message and instruction to unplug USB
MsgBox "Connection request sent!" & vbCrLf & "(If any Allow/Permission prompts appear on your phone screen, just tap OK)" & vbCrLf & vbCrLf & "You can unplug the USB cable now (or leave it plugged in)." & vbCrLf & vbCrLf & "Press OK to start Scrcpy.", 64, "Connection Success"

' Start Scrcpy pointing directly to the Wi-Fi IP so it doesn't get confused by USB
objShell.Run "cmd /c scrcpy -s " & ip & ":5555", 0, False