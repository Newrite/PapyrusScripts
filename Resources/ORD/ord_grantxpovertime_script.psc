Scriptname ORD_GrantXPOverTime_Script extends activemagiceffect  

; -----

Int Property ORD_XP Auto
Float Property ORD_UpdateRate Auto
String Property ORD_School Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == PlayerRef
		RegisterForSingleUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----

Event OnUpdate()

	Game.AdvanceSkill(ORD_School, ORD_XP)
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----