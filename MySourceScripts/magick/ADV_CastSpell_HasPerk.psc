Scriptname ADV_CastSpell_HasPerk extends ActiveMagicEffect

Spell Property SpellToCast Auto
Perk Property HasPerk Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
If akCaster.Hasperk(HasPerk)
    SpellToCast.Cast(akCaster, akTarget)
endif

endEvent
