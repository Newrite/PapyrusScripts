Scriptname ORD_GrantXP_Script extends activemagiceffect  

; -----

Int Property ORD_XP Auto
String Property ORD_School Auto
Bool Property ORD_OnlyEnemy = false Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_OnlyEnemy
		If akTarget.IsHostileToActor(akCaster)
			Game.AdvanceSkill(ORD_School, ORD_XP)
		EndIf
	Else
		Game.AdvanceSkill(ORD_School, ORD_XP)
	EndIf

EndEvent

; -----