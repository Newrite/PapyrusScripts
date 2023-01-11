Scriptname ADV_CastSpellSelf_HasPerk extends ActiveMagicEffect

Spell Property SpellToCast Auto
Perk Property HasPerk Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
If akCaster.Hasperk(HasPerk)
    SpellToCast.Cast(akCaster, akCaster)
endif
   
endEvent
