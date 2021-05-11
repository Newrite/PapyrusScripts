Scriptname arcanecursewidgetscript extends SKI_WidgetBase
{This script adds functionality to the Attribute Icon Widget}

;PRIVATE VARIABLES
bool visible = true

;PROPERTIES


Actor Property PlayerRef Auto
{This property contains the player reference}

;FUNCTIONS

Function updateStatus()
	If (Ready)
		int EnchantingSkillAdvance = PlayerRef.GetActorValue("EnchantingSkillAdvance") as Int
		if EnchantingSkillAdvance < 0
			EnchantingSkillAdvance = 0
		endif
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setArcaneFatigueValue", EnchantingSkillAdvance)
	EndIf
EndFunction

String Function GetWidgetSource()
	Return "skyui/arcanecurse.swf"
EndFunction

String Function GetWidgetType()
	Return "arcanecursewidgetscript"
EndFunction
;EVENTS