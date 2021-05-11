Scriptname MRL_RBB_ArktusScriptAbility extends ActiveMagicEffect

Spell Property ArktusSpell Auto

Keyword Property ArktusControllerKeyword Auto

actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if !akCaster.HasMagicEffectWithKeyword(ArktusControllerKeyword)
        akCaster.RemoveSpell(ArktusSpell)
    endif
    Caster = akCaster
    RegisterForMenu("StatsMenu")
endevent

Event OnMenuOpen(String MenuName)
    If MenuName == "StatsMenu"
        Utility.Wait(3.0)
        if !Caster.HasMagicEffectWithKeyword(ArktusControllerKeyword)
            Caster.RemoveSpell(ArktusSpell)
        endif
    endif
EndEvent
