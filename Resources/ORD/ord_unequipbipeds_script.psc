Scriptname ORD_UnequipBipeds_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.UnequipItemSlot(30)	;helms
	akTarget.UnequipItemSlot(42)				;circlets

EndEvent

; -----