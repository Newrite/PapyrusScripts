Scriptname ORD_MysticWarrior_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_Enc_MysticWarrior_Spell_Proc Auto
GlobalVariable Property ORD_Enc_MysticWarrior_Global_DoubleCost Auto
MagicEffect Property ORD_Enc_MysticWarrior_Effect_Proc Auto
FormList Property ORD_Enc_MysticWarrior_FormList Auto

; -----

Float DelayBetweenAttacksMin
Float DelayBetweenAttacksMax

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Enc_MysticWarrior_FormList.GetSize() > 0
		ORD_Enc_MysticWarrior_Global_DoubleCost.SetValue(1.0)
		RegisterForAnimationEvent(PlayerRef, "HitFrame")
	EndIf

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "HitFrame" && akSource == PlayerRef && PlayerRef.HasMagicEffect(ORD_Enc_MysticWarrior_Effect_Proc) == false
		ORD_Enc_MysticWarrior_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	If ORD_Enc_MysticWarrior_FormList.GetSize() > 0
		Utility.Wait(1.0)
		RegisterForAnimationEvent(PlayerRef, "HitFrame")
	EndIf

EndEvent

; -----