Scriptname REQ_QuestRestarter extends Quest
{script state manager for player-ref scripts quest}

Import StringUtil

ReferenceAlias Property AutoUpdater Auto
{ref alias with AutoUpdater script attached}
Message Property InstallationBegins Auto
Message Property SKSE_missing Auto
{message to display if SKSE is missing at all or too old}
Message Property SKSE_broken Auto
{message if SKSE dll and script versions differ}
Message Property NoNewGame Auto
{message if Requiem was installed into an existing non-Requiem save game}
Message Property UpgradeForbidden Auto
{message if an unsupported upgrade is attempted (major version change)}
Message Property DowngradeForbidden Auto
{message if the current plugin version is older than the one used by the savegame}
Message Property DoubleUpdate Auto
{message if Requiem tries to start a second script update in parallel}
Message Property SkyProcMissing Auto
{message if Requiem for the Indifferent is missing and the data is therefore garbage}
Message Property SkyProcOutdated Auto
{message if Requiem for the Indifferent is based on an older Requiem version than installed}
Message Property PCEApatchinvalid Auto
{message if Requiem finds the broken PCEA "patch" (clone, not patch) in the load order}
Message Property BashedPatchFailed Auto
{message if (most likely) a bashed patch has broken the SkyProc-processed levelled lists}
Message Property MehPluginsNotLoaded Auto
{message if Meh123's Perk Reload bugfix or the Requiem SKSE plugin are missing}

GlobalVariable Property VersionActive Auto
{GV indicating the currently active Requiem version (in savegame}
GlobalVariable Property VersionInstalled Auto
{GV indicating the currently installed Requiem version (static in esp)}
GlobalVariable Property VersionIndifferent Auto
{GV indicating the Requiem version the SkyProc patch is based on}
GlobalVariable Property KillSwitchOverride Auto
{constnat GV to temporarily override the killswitch in the update checks, for debug intended only}
LeveledItem Property TestList Auto
{a skyproc-processed list, if a bashed patch has the wrong tags, it will have only 1 entry}

Spell Property HealthRegenStop Auto
{Magic ability on all playable races that should stop natural health regeneration}
GlobalVariable Property NonCriticalWarnOverride Auto
{GV indicating that non-critical warnings, such as races or plugins, should not be displayed}
Message Property RaceWarning Auto
{message if Requiem for the Indifferent is based on an older Requiem version than installed}

Quest Property NewGameCheck Auto
{Update.esm quest 1.4 is used for new game check; if Requiem has just started but this quest was stopped, it means this isn't a new game}
ImageSpaceModifier Property Fadeout Auto
{the blackout effect during initialization or update}
Sound Property InstallationSoundEffect Auto
{the effect used in the blackout effect as described in the init/update messages}

Event OnInit()
	If VersionActive.Value == -1 ; first run
		If !NewGameCheck.IsStopped() ; new game check
			VersionActive.SetValue(0) ; it's a new game
		Else
			VersionActive.SetValue(-2) ; it's not a new game and SetupCheck() will fail as it should
		EndIf
		SetupCheck()
		UnregisterForUpdate() ; this is a special setup check that's not meant to initialize Requiem
	EndIf
EndEvent

;stops the quest, wait a few seconds and restart it to update all alias scripts
Function Restart()
	Self.Stop()
	SetupCheck()
	Utility.Wait(1)
	Self.Start()
	Utility.Wait(1)
	(AutoUpdater as REQ_AutoUpdater).InitScripts()
EndFunction

Function Blackout(Float volume = 1.0)
		; disable saving & controls during first initialization -- such saves are unreliable
		Game.SetInChargen(true, true, false)
		Fadeout.ApplyCrossFade()
		Int SoundInstance = InstallationSoundEffect.Play(Game.GetPlayer())
		Sound.SetInstanceVolume(SoundInstance, volume)
EndFunction

Function CompleteInit(Message ClosingMessage)
	Self.CompleteAllObjectives()
	Self.CompleteQuest()
	UnregisterForAllMenus()
	Int[] subVersions = FormatVersion(VersionActive.GetValueInt())
	String ver = subVersions[0] + "." + subVersions[1] + "." + subVersions[2]
	ver += " - " + Game.GetPlayer().GetDisplayName()
	Game.SetInChargen(false, false, false) ; enable saving & controls again
	ImageSpaceModifier.RemoveCrossFade()
	ClosingMessage.Show()
	Utility.Wait(1)
	Game.SaveGame("Requiem " + ver)
EndFunction

Int[] Function FormatVersion(Int version)
    Int[] subVersions = new Int[3]
    subVersions[0] = version / 10000
    If (subVersions[0] >= 2)
        subVersions[1] = (version % 10000) / 100
    	subVersions[2] =  (version % 10000) % 100
    Else
        subVersions[1] = (version % 10000) / 1000
        subVersions[2] = ((version % 10000) % 1000) / 100
    EndIf
	return subVersions
EndFunction

Event OnStoryChangeLocation(ObjectReference akActor, Location akOldLocation, Location akNewLocation)
	If (akOldLocation != None && VersionActive.GetValueInt() == 0)
		Blackout()
		InstallationBegins.Show()
		SetupCheck()
		Utility.Wait(1)
		(AutoUpdater as REQ_AutoUpdater).InitScripts()
	ElseIf VersionActive.GetValueInt() == 0
		;Utility.Wait(10)
		Self.SetObjectiveDisplayed(0, true)
		Self.Stop()
		Utility.Wait(1)
		RegisterforMenu("InventoryMenu")
		RegisterforMenu("MagicMenu")
	EndIf
EndEvent

Event OnMenuClose(String Menu)
	If !Self.IsRunning() && VersionActive.GetValueInt() == 0
		UnregisterForAllMenus()
		Blackout()
		InstallationBegins.Show()
		SetupCheck()
		Self.Start()
		Utility.Wait(1)
		(AutoUpdater as REQ_AutoUpdater).InitScripts()
	EndIf
EndEvent

; check whether the current setup is suitable for Requiem, if not display a warning and quit to menu
Bool Function SetupCheck()
	bool valid = true
	Int version_skse = SKSE.GetVersionRelease()
	Int version_script = SKSE.GetScriptVersionRelease()
	Int count = 0
	int req_index = Game.GetModByName("Requiem.esp")
	int pcea_clone = Game.GetModByName("Requiem plus PCEA 3-5.esp")
	Int[] subVersionsPlugin = FormatVersion(VersionInstalled.GetValueInt())
    Int[] subVersionsSave = FormatVersion(VersionActive.GetValueInt())
	Bool dependent = False
	; SKSE installation check
	If (version_script < 46)
		SKSE_missing.Show()
		valid = false
	ElseIf (version_skse != version_script || version_script == 0)
		SKSE_broken.Show(version_skse as Float, version_script as Float)
		valid = false
	ElseIf VersionActive.GetValueInt() == -2
	; new game check
		NoNewGame.Show()
		valid = false
	ElseIf (subVersionsSave[0] > 0 && subVersionsSave[0] != subVersionsPlugin[0])
	; unsupported upgrading path
	    UpgradeForbidden.Show(subVersionsPlugin[0], subVersionsPlugin[1], \
		        subVersionsPlugin[2], subVersionsSave[0], subVersionsSave[1], \
		        subVersionsSave[2])
		valid = false
    ElseIf (VersionInstalled.GetValueInt() < VersionActive.GetValueInt())
    ; mid-game downgrades aren't supported
        DowngradeForbidden.Show(subVersionsPlugin[0], subVersionsPlugin[1], \
                subVersionsPlugin[2], subVersionsSave[0], subVersionsSave[1], \
                subVersionsSave[2])
        valid = false
	ElseIf Game.GetModByName("Requiem for the Indifferent.esp") == 255
	; SkyProc patch missing
		SkyProcMissing.Show()
		valid = false
	ElseIf VersionInstalled.GetValueInt() != VersionIndifferent.GetValueInt()
	; SkyProc patch outdated
		SkyProcOutdated.Show()
		valid = false
	ElseIf pcea_clone != 255
	; check for broken PCEA "patch"...
		count = Game.GetModDependencyCount(pcea_clone)
		While count > 0 && !dependent
			count = count - 1
			dependent = req_index == Game.GetNthModDependency(pcea_clone, count)
		EndWhile
		If !dependent
			valid = false
			PCEApatchinvalid.Show()
		EndIf
	ElseIf TestList.GetNumForms() == 1
	; bashed patch with wrong tags for Requiem for the indifferent
		BashedPatchFailed.Show()
		valid = false
	EndIf
	If valid
		CheckRaces()
		CheckSKSEplugins()
	EndIf
	If valid
		RegisterForSingleUpdate(40)
		return true
	ElseIf KillSwitchOverride.getValueInt() != 1
		Utility.Wait(2)
		Game.QuitToMainMenu()
	Else
		return false
	EndIf
EndFunction

Bool Function CheckSKSEplugins()
	If (SKSE.GetPluginVersion("CrashFixPlugin") == -1 || SKSE.GetPluginVersion("BugFixPlugin") == -1)
		If NonCriticalWarnOverride.GetValueInt() != 1
			MehPluginsNotLoaded.Show()
		EndIf
		Return False
	Else
		Return True
	EndIf
EndFunction

Bool Function CheckRaces()
	int count_r = Race.GetNumPlayableRaces()
	; SKSE 1.7.3 has a bug and checks the wrong cache in the function above, this call here is a
	; workaround to fill the cache used incorrectly as a check condition in the function above
	Race.GetRace(0)
	int count_s = 0
	Race currentrace
	bool valid = False
	String unbalanced_races
	String racename
	While count_r > 0
		count_r += -1
		currentrace = Race.GetNthPlayableRace(count_r)
		valid = False
		count_s = currentrace.GetSpellCount()
		While count_s > 0 && !valid
			count_s += -1
			If currentrace.GetNthSpell(count_s) == HealthRegenStop
				valid = True
			EndIf
		EndWhile
		If !valid
			racename = currentrace.GetName()
			If GetLength(unbalanced_races) == 0
				Debug.Trace("[REQ] ERROR: Incorrect playable races found! Dumping list of incorrect races!")
				unbalanced_races = racename
			ElseIf GetLength(unbalanced_races + racename) < 100 ; don't add too many names to prevent truncating the message
				unbalanced_races += ", " + racename
			EndIf
			Debug.Trace("[REQ] INFO: " + racename + " doesn't have the natural health regeneration suppression")
		EndIf
	EndWhile
	If GetLength(unbalanced_races)
		; disable the following until RRO-164 is done :)
		; Debug.Trace("[REQ] INFO: Please note that the Reqtificator provides more extensive race sanity tests")
		If NonCriticalWarnOverride.GetValueInt() != 1
			Debug.Messagebox(StringReplace(RaceWarning.GetName(), "<racenames>", unbalanced_races))
		EndIf
		Return False
	Else
		Return True
	EndIf
EndFunction

String Function StringReplace(String text, String spot, String substitute)
	String result = ""
	Int start = StringUtil.Find(text, spot)
	Int end = start + StringUtil.GetLength(spot)
	If start == -1
		result = text
	Else
		If start > 0
			result = Substring(text, 0, start)
		EndIf
		result += substitute
		result += Substring(text, end, GetLength(text))
	EndIf
	Return result
EndFunction

Event OnUpdate()
	(AutoUpdater as REQ_AutoUpdater).CheckKillswitch()
EndEvent
