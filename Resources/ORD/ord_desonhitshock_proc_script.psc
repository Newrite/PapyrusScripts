Scriptname ORD_DesOnHitShock_Proc_Script extends activemagiceffect  

; -----

Float Property ORD_KnockdownForce Auto
Float Property ORD_UpdateRate Auto
Actor Property PlayerRef Auto

; -----

Actor TargetActor
Float KnockdownForce

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	KnockdownForce = ORD_KnockdownForce
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If !TargetActor.IsDead() && !PlayerRef.IsInKillMove()
		RegisterForSingleUpdate(ORD_UpdateRate)
		TargetActor.PushActorAway(TargetActor, -ORD_KnockdownForce)
		KnockdownForce = (-KnockdownForce)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	UnregisterForUpdate()

EndEvent

; -----