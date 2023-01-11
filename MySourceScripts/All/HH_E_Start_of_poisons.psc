Scriptname HH_E_Start_of_poisons extends activemagiceffect  

GlobalVariable Property HH_Glob_Poison_Stacs Auto
GlobalVariable Property HH_Glob_PoisonDMGB_Display Auto
GlobalVariable Property HH_Glob_PoisonDMG_Display Auto
GlobalVariable Property SpeedMultDebuffDisplay Auto

Spell Property doomSerpentAbility Auto ; камень змея, 5 стаков вместо 1
Perk Property REQ_Alchemy_ConcentratedPoisons Auto ; +5 при 100 алхимии стак, +1 если камень змея есть

Float Property DotDamage Auto
Float Property InstanceDamage Auto
Float Property SpeedMultDebuff Auto

int Stak_num

Int Function GetStackFromPerk()

	if Game.GetPlayer().HasSpell(doomSerpentAbility)
		return 1
	endif

	float alchemySkill = Game.GetPlayer().GetBaseActorValue("alchemy")

	if alchemySkill >= 100
		return 5
	endif

	if alchemySkill >= 75
		return 4
	endif

	if alchemySkill >= 50
		return 3
	endif

	if alchemySkill >= 25
		return 2
	endif

	return 1

EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)

	HH_Glob_Poison_Stacs.SetValue(0)

	Stak_num = 1

	if Game.GetPlayer().HasSpell(doomSerpentAbility)
		Stak_num = Stak_num + 5
	endif

	if Game.GetPlayer().HasPerk(REQ_Alchemy_ConcentratedPoisons)
		Stak_num = Stak_num + GetStackFromPerk()
	EndIf

	HH_Glob_Poison_Stacs.SetValue(Stak_num)
	HH_Glob_PoisonDMGB_Display.SetValue(InstanceDamage)
	HH_Glob_PoisonDMG_Display.SetValue(DotDamage)
	SpeedMultDebuffDisplay.SetValue(SpeedMultDebuff)

endEvent