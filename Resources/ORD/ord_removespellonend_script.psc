Scriptname ORD_RemoveSpellOnEnd_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.RemoveSpell(ORD_Spell)

EndEvent

; -----