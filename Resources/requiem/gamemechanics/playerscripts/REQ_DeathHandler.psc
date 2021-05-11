Scriptname REQ_DeathHandler extends REQ_PlayerAlias
{fade out the game and block automated reload when the player dies}

GlobalVariable Property Disabled Auto
{if this Global is set to true, no special handling of death situations occurs}
ImageSpaceModifier Property fadeout Auto
{the image space modifier to apply when the player died}
Message Property DeathNote Auto
{the message to display to the Player after he died}
REQ_MCM_DataStorage Property mcmdata Auto
{mcm data storage}

Event OnPlayerLoadGame()
	While (!mcmdata.initdone)
		Utility.Wait(0.5)
	EndWhile
	mcmdata.initdone = False
	If (!Disabled.GetValueInt() as Bool)
		Game.SetGameSettingfloat("fPlayerDeathReloadTime", 3600)
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
	If Disabled.GetValueInt() == 0
		fadeout.ApplyCrossFade(5.0)
		Utility.Wait(4.0)
		Deathnote.Show()
	EndIf
EndEvent

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = False
	While (!mcmdata.initdone)
		Utility.Wait(0.5)
	EndWhile
	mcmdata.initdone = False
	If (!Disabled.GetValueInt() as Bool)
		Game.SetGameSettingfloat("fPlayerDeathReloadTime", 3600)
	EndIf
EndEvent

Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = True
EndEvent
