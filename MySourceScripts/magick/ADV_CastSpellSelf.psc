Scriptname ADV_CastSpellSelf extends ActiveMagicEffect

Spell Property SpellToCast Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    SpellToCast.Cast(akCaster, akCaster)
	
endEvent
