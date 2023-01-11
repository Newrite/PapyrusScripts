Scriptname HH_Script_Alias_GS extends ReferenceAlias  

Event OnPlayerLoadGame()
	int index = 0
	while index < ImperialsRace.Length
		if	ImperialsRace[index] == Game.GetPlayer().GetRace()
			Game.SetGameSettingInt("iAVDhmsLevelup", 7)
		endif
		index = index + 1
	endWhile
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	int index = 0
	while index < ImperialsRace.Length
		if	ImperialsRace[index] == Game.GetPlayer().GetRace()
			Game.SetGameSettingInt("iAVDhmsLevelup", 7)
		endif
		index = index + 1
	endWhile
endEvent


Race[] Property ImperialsRace  Auto  