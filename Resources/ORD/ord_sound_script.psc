Scriptname ORD_Sound_Script extends activemagiceffect  

; -----

Sound Property ORD_Sound Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Sound.Play(akTarget)

EndEvent

; -----