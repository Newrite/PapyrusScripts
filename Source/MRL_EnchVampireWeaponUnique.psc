Scriptname MRL_EnchVampireWeaponUnique extends ActiveMagicEffect

Spell Property AbsorbNova Auto

bool _register = false
actor caster

Event OnEffectStart(Actor akCaster, Actor akTarget)
    _register = true
    caster = akTarget
    RegisterForSingleUpdate(1.0)
endEvent

Event OnUpdate()
    if !_register
        UnregisterForUpdate()
        return
    endif
    if caster.GetActorValuePercentage("health") as Float <= 0.25
        AbsorbNova.Cast(caster)
        RegisterForSingleUpdate(60.0)
        return
    endif
    RegisterForSingleUpdate(1.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	_register = false
endEvent