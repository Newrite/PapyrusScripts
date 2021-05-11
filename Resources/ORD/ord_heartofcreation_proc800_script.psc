Scriptname ORD_HeartOfCreation_Proc800_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Sound Property ORD_Smh_HeartOfCreation_Marker Auto
Float Property ORD_UpdateDelay Auto
Spell Property ORD_Smh_HeartOfCreation_Spell_Enrage_Proc Auto
Message Property ORD_Smh_HeartOfCreation_Message_Promoted Auto
Keyword Property VendorItemJewelry Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	; bugfix for fetch scripts
	RegisterForSingleUpdate(ORD_UpdateDelay)

EndEvent

; -----

Auto State IsNotListening


EndState

; -----

State IsListening

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If aiItemCount == 1
		If (akBaseItem as Weapon) || ((akBaseItem as Armor) && !akBaseItem.HasKeyword(VendorItemJewelry))
			ORD_Smh_HeartOfCreation_Spell_Enrage_Proc.Cast(PlayerRef)
			ORD_Smh_HeartOfCreation_Marker.Play(PlayerRef)
			ORD_Smh_HeartOfCreation_Message_Promoted.Show()
			GoToState("IsNotListening")
		EndIf
	EndIf

EndEvent

EndState

; -----

Event OnUpdate()

	GoToState("IsListening")

EndEvent

; -----