Scriptname ORD_SkullCrack_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.InterruptCast()

EndEvent

; -----