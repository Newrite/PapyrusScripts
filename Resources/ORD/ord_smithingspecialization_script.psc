Scriptname ORD_SmithingSpecialization_Script extends activemagiceffect  

; -----

Message Property ORD_Smh_SmithingSpecialization_Message_Want Auto
Spell[] Property ORD_Smh_SmithingSpecialization_Spell_Add Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef.AddSpell(ORD_Smh_SmithingSpecialization_Spell_Add[ORD_Smh_SmithingSpecialization_Message_Want.Show()], false)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[0])
	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[1])
	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[2])
	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[3])
	PlayerRef.RemoveSpell(ORD_Smh_SmithingSpecialization_Spell_Add[4])

EndEvent

; -----
