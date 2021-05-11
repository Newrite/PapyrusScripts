Scriptname ORD_DestructionInBattle_Script extends activemagiceffect  

; -----

Spell Property ORD_Des_AlphaStrike_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DoCombatSpellApply(ORD_Des_AlphaStrike_Spell_Proc, akTarget)

EndEvent

; -----