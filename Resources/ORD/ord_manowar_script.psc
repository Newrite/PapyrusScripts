Scriptname ORD_ManOWar_Script extends activemagiceffect  

; -----

Actor TargetActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForUpdate(0.5)
	TargetActor = akTarget
	akTarget.SetAnimationVariableFloat("attackComboStartFraction", 5)

EndEvent

; -----

Event OnUpdate()

	Debug.SendAnimationEvent(TargetActor, "attackPowerStartDualWield")
;	Debug.Notification("blockDown = " + TargetActor.GetAnimationVariableInt("blockDown") + " attackComboStartFraction = " + TargetActor.GetAnimationVariableFloat("attackComboStartFraction") + " b1HM_MLh_attack = " + TargetActor.GetAnimationVariableBool("b1HM_MLh_attack"))

EndEvent

; -----