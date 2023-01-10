#NoEnv			;Recommended for performance and compatibility with future AutoHotkey releases.
#Warn			;Recommended for catching common errors.
SendMode Input	;Recommended for new scripts due to its superior speed and reliability.

DesiredLevel1 := 100.0
DesiredLevel2 := 75.0
DeviceNumber1 := 12
DeviceNumber2 := 11


#Persistent
#SingleInstance force
SetFormat, float, 0.1
Menu, Tray, Icon, ddores.dll, 7
TrayTip, SetMic100
SetTimer, SetMic, 15000
return

SetMic:
    SoundSet, DesiredLevel1,,Vol,DeviceNumber1
    SoundSet, DesiredLevel2,,Vol,DeviceNumber2
    if ErrorLevel 
        MsgBox,48,ForceMicLevel,%ErrorLevel%
return