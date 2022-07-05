;/ Decompiled by Champollion V1.0.1
Source   : DesmondPickPocketWidgetManagerEffect.psc
Modified : 2021-12-11 01:10:58
Compiled : 2021-12-11 01:11:02
User     : nirn2
Computer : WORKSTATION
/;
scriptName DesmondPickPocketWidgetManagerEffect extends ActiveMagicEffect
{This script constantly updates the widget}

;-- Properties --------------------------------------
desmondpickpocketwidgetscript property DPWS auto
keyword property Powder auto
keyword property Bottle auto
formlist property ThrowItems auto
keyword property ThrowDagger auto
formlist property ThrowItemBags auto

;-- Variables ---------------------------------------
actor Player

;-- Functions ---------------------------------------

function OnEffectStart(actor akTarget, actor akCaster)

	Player = akTarget
	self.UpdateThrows()
endFunction

function OnObjectUnequipped(form akBaseObject, ObjectReference akReference)

	if akBaseObject as armor
		self.UpdateThrows()
	endIf
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function UpdateThrows()

	Int i = 0
	Int size = ThrowItemBags.GetSize()
	while i < size
		if Player.IsEquipped(ThrowItemBags.GetAt(i))
			if Player.WornHasKeyword(ThrowDagger)
				DPWS.SetFormCount(ThrowItems.GetAt(i))
				DPWS.SetUIState(true)
				DPWS.SetDaggers()
				return 
			endIf
			if Player.WornHasKeyword(Bottle)
				DPWS.SetFormCount(ThrowItems.GetAt(i))
				DPWS.SetUIState(true)
				DPWS.SetBottles()
				return 
			endIf
			if Player.WornHasKeyword(Powder)
				DPWS.SetFormCount(ThrowItems.GetAt(i))
				DPWS.SetUIState(true)
				DPWS.SetPowders()
				return 
			endIf
		endIf
		i += 1
	endWhile
	DPWS.SetUIState(false)
endFunction

function OnObjectEquipped(form akBaseObject, ObjectReference akReference)

	if akBaseObject as armor
		utility.WaitMenuMode(1.00000)
		self.UpdateThrows()
	endIf
endFunction
