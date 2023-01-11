Scriptname MRL_CastSpellToDecreaseValue extends ActiveMagicEffect
{Высчитывает сопротивление и на такое уменьшает.}

String Property StringActorValue Auto
Float Property MaxAmountToDecrease Auto
Spell Property SpellDecreaseValue Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    
    float Resist = akTarget.GetActorValue(StringActorValue) as float

    if Resist > 0.0

        if Resist > MaxAmountToDecrease
            SpellDecreaseValue.SetNthEffectMagnitude(0, MaxAmountToDecrease)
        Else
            SpellDecreaseValue.SetNthEffectMagnitude(0, Resist)
        endif

        SpellDecreaseValue.Cast(akCaster, akTarget)

    endif

EndEvent