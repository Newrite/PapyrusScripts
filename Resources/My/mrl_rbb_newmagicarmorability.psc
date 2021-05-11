Scriptname MRL_RBB_NewMagicArmorAbility extends ActiveMagicEffect

Spell Property MagicArmorSpell Auto

Keyword Property MagicArmorKeyword Auto

actor effectTarget

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if !akTarget.HasMagicEffectWithKeyword(MagicArmorKeyword)
        akTarget.RemoveSpell(MagicArmorSpell)
    endif
    effectTarget = akTarget
    RegisterForMenu("StatsMenu")
endevent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
    if !effectTarget.HasMagicEffectWithKeyword(MagicArmorKeyword)
        effectTarget.RemoveSpell(MagicArmorSpell)
    endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
    if !effectTarget.HasMagicEffectWithKeyword(MagicArmorKeyword)
        effectTarget.RemoveSpell(MagicArmorSpell)
    endif
EndEvent

Event OnMenuOpen(String MenuName)
    If MenuName == "StatsMenu"    
        if !effectTarget.HasMagicEffectWithKeyword(MagicArmorKeyword)
            effectTarget.RemoveSpell(MagicArmorSpell)
        endif
    endif
EndEvent
