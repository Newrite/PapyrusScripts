Scriptname ORD_WorldInFlames_Script extends activemagiceffect  

; -----

Hazard Property ORD_Des_WorldInFlames_Hazard Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PlaceAtMe(ORD_Des_WorldInFlames_Hazard).SetActorCause(akCaster)

EndEvent

; -----