;/ Decompiled by Champollion V1.0.1
Source   : DesmondPickPocketWidgetManager.psc
Modified : 2021-12-10 17:16:59
Compiled : 2021-12-10 17:17:05
User     : nirn2
Computer : WORKSTATION
/;
scriptName DesmondPickPocketWidgetManager extends Quest
{This script constantly updates the widget}

;-- Properties --------------------------------------
desmondpickpocketwidgetscript property DPWS auto
spell property EquipHandler auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnInit()

	game.GetPlayer().AddSpell(EquipHandler, true)
	self.RegisterForSingleUpdate(1.00000)
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnUpdate()

	DPWS.updateStatus()
	self.RegisterForSingleUpdate(1.00000)
endFunction
