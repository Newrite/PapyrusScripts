Scriptname MRL_VigharShieldBashController extends ActiveMagicEffect

Spell Property NormalPowerBash Auto
Spell Property OverpowerShieldBash Auto
Spell Property DisarmShieldBash Auto

Perk Property PerkNormalPowerBash Auto
Perk Property PerkOverpowerShieldBash Auto
Perk Property PerkDisarmShieldBash Auto

Spell Property AbsorbSpell Auto

Float Property DamageAmount Auto

String Property ActorValueToDamage Auto

Event OnEffectStart(Actor akCaster, Actor akTarget)
    if akCaster.GetActorValue(ActorValueToDamage) as Float >= DamageAmount
        AbsorbSpell.Cast(akCaster, akTarget)
        akCaster.ModActorValue(ActorValueToDamage, -DamageAmount)
    endif
    CastShieldBash(akCaster, akTarget)
endEvent

Function CastShieldBash(Actor akCaster, Actor akTarget)
    if akCaster.HasPerk(PerkDisarmShieldBash)
        DisarmShieldBash.Cast(akCaster, akTarget)
        return
    endif
    if akCaster.HasPerk(PerkOverpowerShieldBash)
        OverpowerShieldBash.Cast(akCaster, akTarget)
        return
    endif
    if akCaster.HasPerk(PerkNormalPowerBash)
        NormalPowerBash.Cast(akCaster, akTarget)
        return
    endif
EndFunction