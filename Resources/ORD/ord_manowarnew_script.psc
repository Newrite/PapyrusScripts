Scriptname ORD_ManOWarNew_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_One_ManOWarNew_Spell_Proc Auto
Float Property ORD_Delay Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.2)
	RegisterForAnimationEvent(PlayerRef, "HitFrame")
	; HitFrame

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "HitFrame" && akSource == PlayerRef
		Utility.Wait(ORD_Delay)
		ORD_One_ManOWarNew_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(0.1)
	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.2)
	PlayerRef.DispelSpell(ORD_One_ManOWarNew_Spell_Proc)

EndEvent

; -----