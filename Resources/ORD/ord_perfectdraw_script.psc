Scriptname ORD_PerfectDraw_Script extends activemagiceffect  


; -----

Spell Property ORD_Arc_PerfectDraw_Spell_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(akTarget, "BowDrawn")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "BowDrawn" && akSource == PlayerRef && PlayerRef.GetEquippedItemType(1) == 7
		ORD_Arc_PerfectDraw_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	RegisterForAnimationEvent(GetTargetActor(), "BowDrawn")

EndEvent

; -----