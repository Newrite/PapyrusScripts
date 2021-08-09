Scriptname MRL_SwitchStyles extends ActiveMagicEffect

Spell Property StyleToApply Auto
Spell Property StyleToRemove01 Auto
Spell Property StyleToRemove02 Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if !akTarget.HasSpell(StyleToApply)
        akTarget.AddSpell(StyleToApply, false)
        akTarget.RemoveSpell(StyleToRemove01)
        akTarget.RemoveSpell(StyleToRemove02)
    else
        akTarget.RemoveSpell(StyleToApply)
        akTarget.RemoveSpell(StyleToRemove01)
        akTarget.RemoveSpell(StyleToRemove02)
    endif
endEvent
