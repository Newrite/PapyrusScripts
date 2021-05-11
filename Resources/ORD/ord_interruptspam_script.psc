Scriptname ORD_InterruptSpam_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	GetTargetActor().InterruptCast()
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----