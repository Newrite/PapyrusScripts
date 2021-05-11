Scriptname ORD_WickedWind_Script extends activemagiceffect  

; -----

Quest Property ORD_WickedWind_Quest Auto
ReferenceAlias[] Property ORD_Targets Auto
Actor Property PlayerRef Auto

Float Property ORD_DistanceInFront Auto
Sound Property ORD_Sne_LeapingShados_Marker Auto
Float Property ORD_AttackLockDuration Auto

Float Property ORD_InitialWait Auto
Float Property ORD_WaitBetweenPorts Auto
Float Property ORD_WaitAfterAttack Auto

; -----

Int NumberOfTargets
Int CurrentTarget = 0

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_WickedWind_Quest.Start()
	If ORD_WickedWind_Quest.IsRunning()
		NumberOfTargets = ORD_Targets.Length - 1
		RegisterForAnimationEvent(PlayerRef, "HitFrame")
		RegisterForSingleUpdate(ORD_InitialWait)
	Else
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_WickedWind_Quest.Stop()

EndEvent

; -----

Function DoTeleport(Actor akTarget)

	akTarget.SetDontMove(true)

	Float EndLocX = (ORD_DistanceInFront*Math.Sin(akTarget.GetAngleZ()))
	Float EndLocY = (ORD_DistanceInFront*Math.Cos(akTarget.GetAngleZ()))
	Float TargetAngleZ = akTarget.GetAngleZ()
	PlayerRef.MoveTo(akTarget, EndLocX, EndLocY, 0)

	Debug.SendAnimationEvent(PlayerRef, "attackPowerStartInPlace")
	PlayerRef.SetAngle(0, 0, TargetAngleZ)
	akTarget.PushActorAway(akTarget,3.0)
	ORD_Sne_LeapingShados_Marker.Play(PlayerRef)

	Utility.Wait(ORD_AttackLockDuration)
	akTarget.SetDontMove(false)

EndFunction

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor != PlayerRef
		Dispel()
	EndIf

EndEvent

; -----

Event OnUpdate()

	DoTeleport(ORD_Targets[CurrentTarget].GetActorRef())
	CurrentTarget += 1
	If ORD_Targets[CurrentTarget] != NONE && !ORD_Targets[CurrentTarget].GetActorRef().IsDead()
		RegisterForSingleUpdate(ORD_WaitBetweenPorts)
	Else
		Dispel()
	EndIf

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "HitFrame" && akSource == PlayerRef
		Debug.Notification("HIT")
		If ORD_Targets[CurrentTarget] != NONE && !ORD_Targets[CurrentTarget].GetActorRef().IsDead()
;			RegisterForSingleUpdate(ORD_WaitAfterAttack)
			OnUpdate()
		Else
			Dispel()
		EndIf
	EndIf

EndEvent

; -----