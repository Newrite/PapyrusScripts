Scriptname ORD_SayNoToVuvuzelas_Script extends activemagiceffect  

; -----

Spell Property ORD_Spe_HornOfSovngarde_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(ORD_Spe_HornOfSovngarde_Spell)

EndEvent

; -----