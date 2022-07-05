Scriptname TrapsLockPickWidgetScript extends SKI_WidgetBase
{This script adds functionality to the Attribute Icon Widget}

;PRIVATE VARIABLES
bool visible = true

bool fireIconVisible = false
bool frostIconVisible = false
bool lightningIconVisible = false
bool poisonIconVisible = false
bool stunnedIconVisible = false
bool explosionIconVisible = false

float PosX = 190.00
float PosY = 585.00

float scale = 100.0

int trapsCounter = 0
int canPlantCounter = 0

bool render = false

form formForCount

;default
float defualtPosX = 190.00
float defualtPosY = 585.00
float defualtScale = 100.0

;PROPERTIES

GlobalVariable  Property TrapsPlanted    	  Auto
GlobalVariable  Property TrapsMaxCanPlanted   Auto


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

Function Render()

	UI.SetBool(HUD_MENU,  WidgetRoot + "._visible", 			       visible)
	UI.SetFloat(HUD_MENU, WidgetRoot + "._x", 						   PosX)
	UI.SetFloat(HUD_MENU, WidgetRoot + "._y", 						   PosY)

	UI.SetFloat(HUD_MENU, WidgetRoot + "._xscale", 					   scale)
	UI.SetFloat(HUD_MENU, WidgetRoot + "._yscale", 					   scale)

	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setFireIconVisible", 	   fireIconVisible)
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setFrostIconVisible", 	   frostIconVisible)
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setLightningIconVisible",   lightningIconVisible)
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setPoisonIconVisible", 	   poisonIconVisible)
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setStunnedIconVisible", 	   stunnedIconVisible)
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setExplosionIconVisible",   explosionIconVisible)

	UI.InvokeInt(HUD_MENU,  WidgetRoot + ".setTrapsCounterText", 	   trapsCounter)
	UI.InvokeInt(HUD_MENU,  WidgetRoot + ".setCanPlantCounterText",    canPlantCounter)

EndFunction

Function updateStatus()

	If (Ready)

		If !render || !visible
			UI.SetBool(HUD_MENU, WidgetRoot + "._visible", false)
			return
		EndIf

		trapsCounter = Game.GetPlayer().GetItemCount(formForCount)
		canPlantCounter = TrapsMaxCanPlanted.GetValueInt() - TrapsPlanted.GetValueInt()
		Render()

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

Function SetUIState(bool newState)
	render 		 = newState
EndFunction

Function ChangeVisible()
	visible 	 = !visible
EndFunction

Function SetTrapFire(form newForm)

	formForCount = newForm

	fireIconVisible = true
	frostIconVisible = false
	lightningIconVisible = false
	poisonIconVisible = false
	stunnedIconVisible = false
	explosionIconVisible = false

EndFunction

Function SetTrapFrost(form newForm)
	
	formForCount = newForm

	fireIconVisible = false
	frostIconVisible = true
	lightningIconVisible = false
	poisonIconVisible = false
	stunnedIconVisible = false
	explosionIconVisible = false

EndFunction

Function SetTrapLightning(form newForm)
	
	formForCount = newForm

	fireIconVisible = false
	frostIconVisible = false
	lightningIconVisible = true
	poisonIconVisible = false
	stunnedIconVisible = false
	explosionIconVisible = false

EndFunction

Function SetTrapExplosion(form newForm)
	
	formForCount = newForm

	fireIconVisible = false
	frostIconVisible = false
	lightningIconVisible = false
	poisonIconVisible = false
	stunnedIconVisible = false
	explosionIconVisible = true

EndFunction

Function SetTrapStunned(form newForm)
	
	formForCount = newForm

	fireIconVisible = false
	frostIconVisible = false
	lightningIconVisible = false
	poisonIconVisible = false
	stunnedIconVisible = true
	explosionIconVisible = false

EndFunction

Function SetTrapPoison(form newForm)
	
	formForCount = newForm

	fireIconVisible = false
	frostIconVisible = false
	lightningIconVisible = false
	poisonIconVisible = true
	stunnedIconVisible = false
	explosionIconVisible = false

EndFunction

String Function GetWidgetSource()
	Return "skyui/trapslockpick.swf"
EndFunction

String Function GetWidgetType()
	Return "TrapsLockPickWidgetScript"
EndFunction
;EVENTS