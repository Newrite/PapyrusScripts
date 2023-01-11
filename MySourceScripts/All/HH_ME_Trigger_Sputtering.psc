Scriptname HH_ME_Trigger_Sputtering extends activemagiceffect  


GlobalVariable Property HH_Glob_sputtering_fire Auto
Spell Property HH_SP_sputtering_fire Auto
Spell Property HH_SP_To_Dispel_ME_sputtering Auto
int Staks

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Staks = HH_Glob_sputtering_fire.GetValue() as int
	HH_SP_sputtering_fire.cast(Game.GetPlayer(), akTarget)
	HH_Glob_sputtering_fire.SetValue(Staks - 1) 
	;Debug.MessageBox("open"+HH_Glob_sputtering_fire.GetValue() as int)
	if HH_Glob_sputtering_fire.GetValue() as int < 1
		HH_SP_To_Dispel_ME_sputtering.cast(Game.GetPlayer(), Game.GetPlayer())
	endif
endEvent