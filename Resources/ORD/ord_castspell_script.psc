Scriptname ORD_CastSpell_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Spell.Cast(akTarget)

EndEvent

; -----