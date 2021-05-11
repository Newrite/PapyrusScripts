Scriptname ORD_SpringTrap_Script extends activemagiceffect  

; -----

Float Property ORD_PushForce Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PushActorAway(akTarget, ORD_PushForce)

EndEvent

; -----