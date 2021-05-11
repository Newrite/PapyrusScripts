Scriptname ORD_RollForInitiative_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
String Property ORD_Event Auto
{SneakSprintStartRoll, tailSprint}
Spell Property ORD_Sne_RollForInitiative_Spell_Buff Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(PlayerRef, ORD_Event)

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If akSource == PlayerRef && asEventName == ORD_Event && PlayerRef.IsSneaking()
		ORD_Sne_RollForInitiative_Spell_Buff.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	RegisterForAnimationEvent(PlayerRef, ORD_Event)

EndEvent

; -----