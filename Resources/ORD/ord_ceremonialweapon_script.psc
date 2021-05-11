Scriptname ORD_CeremonialWeapon_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_Alt_CeremonialWeapon_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "HitFrame" && akSource == PlayerRef
		Utility.Wait(0.05)
		ORD_Alt_CeremonialWeapon_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(2.0)
	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_Alt_CeremonialWeapon_Spell_Proc)

EndEvent

; -----