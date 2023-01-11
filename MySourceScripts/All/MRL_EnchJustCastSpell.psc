Scriptname MRL_EnchJustCastSpell extends ActiveMagicEffect

Spell Property SpellToCast Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    SpellToCast.Cast(akCaster, akTarget)
endEvent
