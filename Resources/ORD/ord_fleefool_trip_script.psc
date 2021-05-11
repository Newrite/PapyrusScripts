Scriptname ORD_FleeFool_Trip_Script extends activemagiceffect  

; -----

Float Property ORD_Force Auto
Float Property ORD_UpdateRateMin Auto
Float Property ORD_UpdateRateMax Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(Utility.RandomFloat(ORD_UpdateRateMin, ORD_UpdateRateMax))

EndEvent

; -----

Event OnUpdate()

	Actor TargetActor = GetTargetActor()
	If (TargetActor.IsRunning() || TargetActor.IsSprinting())
		TargetActor.PushActorAway(TargetActor, ORD_Force)
	EndIf
	;RegisterForSingleUpdate(Utility.RandomFloat(ORD_UpdateRateMin, ORD_UpdateRateMax))

EndEvent

; -----