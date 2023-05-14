#NoEnv			;Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn			;Recommended for catching common errors.
#SingleInstance force
SendMode Input	;Recommended for new scripts due to its superior speed and reliability.

#Include, VA.ahk


DesiredLevel1 := 93.0
DesiredLevel2 := 74.0
DeviceNumber1 := 13
DeviceNumber2 := 11


#Persistent
#SingleInstance force
SetFormat, float, 0.1
Menu, Tray, Icon, ddores.dll, 7
TrayTip, SetMic100
Gosub,  SetMic
SetTimer, SetMic, 15000
return

SetMic:
    SoundSet, DesiredLevel1,,Vol,DeviceNumber1
    SoundSet, 0,,MUTE,DeviceNumber1
    SoundSet, DesiredLevel2,,Vol,DeviceNumber2
    SoundSet, 0,,MUTE,DeviceNumber2
    ; if ErrorLevel 
    ;     MsgBox,48,ForceMicLevel,%ErrorLevel%
    VA_SetMasterVolume("Logitech PRO X Wireless Gaming Headset", DesiredLevel1)
    if ErrorLevel
        MsgBox % "Error Setting Logitech PRO X volume: %Errorlevel%"
    VA_SetMasterVolume("Virtual Desktop Audio", DesiredLevel2)
    if ErrorLevel
        MsgBox % "Error Setting Virtual Desktop Audio volume: %Errorlevel%"
return
