Scriptname MRL_SpellFuryEnchOnCast extends activemagiceffect

Int Property CountCastEnch = 6 Auto
GlobalVariable Property GlobalCounter Auto
Spell Property ProcSpell Auto
Spell Property CheckSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if akCaster.HasSpell(CheckSpell)
        int counter = GlobalCounter.GetValue() as int
        if counter >= CountCastEnch
            ProcSpell.Cast(akCaster)
            GlobalCounter.SetValue(1.0)
        else
            GlobalCounter.Mod(1.0)
        endif
    endif
EndEvent
