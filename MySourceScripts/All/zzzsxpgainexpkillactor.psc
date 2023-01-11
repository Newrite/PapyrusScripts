ScriptName zzzSXPGainExpKillActor Extends Quest

zzzSXPWorkerKillActor Property XPWorker Auto
Keyword Property MagicInfluenceFrenzy Auto

Event OnStoryKillActor(ObjectReference pVictim, ObjectReference pKiller, Location pLoc, Int nCrime, Int nRelation)
	Stop()
EndEvent