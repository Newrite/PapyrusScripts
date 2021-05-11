Scriptname ORD_WarriorsFlame_Undead_Script extends activemagiceffect  

; -----

ReferenceAlias Property ORD_WarriorsFlame_Target Auto
Keyword Property ActorTypeUndead Auto
Float Property ORD_Wait Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(ORD_Wait)
	If !akTarget.HasKeyword(ActorTypeUndead)
		ORD_WarriorsFlame_Target.ForceRefTo(akTarget)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_WarriorsFlame_Target.Clear()

EndEvent

; -----