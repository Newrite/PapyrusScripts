Scriptname ORD_CastOnCaster_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.DoCombatSpellApply(ORD_Spell, akCaster)

EndEvent

; -----