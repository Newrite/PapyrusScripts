Scriptname ORD_Alert_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.SetAlert(true)

EndEvent

; -----