Scriptname MRL_EnchVampireWeapon extends ActiveMagicEffect

Spell Property VampireEnch Auto

Event OnEffectStart(Actor akCaster, Actor akTarget)
    Float mag = self.GetMagnitude()
    VampireEnch.SetNthEffectMagnitude(0, mag)
    VampireEnch.SetNthEffectMagnitude(1, mag)
    VampireEnch.SetNthEffectMagnitude(2, mag)
    VampireEnch.Cast(akCaster, akTarget)
endEvent