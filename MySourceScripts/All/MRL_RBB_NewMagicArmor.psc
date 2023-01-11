Scriptname MRL_RBB_NewMagicArmor extends ActiveMagicEffect

Spell Property MagicArmorSpell Auto

Int Property BaseScale = 1 Auto
Int Property ScaleWithPerk = 2 Auto
Int Property ArctusBonus = 1 Auto

actor effectTarget

Function changeDamageResist()

    float baseManaScale = effectTarget.GetBaseAV("Magicka") * BaseScale
    float perkManaScale = effectTarget.GetBaseAV("Magicka") * ScaleWithPerk
    float arctusManaScale = (effectTarget.GetBaseAV("Magicka") * ArctusBonus)
    MagicArmorSpell.SetNthEffectMagnitude(0, baseManaScale)
    MagicArmorSpell.SetNthEffectMagnitude(1, perkManaScale)
    MagicArmorSpell.SetNthEffectMagnitude(2, arctusManaScale + baseManaScale)
    MagicArmorSpell.SetNthEffectMagnitude(3, arctusManaScale + perkManaScale)
    effectTarget.AddSpell(MagicArmorSpell, false)
    

EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if akTarget.HasSpell(MagicArmorSpell)
        akTarget.RemoveSpell(MagicArmorSpell)
    endif

    RegisterForMenu("StatsMenu")
    effectTarget = akTarget
    changeDamageResist()
endevent

Event OnMenuOpen(String MenuName)
    If MenuName == "StatsMenu"
        effectTarget.RemoveSpell(MagicArmorSpell)
        changeDamageResist()
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    effectTarget.RemoveSpell(MagicArmorSpell)
    While effectTarget.HasSpell(MagicArmorSpell)
        effectTarget.RemoveSpell(MagicArmorSpell)
    EndWhile
EndEvent
