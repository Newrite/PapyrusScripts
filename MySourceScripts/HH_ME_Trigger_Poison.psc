Scriptname HH_ME_Trigger_Poison extends activemagiceffect  

GlobalVariable Property HH_Glob_Poison_Stacs Auto
GlobalVariable Property HH_Glob_PoisonDMGB_Display Auto
GlobalVariable Property HH_Glob_PoisonDMG_Display Auto
Spell Property HH_SP_To_Dispel_ME_poisons Auto
Spell Property HH_Spell_damage_Poison Auto
int Staks
float DMG
float DMG_B

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Float TargetPoisonResist = akTarget.GetActorValue("PoisonResist") 
	if TargetPoisonResist>100.0
		TargetPoisonResist=100.0
	endIf
	DMG = HH_Glob_PoisonDMG_Display.GetValue() * 1.0
	DMG_B = HH_Glob_PoisonDMGB_Display.GetValue() * 1.0
	Staks = HH_Glob_Poison_Stacs.GetValue() as int
	DMG=DMG*(1-(TargetPoisonResist/100.0))
	DMG_B=DMG_B*(1-(TargetPoisonResist/100.0))
	HH_Spell_damage_Poison.SetNthEffectMagnitude(0, DMG)
	HH_Spell_damage_Poison.SetNthEffectMagnitude(1, DMG_B)
	HH_Glob_Poison_Stacs.SetValue(Staks - 1) 
	HH_Spell_damage_Poison.cast(Game.GetPlayer(), akTarget)
	;Debug.MessageBox("open"+HH_Glob_sputtering_fire.GetValue() as int)
	if HH_Glob_Poison_Stacs.GetValue() as int < 1
		HH_SP_To_Dispel_ME_poisons.cast(Game.GetPlayer(), Game.GetPlayer())
	endif
endEvent