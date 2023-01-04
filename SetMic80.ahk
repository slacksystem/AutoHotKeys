#NoEnv			;Recommended for performance and compatibility with future AutoHotkey releases.
#Warn			;Recommended for catching common errors.
SendMode Input	;Recommended for new scripts due to its superior speed and reliability.

DesiredLevel := 100.0
DeviceNumber1 := 6
DeviceNumber2 := 6


#Persistent
#SingleInstance force
SetFormat, float, 0.1
SoundGet, CurVol,,Vol,DeviceNumber
Menu, Tray, Icon, ddores.dll, 7
TrayTip, SetMic100-
SetTimer, SetMic, 30
return

SetMic:

	SoundGet, CurVol,,Vol,DeviceNumber
	if ErrorLevel 
		MsgBox,48,ForceMicLevel,%ErrorLevel%
	else if ("v" CurVol != "v" DesiredLevel)
	{
		SoundSet, DesiredLevel,,Vol,DeviceNumber1
		SoundSet, DesiredLevel,,Vol,DeviceNumber2
		if ErrorLevel 
				MsgBox,48,ForceMicLevel,%ErrorLevel%
	}
return