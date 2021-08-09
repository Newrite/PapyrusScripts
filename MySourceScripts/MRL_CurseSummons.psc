Scriptname MRL_CurseSummons extends Actor  
{Увеличивает проклятье на величину в проперти, при смерти суммона от кого-то, даже от игрока, и только если у суммона меньше 0.1 единиц здоровья во время смерти.}

Float Property curseValue auto
Spell Property CursedExplosion auto

string cruseAV = "EnchantingSkillAdvance"

float fConstDamageExplosion = 50.0

Function OverExplosion()

	float ExplosionValue = Game.GetPlayer().GetActorValue("Health") as Float / Game.GetPlayer().GetActorValuePercentage("Health") as Float * 0.5

	float fDiffMultHPToPCL = Game.GetGameSettingfloat("fDiffMultHPToPCL")

	CursedExplosion.SetNthEffectMagnitude(0, (fConstDamageExplosion + ExplosionValue) / fDiffMultHPToPCL)
	CursedExplosion.SetNthEffectMagnitude(1, (fConstDamageExplosion + ExplosionValue) / fDiffMultHPToPCL)

	CursedExplosion.Cast(Game.GetPlayer(), Game.GetPlayer())
	Game.GetPlayer().ModActorValue(cruseAV, -100.0)

EndFunction

Event OnDying(Actor akKiller)
	if akKiller && (self.GetActorValue("Health") < 0.1)
		Game.GetPlayer().ModActorValue(cruseAV, curseValue * 0.75)

		Utility.Wait(0.5)

		if Game.GetPlayer().GetActorValue(cruseAV) as Float >= 100.0
			OverExplosion()
		endif

	endif
EndEvent


