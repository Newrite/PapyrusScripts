Scriptname ORD_UntoTheMassesNew_Script extends activemagiceffect  


; -----

Actor Property PlayerRef Auto
Spell Property ORD_Ill_CooldownEnd_Spell_BlindGuardian Auto
Spell Property ORD_Ill_CooldownEnd_Spell_HeavyWeighsTheTapestry Auto
Spell Property ORD_Ill_CooldownEnd_Spell_LambToTheSlaughter Auto
Spell Property ORD_Ill_CooldownEnd_Spell_MindSpiders Auto
Spell Property ORD_Ill_CooldownEnd_Spell_Nemesis Auto
Spell Property ORD_Ill_CooldownEnd_Spell_TheReaperComes Auto
Float Property ORD_Delay Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnUpdate()

	PlayerRef.DispelSpell(ORD_Ill_CooldownEnd_Spell_BlindGuardian)
	PlayerRef.DispelSpell(ORD_Ill_CooldownEnd_Spell_HeavyWeighsTheTapestry)
	PlayerRef.DispelSpell(ORD_Ill_CooldownEnd_Spell_LambToTheSlaughter)
	PlayerRef.DispelSpell(ORD_Ill_CooldownEnd_Spell_MindSpiders)
	PlayerRef.DispelSpell(ORD_Ill_CooldownEnd_Spell_Nemesis)
	PlayerRef.DispelSpell(ORD_Ill_CooldownEnd_Spell_TheReaperComes)

EndEvent

; -----


