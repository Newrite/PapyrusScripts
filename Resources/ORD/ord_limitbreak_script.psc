Scriptname ORD_LimitBreak_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_One_LimitBreak_Spell_Proc Auto
Float Property ORD_Delay Auto
GlobalVariable Property ORD_One_LimitBreak_Global_Count Auto
Message Property ORD_One_LimitBreak_Message Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_One_LimitBreak_Global_Count.SetValue(0)
	RegisterForAnimationEvent(PlayerRef, "HitFrame")
	; HitFrame

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "HitFrame" && akSource == PlayerRef
		Utility.Wait(ORD_Delay)
		ORD_One_LimitBreak_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(2.0)
	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_One_LimitBreak_Spell_Proc)
	ORD_One_LimitBreak_Global_Count.SetValue(0)

EndEvent

; -----