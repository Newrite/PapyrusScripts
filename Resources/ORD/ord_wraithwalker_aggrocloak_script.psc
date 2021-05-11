Scriptname ORD_Wraithwalker_AggroCloak_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.StartCombat(akTarget)

EndEvent

; -----