Scriptname DESSXPWidget extends SKI_WidgetBase
{This script adds functionality to the Attribute Icon Widget}

;PRIVATE VARIABLES
bool visible = true
float PosX = 30.0
float PosY = 590.0

float scale = 100.0

float defualtPosX = 30.0
float defualtPosY = 590.0

float defualtScale = 100.0
;PROPERTIES

GlobalVariable Property XPPoints Auto

{This property contains the player reference}

;FUNCTIONS

function SetDefaultPositionX()
	PosX = defualtPosX
endFunction

function SetDefaultPositionY()
	PosY = defualtPosY
endFunction

float function GetDefaultPositionX()
	return defualtPosX
endFunction

float function GetDefaultPositionY()
	return defualtPosY
endFunction

function SetDefaultScale()
	scale = defualtScale
endFunction

float function GetDefaultScale()
	return defualtScale
endFunction

Function updateStatus()
	If (Ready)
		if visible
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setXPText", XPPoints.GetValue() as int)
			UI.SetBool(HUD_MENU, WidgetRoot + "._visible", visible)
			UI.SetFloat(HUD_MENU, WidgetRoot + "._x", PosX)
			UI.SetFloat(HUD_MENU, WidgetRoot + "._y", PosY)
			UI.SetFloat(HUD_MENU, WidgetRoot + "._xscale", scale)
			UI.SetFloat(HUD_MENU, WidgetRoot + "._yscale", scale)
		else
			UI.InvokeBool(HUD_MENU, WidgetRoot + "._visible", visible)
		endif
	EndIf
EndFunction

Function SetPositionX(float newXPos)
	PosX 		 = newXPos
EndFunction

Function SetPositionY(float newYPos)
	PosY 		 = newYPos
EndFunction

Function SetScale(float newScale)
	scale 		 = newScale
EndFunction

float Function GetPositionX()
	return PosX
EndFunction

float Function GetPositionY()
	return PosY
EndFunction

float Function GetScale()
	return scale
EndFunction

Function ChangeVisible()
	visible = !visible
EndFunction

String Function GetWidgetSource()
	Return "skyui/sxpdes.swf"
EndFunction

String Function GetWidgetType()
	Return "DESSXPWidget"
EndFunction
;EVENTS