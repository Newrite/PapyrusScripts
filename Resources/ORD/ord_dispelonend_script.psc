Scriptname ORD_DispelOnEnd_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(ORD_Spell)

EndEvent

; -----