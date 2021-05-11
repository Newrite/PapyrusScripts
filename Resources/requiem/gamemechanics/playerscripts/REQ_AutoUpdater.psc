Scriptname REQ_AutoUpdater extends ReferenceAlias
{auto-update routine for scripts attached to the player via quest alias}

Bool[] Property ShutdownReady Auto
{status of the individual scripts, should initially contain only True}
Alias[] Property Aliases Auto
{a list of all aliases managed by this Update-Manager}
REQ_PlayerAlias[] Property Scripts Auto
{a list of all scripts managed by this Update-Manager; needs same length as Aliases but none entries}

GlobalVariable Property Version Auto
GlobalVariable Property VersionInstalled Auto
Message Property UpdateBegins Auto
Message Property UpdateDone Auto
Message Property UpdateFailed Auto
Message Property InstallationDone Auto
Quest Property DummyItems Auto

Function InitScripts()
	Int count = 0
	DummyItems.start()
	While (count < Scripts.Length)
		Scripts[count] = Aliases[count] as REQ_PlayerAlias
		Scripts[count].RegisterForModEvent("ScriptShutDown", "ScriptShutDown")
		Scripts[count].RegisterForModEvent("ScriptInit", "ScriptInit")
		count += 1
	EndWhile
	Utility.Wait(5.0)
	SendModEvent("ScriptInit")
	RegisterForSingleUpdate(1)
EndFunction

Function CheckKillswitch()
	int count = 0
	If ( ShutdownReady.find(True) >= 0 )
		Debug.Trace("[REQ] ERROR: Script Init Failed! Dumping Script States!")
		While count < Scripts.Length
			Debug.Trace("[REQ] INFO: Script Alias " + Aliases[count].GetName() + " - ready: " + !ShutdownReady[count])
			count += 1
		EndWhile
		UpdateFailed.Show()
		Game.QuitToMainMenu()
	EndIf
EndFunction

Event OnPlayerLoadGame()
	If VersionInstalled.GetValue() == 0
		(GetOwningQuest() as REQ_QuestRestarter).SetupCheck()
		(GetOwningQuest() as REQ_QuestRestarter).UnregisterForUpdate() ; this isn't for update, don't worry if we take our time
		Return
	EndIf
	Game.SetInChargen(true, true, false) ; disable saving during reload initialization -- such saves are unreliable
	If ( Version.GetValue() > VersionInstalled.GetValue() )
		(GetOwningQuest() as REQ_QuestRestarter).Blackout(0.5) ; blackout stuff and player controls block are started there and ended in REQ_QuestRestarter as well
		UpdateBegins.Show()
	EndIf
	Int count = 0
	While (count < Scripts.Length)
		Scripts[count].RegisterForModEvent("ScriptShutDown", "ScriptShutDown")
		Scripts[count].RegisterForModEvent("ScriptInit", "ScriptInit")
		count += 1
	EndWhile
	If ( Version.GetValue() != VersionInstalled.GetValue() )
		SendModEvent("ScriptShutDown")
		Self.GotoState("ShutDown")
		RegisterForSingleUpdate(1)
	Else
	    (GetOwningQuest() as REQ_QuestRestarter).SetupCheck()
		Game.SetInChargen(false, false, false) ; enable saves again
	EndIf
EndEvent

State Shutdown

	Event OnUpdate()
		If ( ShutdownReady.find(False) < 0 )
			Self.GotoState("")
			UnregisterForUpdate()
			Game.SetGameSettingFloat("fLevelUpCarryWeightMod",0.0)
			DummyItems.stop()
			(GetOwningQuest() as REQ_QuestRestarter).Restart()
		Else
			RegisterForSingleUpdate(1)
		EndIf
	EndEvent
	
EndState

Event OnUpdate()
	If ( ShutdownReady.find(True) < 0 )
		UnregisterForUpdate()
		Message ClosingMessage = UpdateDone
		If VersionInstalled.Value == 0
			ClosingMessage = InstallationDone
		EndIf	
		VersionInstalled.SetValue(Version.GetValue())
		(GetOwningQuest() as REQ_QuestRestarter).CompleteInit(ClosingMessage)
	Else
		RegisterForSingleUpdate(1)
	EndIf
EndEvent
