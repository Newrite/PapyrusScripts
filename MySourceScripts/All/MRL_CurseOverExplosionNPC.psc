Scriptname MRL_CurseOverExplosionNPC extends ActiveMagicEffect
{Активируется когда значение маг усталости достигает сотни.}

Spell Property CursedExplosion auto

string cruseAV = "EnchantingSkillAdvance"
string magicka = "magicka"
string health = "health"

float fConstDamageExplosion = 50.0

Event OnEffectStart(Actor akTarget, Actor akCaster)

	string explosionValueString = health

  float ExplosionValue = akCaster.GetActorValue(explosionValueString) as Float / akCaster.GetActorValuePercentage(explosionValueString) as Float * 0.05

	CursedExplosion.SetNthEffectMagnitude(0, (fConstDamageExplosion + ExplosionValue))
	CursedExplosion.SetNthEffectMagnitude(1, (fConstDamageExplosion + ExplosionValue))

	CursedExplosion.Cast(akCaster, akCaster)
	akCaster.RestoreActorValue(magicka, 10000.0)
	akCaster.ModActorValue(cruseAV, -100.0)

EndEvent