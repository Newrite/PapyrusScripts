Scriptname MRL_EnchJustCastSpellSelf extends ActiveMagicEffect

Spell Property SpellToCast Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    SpellToCast.Cast(akCaster, akCaster)
endEvent
