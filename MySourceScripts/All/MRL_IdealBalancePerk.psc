Scriptname MRL_IdealBalancePerk extends ActiveMagicEffect
{Рассчет бонуса идеального баланса.}

GlobalVariable Property gCostAndAttack Auto
GlobalVariable Property gResist Auto

float oldBreakPoint = 0.0

string RestorationMod = "RestorationMod"
string IllusionMod = "IllusionMod"
string ConjurationMod = "ConjurationMod"
string AlterationMod = "AlterationMod"
string DestructionMod = "DestructionMod"

string OneHandedPowerMod = "OneHandedPowerMod"
string TwoHandedPowerMod = "TwoHandedPowerMod"
string MarksmanPowerMod = "MarksmanPowerMod"
string UnarmedDamage = "UnarmedDamage"

float breakMod = 0.5

actor Caster

Function SetGlobals(int valueCost, int valueResist)
	gCostAndAttack.SetValueInt(valueCost)
	gResist.SetValueInt(valueResist)
EndFunction

float Function CalcBonus(float iStamina, float iHealth, float iMagicka)

	if iStamina >= 150.0 && iHealth >= 150 && iMagicka >= 150
		SetGlobals(25, 10)
		return 50.0
	endif
	if iStamina >= 140.0 && iHealth >= 140 && iMagicka >= 140
		SetGlobals(20, 8)
		return 40.0
	endif
	if iStamina >= 130.0 && iHealth >= 130 && iMagicka >= 130
		SetGlobals(15, 6)
		return 30.0
	endif
	if iStamina >= 120.0 && iHealth >= 120 && iMagicka >= 120
		SetGlobals(10, 4)
		return 20.0
	endif
	if iStamina >= 110.0 && iHealth >= 110 && iMagicka >= 110
		SetGlobals(5, 2)
		return 10.0
	endif

	SetGlobals(0, 0)
	return 0.0

EndFunction

Function ChangeValues(float modifer)
	Caster.ModActorValue(RestorationMod, modifer)
	Caster.ModActorValue(IllusionMod, modifer)
	Caster.ModActorValue(ConjurationMod, modifer)
	Caster.ModActorValue(DestructionMod, modifer)
	Caster.ModActorValue(AlterationMod, modifer)

	Caster.ModActorValue(OneHandedPowerMod, modifer)
	Caster.ModActorValue(TwoHandedPowerMod, modifer)
	Caster.ModActorValue(MarksmanPowerMod, modifer)
	Caster.ModActorValue(UnarmedDamage, modifer)
EndFunction

Function SetNewStats(float newBreakPoint)
	ChangeValues(-1.0 * (oldBreakPoint * breakMod))
	ChangeValues(newBreakPoint * breakMod)
	oldBreakPoint = newBreakPoint
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
	float breakPoint = CalcBonus(Caster.GetBaseActorValue("stamina"), Caster.GetBaseActorValue("health"), Caster.GetBaseActorValue("magicka"))
	if breakPoint >= 10.0
		SetNewStats(breakPoint)
	endif
	Caster = akCaster
	RegisterForMenu("StatsMenu")
EndEvent

Event OnMenuClose(String Menu)

	if Menu == "StatsMenu"

		float breakPoint = CalcBonus(Caster.GetBaseActorValue("stamina"), Caster.GetBaseActorValue("health"), Caster.GetBaseActorValue("magicka"))

		if breakPoint >= 10.0
			SetNewStats(breakPoint)
		endif

	endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForMenu("StatsMenu")
EndEvent
