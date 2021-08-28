Scriptname REQ_PlayerAlias extends ReferenceAlias
{template for reference alias scripts performing player-specific tasks}

Actor Property Player Auto
{will be filled automatically on start-up}

Event OnInit()
	Player = Game.GetPlayer()
EndEvent

;this function should do all the cleaning necessary before the script can safely be removed from the player
Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = True
EndEvent

;this function should contain anything normally written in the OnInit event block
Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = False
EndEvent
