Scriptname ORD_Wolfkin_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_Two_Wolfkin_Spell_Proc Auto
GlobalVariable Property ORD_Two_Wolfkin_Global_Count Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Two_Wolfkin_Global_Count.SetValue(0)
	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "HitFrame" && akSource == PlayerRef
		ORD_Two_Wolfkin_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(2.0)
	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.5)
	PlayerRef.DispelSpell(ORD_Two_Wolfkin_Spell_Proc)
	ORD_Two_Wolfkin_Global_Count.SetValue(0)

EndEvent

; -----