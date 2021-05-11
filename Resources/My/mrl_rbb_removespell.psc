Scriptname MRL_RBB_RemoveSpell extends activemagiceffect

Spell Property spellToRemove auto

Event OnEffectStart (Actor akTarget, Actor akCaster)
        akTarget.RemoveSpell(spellToRemove)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
        akTarget.RemoveSpell(spellToRemove)
EndEvent
