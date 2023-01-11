Scriptname MRL_MAGArcaneVortex extends ActiveMagicEffect

Float Property mult auto

string magicka = "magicka"

Event OnEffectStart(Actor akTarget, Actor akCaster)

    float mag = akCaster.GetActorValue(magicka) as Float / akCaster.GetActorValuePercentage(magicka) as Float
    float resist = akTarget.GetActorValue("MagicResist")
    if resist < 0.0
      resist = 1.0
    elseif resist >= 100.0
      resist = 0.0
    else
      resist = 1 - (resist / 100.0)
    endif
    akTarget.DamageActorValue("health", mag * mult * resist)

EndEvent