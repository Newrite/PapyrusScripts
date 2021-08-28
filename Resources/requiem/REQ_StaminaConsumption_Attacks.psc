Scriptname REQ_StaminaConsumption_Attacks extends REQ_PlayerAlias
{This script is responsible for the stamina drain for normal attacks for ALL actors}

Spell Property StaminaDrain Auto

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
	; Debug.Trace("Actor " + akActor + "has triggered action " + actiontype)
	akActor.AddSpell(StaminaDrain, False)
EndEvent

Event OnPlayerLoadGame()
	RegisterForActorAction(5)
	RegisterForActorAction(0)
EndEvent

Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = True
EndEvent

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
	RegisterForActorAction(5)
	RegisterForActorAction(0)
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = False
EndEvent
