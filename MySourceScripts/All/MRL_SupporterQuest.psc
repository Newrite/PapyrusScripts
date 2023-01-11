Scriptname MRL_SupporterQuest extends Quest  

GlobalVariable Property GameSettingDamageToPlayer Auto
GlobalVariable Property GameSettingDamageByPlayer Auto
Spell Property SpellAnimationHook Auto

Function SetGlobals()
	GameSettingDamageByPlayer.SetValue(Game.GetGameSettingfloat("fDiffMultHPByPCL"))
	GameSettingDamageToPlayer.SetValue(Game.GetGameSettingfloat("fDiffMultHPToPCL"))
EndFunction

Event OnInit()
	Utility.Wait(5.0)
	RegisterForMenu("Main Menu")
	RegisterForMenu("StatsMenu")
	Game.GetPlayer().AddSpell(SpellAnimationHook, false)
	SetGlobals()
EndEvent

Event OnMenuClose(string menuName)
	if menuName == "Main Menu" || menuName == "StatsMenu"
		SetGlobals()
	endif
EndEvent