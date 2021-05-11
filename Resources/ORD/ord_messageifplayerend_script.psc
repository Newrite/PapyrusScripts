Scriptname ORD_MessageIfPlayerEnd_Script extends activemagiceffect  

; -----

Message Property ORD_Message Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akTarget == PlayerRef
		ORD_Message.Show()
	EndIf

EndEvent

; -----