Scriptname MRL_SXPWidget extends SKI_WidgetBase
{This script adds functionality to the Attribute Icon Widget}

bool Property Visible = true Auto

float Property PosX = 110.0 Auto
float Property PosY = 685.0 Auto
float Property Scale = 100.0 Auto

float Property DefaultPosX = 110.0 Auto
float Property DefaultPosY = 685.0 Auto
float Property DefaultScale = 100.0 Auto

GlobalVariable Property XPPoints Auto

function SetDefaultPositionX()
	PosX = DefaultPosX
endFunction

function SetDefaultPositionY()
	PosY = DefaultPosY
endFunction

function SetDefaultScale()
	Scale = DefaultScale
endFunction

Function Render()
	If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setXPCountText", XPPoints.GetValue() as int)
			UI.SetBool(HUD_MENU, WidgetRoot + "._visible", Visible)
			UI.SetFloat(HUD_MENU, WidgetRoot + "._x", PosX)
			UI.SetFloat(HUD_MENU, WidgetRoot + "._y", PosY)
			UI.SetFloat(HUD_MENU, WidgetRoot + "._xscale", Scale)
			UI.SetFloat(HUD_MENU, WidgetRoot + "._yscale", Scale)
	EndIf
EndFunction

String Function GetWidgetSource()
	Return "skyui/mrlsxp.swf"
EndFunction

String Function GetWidgetType()
	Return "MRL_SXPWidget"
EndFunction