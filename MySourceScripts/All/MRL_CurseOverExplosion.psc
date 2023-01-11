Scriptname MRL_CurseOverExplosion extends ActiveMagicEffect
{Активируется когда значение маг усталости достигает сотни.}

Spell Property CursedExplosion auto
Keyword Property HetotTome Auto

string cruseAV = "EnchantingSkillAdvance"
string magicka = "magicka"
string health = "health"

float fConstDamageExplosion = 50.0

Event OnEffectStart(Actor akTarget, Actor akCaster)

	string explosionValueString = health
	float explosionMult = 0.5

	if akTarget.WornHasKeyword(HetotTome)
		explosionValueString = magicka
		explosionMult = 1.0
	endif

  float ExplosionValue = akCaster.GetActorValue(explosionValueString) as Float / akCaster.GetActorValuePercentage(explosionValueString) as Float * explosionMult

	float fDiffMultHPToPCL = Game.GetGameSettingfloat("fDiffMultHPToPCL")

	CursedExplosion.SetNthEffectMagnitude(0, (fConstDamageExplosion + ExplosionValue) / fDiffMultHPToPCL)
	CursedExplosion.SetNthEffectMagnitude(1, (fConstDamageExplosion + ExplosionValue) / fDiffMultHPToPCL)

	CursedExplosion.Cast(akCaster, akCaster)
	akCaster.RestoreActorValue(magicka, 10000.0)
	akCaster.ModActorValue(cruseAV, -100.0)

EndEvent