Scriptname ORD_ShoelacePrank_Script extends activemagiceffect  

; -----

Float Property ORD_Force Auto
Spell Property ORD_Sne_ShoelacePrank_Spell_Proc Auto
Int Property ORD_XP Auto
String Property ORD_School Auto
Bool Property ORD_OnlyEnemy = false Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PushActorAway(akTarget, ORD_Force)
	akTarget.DispelSpell(ORD_Sne_ShoelacePrank_Spell_Proc)

	If ORD_OnlyEnemy
		If akTarget.IsHostileToActor(akCaster)
			Game.AdvanceSkill(ORD_School, ORD_XP)
		EndIf
	Else
		Game.AdvanceSkill(ORD_School, ORD_XP)
	EndIf

EndEvent

; -----