Scriptname ORD_CartMode_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Game.SetHudCartMode(true)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Game.SetHudCartMode(false)

EndEvent

; -----