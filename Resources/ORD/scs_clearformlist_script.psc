Scriptname SCS_ClearFormlist_Script extends activemagiceffect  

; -----

FormList Property ORD_FormList Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_FormList.Revert()

EndEvent

; -----