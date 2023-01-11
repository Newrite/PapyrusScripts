Scriptname HH_Script_DRAGONSOULS_MASTERY extends ReferenceAlias  

Quest Property hh_Ench_Quest_DragonSouls Auto
GlobalVariable Property HH_ENCH_Mastery_Global Auto
GlobalVariable Property HH_ENCH_Swithc_Global Auto
Float Property dargonsouls Auto
Explosion Property MAGDragonPowerAbsorbExplosion Auto


Event OnInit() ; This event will run once, when the script is initialized
	RegisterForMenu("Crafting Menu")
	RegisterForTrackedStatsEvent()
EndEvent

;Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
;If (akBaseItem as SoulGem) && HH_ENCH_Swithc_Global.GetValue()==1
	
;endif
;endEvent

Event OnMenuClose(String MenuName)
If MenuName == "Crafting Menu"
	HH_ENCH_Swithc_Global.SetValue(0)
	;Debug.Notification("Ну нет так нет")
	hh_Ench_Quest_DragonSouls.Stop()
EndIf
EndEvent

Event OnTrackedStatsEvent(string asStatFilter, int aiStatValue)
    if (asStatFilter == "Magic Items Made") && hh_Ench_Quest_DragonSouls.IsRunning()
		Game.GetPlayer().PlaceAtMe(MAGDragonPowerAbsorbExplosion as form, 1, false, false)
		HH_ENCH_Swithc_Global.SetValue(0) 
		Game.GetPlayer().ModAV("DragonSouls", -dargonsouls)
		HH_ENCH_Mastery_Global.SetValue(0)
		Debug.MessageBox("Вы сотворили великий артефакт, вложив в него древнюю магию драконорожденного")
		Game.GetPlayer().PushActorAway(Game.GetPlayer(), 1)
		hh_Ench_Quest_DragonSouls.Stop()
    endif
endEvent
