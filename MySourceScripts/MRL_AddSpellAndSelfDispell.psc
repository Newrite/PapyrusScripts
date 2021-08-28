Scriptname MRL_AddSpellAndSelfDispell extends ActiveMagicEffect
{The documentation string.}

Spell Property ResourceSpell Auto
Spell Property SelfSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Debug.Notification("Инициализация ресурсов")
    Utility.WaitMenuMode(1.0)
    akTarget.AddSpell(ResourceSpell, false)
    Utility.WaitMenuMode(1.0)
    akTarget.RemoveSpell(SelfSpell)
EndEvent