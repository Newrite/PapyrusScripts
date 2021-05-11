Scriptname ORD_FuelTheInferno_Refund_Script extends activemagiceffect

; -----

Message Property ORD_Smh_FuelTheInferno_Message_Refund Auto
Actor Property PlayerRef Auto

; -----

Bool RemoveSoul = false

; -----

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	RemoveSoul = true

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If RemoveSoul
		PlayerRef.ModAV("DragonSouls", -1)
	Else
		ORD_Smh_FuelTheInferno_Message_Refund.Show()
	EndIf

EndEvent

; -----