Scriptname ORD_TheDivineWithin_AoE_Script extends activemagiceffect  

; -----

FormList Property ORD_Res_TheDivineWithin_FormList Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.DoCombatSpellApply((ORD_Res_TheDivineWithin_FormList.GetAt(0) as Spell), akTarget)

EndEvent

; -----