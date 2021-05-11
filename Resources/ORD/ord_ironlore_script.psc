Scriptname ORD_IronLore_Script extends activemagiceffect  

; -----

Spell[] Property ORD_Smh_IronLore_Spell_Add Auto
Spell[] Property ORD_Smh_SmithingSpecialization_Spell_Add Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If PlayerRef.HasSpell(ORD_Smh_SmithingSpecialization_Spell_Add[0])
		PlayerRef.AddSpell(ORD_Smh_IronLore_Spell_Add[0], false)
	ElseIf PlayerRef.HasSpell(ORD_Smh_SmithingSpecialization_Spell_Add[1])
		PlayerRef.AddSpell(ORD_Smh_IronLore_Spell_Add[1], false)
	ElseIf PlayerRef.HasSpell(ORD_Smh_SmithingSpecialization_Spell_Add[2])
		PlayerRef.AddSpell(ORD_Smh_IronLore_Spell_Add[2], false)
	ElseIf PlayerRef.HasSpell(ORD_Smh_SmithingSpecialization_Spell_Add[3])
		PlayerRef.AddSpell(ORD_Smh_IronLore_Spell_Add[3], false)
	ElseIf PlayerRef.HasSpell(ORD_Smh_SmithingSpecialization_Spell_Add[4])
		PlayerRef.AddSpell(ORD_Smh_IronLore_Spell_Add[4], false)
	EndIf
	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[0])
	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[1])
	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[2])
	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[3])
	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[4])

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.RemoveSpell(ORD_Smh_IronLore_Spell_Add[0])
	PlayerRef.RemoveSpell(ORD_Smh_IronLore_Spell_Add[1])
	PlayerRef.RemoveSpell(ORD_Smh_IronLore_Spell_Add[2])
	PlayerRef.RemoveSpell(ORD_Smh_IronLore_Spell_Add[3])
	PlayerRef.RemoveSpell(ORD_Smh_IronLore_Spell_Add[4])

EndEvent

; -----