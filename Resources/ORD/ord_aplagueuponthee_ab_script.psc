Scriptname ORD_APlagueUponThee_Ab_Script extends activemagiceffect  

; -----

Spell Property ORD_Con_APlagueUponThee_Spell_Proc Auto
Spell Property ORD_Con_APlagueUponThee_Spell_Ab Auto
Spell Property ORD_Con_RavenousDead_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DoCombatSpellApply(ORD_Con_RavenousDead_Spell_Proc, akTarget)
	akTarget.DoCombatSpellApply(ORD_Con_APlagueUponThee_Spell_Proc, akTarget)
	akTarget.RemoveSpell(ORD_Con_APlagueUponThee_Spell_Ab)

EndEvent

; -----