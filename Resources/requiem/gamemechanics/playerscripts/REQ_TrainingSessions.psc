Scriptname REQ_TrainingSessions extends REQ_PlayerAlias
{sets the global flag that disables experience-rate rescaling effects during training sessions}

GlobalVariable Property REQ_Player_Is_Training Auto

Event OnMenuOpen(String menuName)
    REQ_Player_Is_Training.SetValueInt(1)
EndEvent

Event OnMenuClose(String menuName)
    REQ_Player_Is_Training.SetValueInt(0)
EndEvent

Event OnPlayerLoadGame()
    RegisterForMenu("Training Menu")
EndEvent

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
    RegisterForMenu("Training Menu")
	parent.ScriptInit(eventName, strArg, numArg, sender)
EndEvent

Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
    UnregisterForAllMenus()
	parent.ScriptShutDown(eventName, strArg, numArg, sender)
EndEvent