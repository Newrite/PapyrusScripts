Scriptname MRL_BGUnholyScript extends ActiveMagicEffect

Spell Property SpellToSelf Auto
Spell Property SpellToTarget Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    SpellToSelf.Cast(akCaster, akCaster)
    SpellToTarget.Cast(akCaster, akTarget)
endEvent
