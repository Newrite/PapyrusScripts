Scriptname MRL_SpellFury_SE extends activemagiceffect

FormList Property SpellFurySpells auto

Actor Caster = none

Function AddAllSpells()
    
    int i = SpellFurySpells.GetSize()
    while i
        i = i - 1
        Caster.AddSpell(SpellFurySpells.GetAt(i) as Spell, false)
    endWhile

EndFunction

Function RemoveAllSpells()
    
    int i = SpellFurySpells.GetSize()
    while i
        i = i - 1
        Caster.RemoveSpell(SpellFurySpells.GetAt(i) as Spell)
    endWhile

EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)

    Caster = akCaster

    Utility.Wait(1.0)

    RemoveAllSpells()

    AddAllSpells()

endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    RemoveAllSpells()

EndEvent