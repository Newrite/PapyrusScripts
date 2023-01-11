Scriptname MRL_MAG_SimpleApplySpell extends ActiveMagicEffect

Spell Property CastSpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    CastSpell.Cast(akCaster, akTarget)

EndEvent