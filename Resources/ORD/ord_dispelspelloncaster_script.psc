Scriptname ORD_DispelSpellOnCaster_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.DispelSpell(ORD_Spell)

EndEvent

; -----