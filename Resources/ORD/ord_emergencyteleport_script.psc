Scriptname ORD_EmergencyTeleport_Script extends activemagiceffect  

; -----

Activator Property ORD_Alt_EmergencyTeleport_Activator Auto
EffectShader Property ORD_Alt_EmergencyTeleport_FXS_In Auto
EffectShader Property ORD_Alt_EmergencyTeleport_FXS_Out Auto
Activator Property FXEmptyActivator Auto
Float Property ORD_Threshold Auto
Actor Property PlayerRef Auto
Sound Property ORD_Alt_EmergencyTeleport_Marker Auto

; -----

Actor TargetActor
ObjectReference ReturnBox
Actor AggressorActor
Bool CanTeleport

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	CanTeleport = true
	TargetActor = akTarget
	ReturnBox = akTarget.PlaceAtMe(FXEmptyActivator)

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If TargetActor.GetAVPercentage("Health") < ORD_Threshold
		; taking into account multiple hits from one attack
		AggressorActor = akAggressor as Actor
		RegisterForSingleUpdate(0.1)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ReturnBox.Delete()

EndEvent

; -----

Event OnUpdate()

	If !TargetActor.IsDead() && CanTeleport		; race condition
		CanTeleport = false
		Bool IsAlreadyGhost = TargetActor.IsGhost()
		ORD_Alt_EmergencyTeleport_FXS_Out.Play(TargetActor)
		If !IsAlreadyGhost
			TargetActor.SetGhost(true)
		EndIf
		ObjectReference RippleAtTarget = TargetActor.PlaceAtMe(ORD_Alt_EmergencyTeleport_Activator)

		Utility.Wait(0.5)
	
		TargetActor.MoveTo(ReturnBox)
		TargetActor.PlaceAtMe(ORD_Alt_EmergencyTeleport_Activator)
		ORD_Alt_EmergencyTeleport_Marker.Play(TargetActor)

		Utility.Wait(0.5)
	
		ORD_Alt_EmergencyTeleport_FXS_Out.Stop(TargetActor)
		If !IsAlreadyGhost
			TargetActor.SetGhost(false)
		EndIf
		If TargetActor != PlayerRef
			TargetActor.EvaluatePackage()
			TargetActor.StartCombat(AggressorActor)
		EndIf

		Utility.Wait(4.0)

		RippleAtTarget.Disable()
		RippleAtTarget.Delete()
	EndIf

EndEvent

; -----
