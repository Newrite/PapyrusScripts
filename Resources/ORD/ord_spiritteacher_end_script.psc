Scriptname ORD_SpiritTeacher_End_Script extends activemagiceffect  

; -----

Quest Property ORD_SpiritTutors_Quest Auto
Spell Property ORD_Res_SpiritTutors_Spell_AbBlessing1 Auto
Spell Property ORD_Res_SpiritTutors_Spell_AbBlessing2 Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.HasSpell(ORD_Res_SpiritTutors_Spell_AbBlessing1) && akTarget.HasSpell(ORD_Res_SpiritTutors_Spell_AbBlessing2)
		Utility.Wait(8.0)
		ORD_SpiritTutors_Quest.Stop()
	EndIf

EndEvent

; -----