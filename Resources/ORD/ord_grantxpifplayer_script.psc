Scriptname ORD_GrantXPIfPlayer_Script extends activemagiceffect  

; -----

Int Property ORD_XP Auto
String Property ORD_School Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget == PlayerRef
		Game.AdvanceSkill(ORD_School, ORD_XP)
	EndIf

EndEvent

; -----