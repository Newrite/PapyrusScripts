Scriptname ORD_CastSpellPlayer_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Spell.Cast(PlayerRef)

EndEvent

; -----