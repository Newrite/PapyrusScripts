Scriptname LockPickScript extends SKI_WidgetBase
{This script adds functionality to the Attribute Icon Widget}

;PRIVATE VARIABLES
bool visible = true
float x = 0.00
float y = 0.00

bool defualtVisible = true
float defualtX = 0.0
float defualtY = 0.0
;PROPERTIES


;FUNCTIONS

function SetDefualt()
	visible = defualtVisible
	x = defualtX
	y = defualtY
endFunction

Function updateStatus()
	If (Ready)
		Debug.Notification("updateStatus")
		visible = !visible
		UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", visible)
	EndIf
EndFunction

Function SetArcaneX(float offset)
	x = x + offset
EndFunction

Function SetArcaneY(float offset)
	y = y + offset
EndFunction

Function ChangeVisible()
	visible = !visible
EndFunction

String Function GetWidgetSource()
	Return "skyui/lockpick.swf"
EndFunction

String Function GetWidgetType()
	Return "LockPickScript"
EndFunction
;EVENTS