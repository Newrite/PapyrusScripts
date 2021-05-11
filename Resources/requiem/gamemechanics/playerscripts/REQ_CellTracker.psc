Scriptname REQ_CellTracker extends REQ_PlayerAlias
{track player cell to control resetting features, e.g. FastTravel}

GlobalVariable Property FastTravelAllowed Auto
{controls fast travel, updates on cell changes}

Event OnMenuOpen(String MenuName)
	If (!FastTravelAllowed.GetValue())
		Game.EnableFastTravel(False)
		If (Game.GetModByName("Dragonborn.esm") != 255) ;prevents papyrus error
			Quest DLC2TameDragon = Game.GetFormFromFile(0x040179E2, "Dragonborn.esm") as Quest
			Actor TamedDragon = (DLC2TameDragon.GetAlias(0) as ReferenceAlias).GetReference() as Actor
			If (Game.GetPlayer().IsOnMount() && TamedDragon && TamedDragon.IsBeingRidden())
				Game.EnableFastTravel(True) ;the player is riding a dragon
			EndIf
		EndIf
	Else
		Game.EnableFastTravel(True)
	EndIf
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu("MapMenu")
EndEvent

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
    Utility.Wait(0.5)
	If (!FastTravelAllowed.GetValue())
		Game.EnableFastTravel(False)
	Else
		Game.EnableFastTravel(True)
	EndIf
	RegisterForMenu("MapMenu")
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = False
EndEvent

Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
	Game.EnableFastTravel(True)
	UnregisterForAllMenus()
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = True
EndEvent
