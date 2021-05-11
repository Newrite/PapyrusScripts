Scriptname ORD_Des_WakeOfDestruction_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto
Hazard Property ORD_Des_PyromancerAscension_Hazard Auto

; -----

Actor TargetActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	RegisterForUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	TargetActor.PlaceAtMe(ORD_Des_PyromancerAscension_Hazard).SetActorCause(TargetActor)

EndEvent

; -----