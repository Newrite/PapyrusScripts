Scriptname SCS_TWDNKY_Script extends activemagiceffect  

; -----

Float Property ORD_DPS Auto

; -----

Actor TargetActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	RegisterForUpdate(1.0)
	Debug.Trace("ORDINATOR DEBUG: Starting TWDNKY", 0)

EndEvent

; -----

Event OnUpdate()

	TargetActor.DamageActorValue("Health", ORD_DPS)

EndEvent

; -----