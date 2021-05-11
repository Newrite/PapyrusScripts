Scriptname ORD_GirdForWar_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Smh_GirdForWar_Global_IsCompleted Auto
Spell Property ORD_Smh_GirdForWar_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Smh_GirdForWar_Global_IsCompleted.GetValue() == 0
		ORD_Smh_GirdForWar_Global_IsCompleted.SetValue(1)
		ORD_Smh_GirdForWar_Spell_Proc.Cast(akTarget)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(ORD_Smh_GirdForWar_Spell_Proc)

EndEvent

; -----