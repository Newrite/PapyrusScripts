Scriptname MRL_EnchVampireWeapon extends ActiveMagicEffect

Spell Property VampireEnch Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Float targetMR = akTarget.GetActorValue("MagicResist")
    Float mag = Self.GetMagnitude() / (1 - targetMR / 100)
    VampireEnch.SetNthEffectMagnitude(0, mag)
    VampireEnch.SetNthEffectMagnitude(1, mag)
    VampireEnch.SetNthEffectMagnitude(2, mag)
    VampireEnch.Cast(akCaster, akTarget)
endEvent
