Scriptname MRL_AB_BattleMageAmulet extends ActiveMagicEffect
{Скрипт контролирует бонус амулета боевого мага на урон.}

Spell Property AbBattleMage Auto

actor Caster

float Function GetSumSchools()

    float sum = Caster.GetBaseActorValue("destruction") as Float + Caster.GetBaseActorValue("restoration") as Float + Caster.GetBaseActorValue("alteration") as Float + Caster.GetBaseActorValue("conjuration") as Float + Caster.GetBaseActorValue("illusion") as Float

    return sum

EndFunction

float Function CalcValueForAbility(float SchoolsSum)

    if SchoolsSum > 0.0
        return SchoolsSum * 0.1
    endif

    return 0.0
    
EndFunction

Function SetMagnitudeAbilityReAdd(float mag)

    Caster.RemoveSpell(AbBattleMage)

    AbBattleMage.SetNthEffectMagnitude(0, mag)
    AbBattleMage.SetNthEffectMagnitude(1, mag)
    AbBattleMage.SetNthEffectMagnitude(2, mag)

    Caster.AddSpell(AbBattleMage, false)

EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)

    Caster = akCaster

    float result = CalcValueForAbility(GetSumSchools())
    SetMagnitudeAbilityReAdd(result)

    RegisterForMenu("StatsMenu")

EndEvent

Event OnMenuClose(string menuName)

    if menuName == "StatsMenu"

        float result = CalcValueForAbility(GetSumSchools())
        SetMagnitudeAbilityReAdd(result)

    endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    
    UnregisterForMenu("StatsMenu")
    Caster.RemoveSpell(AbBattleMage)

EndEvent