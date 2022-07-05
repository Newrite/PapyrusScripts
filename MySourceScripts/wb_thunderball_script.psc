Scriptname WB_Thunderball_Script extends ActiveMagicEffect  

; -----

Float Property WB_CollisionDistance Auto
Float Property WB_DashSpeed Auto
Float Property WB_ShakeStrength Auto
Float Property WB_UpdateRate Auto

Activator Property FXEmptyActivator Auto
Explosion Property WB_DestructionShock_Explosion_Thunderball Auto
ImagespaceModifier Property WB_DestructionShock_Imod_Thunderball Auto

Spell[] Property WB_Thunderballs Auto

Actor Property PlayerRef Auto

; -----

Actor TargetActor
Actor CasterActor

ObjectReference ForceObject
Float DistanceToImpact
Int Selector

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster

;	DistanceTraveled = TargetActor.GetDistance(CasterActor)
;	akTarget.PushActorAway(akTarget, 4 + (DistanceTraveled / 250))
	ForceObject = akCaster.PlaceAtMe(FXEmptyActivator)
	WB_DestructionShock_Imod_Thunderball.Apply()

	akCaster.TranslateToRef(akTarget, WB_DashSpeed)

	RegisterForUpdate(WB_UpdateRate)
	Game.ShakeCamera(afStrength = WB_ShakeStrength)
	Game.ShakeController(0.5, 0.5, 2.0)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	CasterActor.StopTranslation()
	WB_DestructionShock_Imod_Thunderball.Remove()
	Utility.Wait(0.1)
	Utility.Wait(2.5)
	ForceObject.Delete()

EndEvent

; -----

Event OnUpdate()

	DistanceToImpact = TargetActor.GetDistance(CasterActor)
	If DistanceToImpact < WB_CollisionDistance
		UnregisterForUpdate()
		CasterActor.PlaceAtMe(WB_DestructionShock_Explosion_Thunderball)
		CasterActor.StopTranslation()
		DistanceToImpact = ForceObject.GetDistance(CasterActor)
		ForceObject.PushActorAway(TargetActor,10)
		If DistanceToImpact >= 2500
			DistanceToImpact = 2499
		EndIf
		Selector = (DistanceToImpact / 500) as Int
		WB_Thunderballs[Selector].Cast(CasterActor, TargetActor)
		Dispel()
	Else
		CasterActor.TranslateToRef(TargetActor,WB_DashSpeed)
	EndIf

EndEvent

; -----