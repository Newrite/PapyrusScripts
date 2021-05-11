Scriptname ORD_GiantsStride_Script extends activemagiceffect  

; -----

{JumpUp JumpDown LandEnd WeaponSwing WeaponLeftSwing SprintStart SprintStop}
Spell Property ORD_Hea_GiantsStride_Spell_Proc Auto
Float Property ORD_MinDur Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(akTarget, "tailSprint")
	RegisterForAnimationEvent(akTarget, "EndAnimatedCameraDelta")

EndEvent

; -----

State IsSprinting

	Event OnBeginState()

		RegisterForSingleUpdate(ORD_MinDur)

	EndEvent

	Event OnUpdate()

		GoToState("Armed")

	EndEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)

		If asEventName == "EndAnimatedCameraDelta"
			UnregisterForUpdate()
			GoToState("IsNotSprinting")
		EndIf

	EndEvent

EndState

; -----

Auto State IsNotSprinting

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)

		If asEventName == "tailSprint"
			GoToState("IsSprinting")
		EndIf

	EndEvent

EndState

; -----

State Armed

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)

		If asEventName == "EndAnimatedCameraDelta"
			GoToState("IsNotSprinting")
			ORD_Hea_GiantsStride_Spell_Proc.Cast(GetTargetActor())
		EndIf

	EndEvent


EndState

; -----

Event OnRaceSwitchComplete()

	RegisterForAnimationEvent(GetTargetActor(), "tailSprint")
	RegisterForAnimationEvent(GetTargetActor(), "EndAnimatedCameraDelta")

EndEvent

; -----