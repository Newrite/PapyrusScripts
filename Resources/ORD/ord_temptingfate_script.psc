Scriptname ORD_TemptingFate_Script extends activemagiceffect  

; -----

Spell Property ORD_Lia_TemptingFate_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.DoCombatSpellApply(ORD_Lia_TemptingFate_Spell_Proc,akCaster)

EndEvent

; -----