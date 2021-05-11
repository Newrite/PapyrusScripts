Scriptname ORD_BeautyInDeath_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_One_BeautyInDeath_Spell_Proc Auto

; -----

Int InitialDeaths

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	InitialDeaths = Game.QueryStat("People Killed") + Game.QueryStat("Animals Killed")
	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_One_BeautyInDeath_Spell_Proc)

EndEvent

; -----

Auto State IsListening

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)

		If asEventName == "HitFrame" && akSource == PlayerRef && (Game.QueryStat("People Killed") + Game.QueryStat("Animals Killed")) > InitialDeaths
			GoToState("IsNotListening")
			ORD_One_BeautyInDeath_Spell_Proc.Cast(PlayerRef)
		EndIf

	EndEvent

EndState

; -----

State IsNotListening

EndState

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(0.1)
	RegisterForAnimationEvent(PlayerRef, "HitFrame")

EndEvent

; -----