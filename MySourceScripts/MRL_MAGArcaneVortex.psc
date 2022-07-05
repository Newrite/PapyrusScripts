Scriptname MRL_MAGArcaneVortex extends ActiveMagicEffect

Float Property mult auto

string magicka = "magicka"

Event OnEffectStart(Actor akTarget, Actor akCaster)

	float mag = akCaster.GetActorValue(magicka)
    akCaster.DamageActorValue(magicka, mag * mult)

EndEvent