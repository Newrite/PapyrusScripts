Scriptname MRL_RBB_ArktusScriptAbility extends ActiveMagicEffect

Spell Property ArktusSpell Auto
Spell Property ArktusController Auto

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

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akCaster.RemoveSpell(ArktusController)
    akCaster.RemoveSpell(ArktusSpell)
endevent