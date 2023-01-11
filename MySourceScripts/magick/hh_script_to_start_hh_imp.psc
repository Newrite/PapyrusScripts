Scriptname HH_script_to_start_HH_imp extends ReferenceAlias  

Quest Property HH_Quest  Auto  

Quest Property HH_Quest_this  Auto  

Race[] Property ImperialsRace  Auto  


Event OnInit()
	RegisterForMenu("RaceSex Menu")
EndEvent
 
Event OnMenuClose(String MenuName)
	If MenuName == "RaceSex Menu"
		int index = 0
		while index < ImperialsRace.Length
			if	ImperialsRace[index] == Game.GetPlayer().GetRace()
				game.ModPerkPoints(1)
				HH_Quest.Start()
				HH_Quest_this.Stop()
			endif
			index = index + 1
		endWhile
	EndIf
EndEvent

Event OnPlayerLoadGame()
		Game.SetGameSettingInt("iAVDhmsLevelup", 5)
		;Debug.MessageBox("Игру загрузил НЕ имперец")
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		;Debug.MessageBox("Локацию сменил НЕимперец")
		Game.SetGameSettingInt("iAVDhmsLevelup", 5)
endEvent