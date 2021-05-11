Scriptname ORD_TheBox_Script extends activemagiceffect  

; -----

Race Property InvisibleRace Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

;	akTarget.SetAlpha(0.01)
	akTarget.SetRace(InvisibleRace)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

;	akTarget.SetAlpha(1.0)

EndEvent

; -----