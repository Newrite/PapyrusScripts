Scriptname ORD_Attunement_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.UnequipAll()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.UnequipAll()

EndEvent

; -----