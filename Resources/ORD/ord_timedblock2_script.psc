Scriptname ORD_TimedBlock2_Script extends activemagiceffect  

; -----

Spell Property ORD_Bck_TimedBlock_Spell_Proc Auto
Keyword Property ORD_Bck_Keyword_TimedBlockLockout Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(PlayerRef, "blockStartOut")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "blockStartOut" && !PlayerRef.HasEffectKeyword(ORD_Bck_Keyword_TimedBlockLockout) && akSource == PlayerRef
		ORD_Bck_TimedBlock_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(2.0)
	RegisterForAnimationEvent(PlayerRef, "blockStartOut")

EndEvent

; -----