Scriptname ORD_LeapProc_Script extends activemagiceffect  

; -----

String Property ORD_AnimEventUp Auto
String Property ORD_AnimEventDown Auto
{JumpUp JumpDown LandEnd WeaponSwing WeaponLeftSwing}
Spell Property ORD_Lia_OneStepAhead_Spell_Proc Auto
Float Property ORD_Cooldown Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(akTarget, ORD_AnimEventUp)
	RegisterForAnimationEvent(akTarget, ORD_AnimEventDown)
	RegisterforSingleUpdate(ORD_Cooldown)

EndEvent

; -----

State IsListening

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)

		If asEventName == ORD_AnimEventUp
			GoToState("IsDeaf")
			ORD_Lia_OneStepAhead_Spell_Proc.Cast(GetTargetActor())

		ElseIf asEventName == ORD_AnimEventDown
			GetTargetActor().DispelSpell(ORD_Lia_OneStepAhead_Spell_Proc)

		EndIf

	EndEvent

EndState

; -----

Auto State IsDeaf

	Event OnBeginState()

		RegisterforSingleUpdate(ORD_Cooldown)

	EndEvent

	Event OnUpdate()

		GoToState("IsListening")

	EndEvent

EndState

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(2.0)
	RegisterForAnimationEvent(GetTargetActor(), ORD_AnimEventUp)
	RegisterForAnimationEvent(GetTargetActor(), ORD_AnimEventDown)

EndEvent

; -----