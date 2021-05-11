Scriptname ORD_Knockdown_Script extends activemagiceffect  

; -----

Float Property ORD_KnockdownForce Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PushActorAway(akTarget, ORD_KnockdownForce)

EndEvent

; -----