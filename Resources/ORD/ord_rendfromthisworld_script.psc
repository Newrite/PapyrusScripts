Scriptname ORD_RendFromThisWorld_Script extends activemagiceffect  

; -----

Spell Property ORD_Con_RendFromThisWorld_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	; workaround to avoid having to modify all bound weapon enchantments
	akCaster.DoCombatSpellApply(ORD_Con_RendFromThisWorld_Spell_Proc, akTarget)

EndEvent

; -----