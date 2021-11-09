Scriptname MRL_AB_GM_SneakStamina extends ActiveMagicEffect
{Рассчет бонуса скрытной атаки в зависимости от белого запаса сил, минимум 150 белого запаса сил.}

float OldStamina = 0.0

string SneakValue = "sneakskilladvance"

actor Caster

float Function CalcBonus(float iStamina)

	if iStamina >= 140.0 && iStamina < 180.0
		return 1.0
	endif

	if iStamina >= 180.0 && iStamina < 220.0
		return 2.0
	endif

	if iStamina >= 220.0 && iStamina < 260.0
		return 3.0
	endif

	if iStamina >= 260.0 && iStamina < 300.0
		return 4.0
	endif

	if iStamina >= 300.0
		return 5.0
	endif

	return 0.0

EndFunction

Function SetSneakMod(float NewStamina)
	Caster.ModActorValue(SneakValue, -CalcBonus(OldStamina))
	Caster.ModActorValue(SneakValue, CalcBonus(NewStamina))
	OldStamina = NewStamina
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
	OldStamina = akCaster.GetBaseActorValue("stamina")
	Caster = akCaster
	RegisterForMenu("StatsMenu")
EndEvent

Event OnMenuClose(String Menu)

	if Menu == "StatsMenu"

		float Stamina = Caster.GetBaseActorValue("stamina")

		if Stamina >= 140.0
			SetSneakMod(Stamina)
		endif

	endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForMenu("StatsMenu")
EndEvent
