Scriptname MRL_CurseOverExplosion extends ActiveMagicEffect
{Активируется когда значение маг усталости достигает сотни.}

Spell Property CursedExplosion auto

string cruseAV = "EnchantingSkillAdvance"

float fConstDamageExplosion = 50.0

Event OnEffectStart(Actor akTarget, Actor akCaster)

    float ExplosionValue = akCaster.GetActorValue("Health") as Float / akCaster.GetActorValuePercentage("Health") as Float * 0.5

	float fDiffMultHPToPCL = Game.GetGameSettingfloat("fDiffMultHPToPCL")

	CursedExplosion.SetNthEffectMagnitude(0, (fConstDamageExplosion + ExplosionValue) / fDiffMultHPToPCL)
	CursedExplosion.SetNthEffectMagnitude(1, (fConstDamageExplosion + ExplosionValue) / fDiffMultHPToPCL)

	CursedExplosion.Cast(akCaster, akCaster)
	akCaster.ModActorValue(cruseAV, -100.0)

EndEvent