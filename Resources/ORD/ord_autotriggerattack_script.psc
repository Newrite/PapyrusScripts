Scriptname ORD_AutoTriggerAttack_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto

Float Property ORD_UpdateRate Auto
Float Property ORD_AttackSpeedGoal Auto


; -----

Actor CasterActor
Float AttackSpeedMod

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	CasterActor = akTarget
;	RegisterForUpdate(ORD_UpdateRate)
;	AttackSpeedMod = ORD_AttackSpeedGoal - akTarget.GetAV("WeaponSpeedMult")
;	akTarget.ModAV("WeaponSpeedMult", AttackSpeedMod)

	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----

Event OnUpdate()

;	Debug.SendAnimationEvent(CasterActor, "attackPowerStartForward")
	Debug.SendAnimationEvent(CasterActor, "attackStop")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "HitFrame" && akSource == CasterActor
		Debug.SendAnimationEvent(CasterActor, "HitFrame")
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

;	akTarget.ModAV("WeaponSpeedMult", -AttackSpeedMod)

EndEvent


; -----

Event OnRaceSwitchComplete()

	Utility.Wait(0.1)
	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----