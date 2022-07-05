Scriptname HH_SCR_DRAGONSOULS_MASTERY extends Quest  

Quest Property hh_Ench_Quest_DragonSouls Auto
GlobalVariable Property HH_ENCH_Mastery_Global Auto
GlobalVariable Property HH_ENCH_Swithc_Global Auto
Float Property dargonsouls Auto

Explosion Property MAGDragonPowerAbsorbExplosion Auto

Function BeginEnchanting()
	RegisterForMenu("Crafting Menu")
	RegisterForTrackedStatsEvent()
	;Debug.Notification("Старр")
EndFunction

Event OnMenuClose(String MenuName)
	If MenuName == "Crafting Menu"
		HH_ENCH_Swithc_Global.SetValue(0)
		;Debug.Notification("Ну нет так нет")
		hh_Ench_Quest_DragonSouls.SetCurrentStageID(10)
	EndIf
EndEvent

Event OnTrackedStatsEvent(string asStatFilter, int aiStatValue)
    if (asStatFilter == "Magic Items Made") && hh_Ench_Quest_DragonSouls.IsRunning() && HH_ENCH_Mastery_Global.GetValue() == 3.0
		Game.GetPlayer().PlaceAtMe(MAGDragonPowerAbsorbExplosion as form, 1, false, false)
		HH_ENCH_Swithc_Global.SetValue(0) 
		Game.GetPlayer().ModAV("DragonSouls", -dargonsouls)
		HH_ENCH_Mastery_Global.SetValue(0)
		Debug.MessageBox("Вы сотворили великий артефакт, вложив в него древнюю магию драконорожденного")
		Game.GetPlayer().PushActorAway(Game.GetPlayer(), 1)
		hh_Ench_Quest_DragonSouls.SetCurrentStageID(10)
    endif
endEvent