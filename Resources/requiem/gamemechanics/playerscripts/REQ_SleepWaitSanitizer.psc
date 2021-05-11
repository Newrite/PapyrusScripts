Scriptname REQ_SleepWaitSanitizer extends REQ_PlayerAlias
{DEPRECATED: this feature has been retracted in Requiem 2.0.2}

Message Property SleepWaitAbuseMessage Auto
GlobalVariable Property SleepWaitAbuseMessageDisplayed Auto

Float HealRateDamage = 0.0
Float MagickaRateDamage = 0.0
Float SleepWaitStart ; when we start to sleep/wait
Float SleepWaitSince = 0.0 ; when we last finished our sleep/waiting
Float Activity = 0.0 ; hours of normal activity after the last sleep/wait
Float MaxPool = 10.0
Float MinPool = -3.0
Float MinorPenalty = 0.8
Float MajorPenalty = 0.95
Float CurrentHealth
Float CurrentMagicka

; this event will be triggered with nonzero damage values only if the user reloads a wait autosave
Event OnPlayerLoadGame()
	Player.RestoreActorValue("HealRateMult", HealRateDamage)
	Player.RestoreActorValue("MagickaRateMult", MagickaRateDamage)
	HealRateDamage = 0.0
    MagickaRateDamage = 0.0
EndEvent

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
	HealRateDamage = 0.0
    MagickaRateDamage = 0.0
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(Self)
	UpdateControl.ShutdownReady[index] = False
EndEvent

Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
	UnregisterForMenu("Sleep/Wait Menu")
	UnregisterForSleep()
	Player.RestoreActorValue("HealRateMult", HealRateDamage)
    Player.RestoreActorValue("MagickaRateMult", MagickaRateDamage)
	HealRateDamage = 0.0
    MagickaRateDamage = 0.0
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(Self)
	UpdateControl.ShutdownReady[index] = True
EndEvent