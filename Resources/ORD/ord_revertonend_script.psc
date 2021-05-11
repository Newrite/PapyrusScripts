Scriptname ORD_RevertOnEnd_Script extends activemagiceffect  

; -----

FormList Property ORD_FormList Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_FormList.Revert()

EndEvent

; -----