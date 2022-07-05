Scriptname zzzSXPHelperMagicEffect extends activemagiceffect

zzzSXPGainExpStatPolling Property XPoll Auto
zzzSXPController Property XPC Auto
Quest Property zzzSXPHelperStealHorse Auto
ReferenceAlias Property StolenHorse Auto
Faction Property zzzSXPHorseExcludeFaction Auto

float fTimeDifference = 0.0
int iStolenHorse = 0

Event OnEffectStart(Actor akTarget, Actor akCaster)
	fTimeDifference = Utility.GetCurrentGameTime()
	iStolenHorse = Game.QueryStat("Horses Stolen") - iStolenHorse
	if iStolenHorse > 0
		zzzSXPHelperStealHorse.Start()
		Actor Horse = StolenHorse.GetReference() as Actor
		if Horse != None
			if !Horse.IsInFaction(zzzSXPHorseExcludeFaction)
				Horse.AddToFaction(zzzSXPHorseExcludeFaction)
				XPC.GainXPMessage(41, XPoll.SXPGameStats[41])
			endif
		endif
		zzzSXPHelperStealHorse.Stop()
	endif
EndEvent
 
Event OnEffectFinish(Actor akTarget, Actor akCaster)
	fTimeDifference = (Utility.GetCurrentGameTime() - fTimeDifference) * 24.0
	iStolenHorse = Game.QueryStat("Horses Stolen")
	int iTimeDifference = Math.Floor(fTimeDifference)
	int i_xp = iTimeDifference * XPoll.SXPGameStats[42]
	
	if i_xp > 0
		XPC.GainXPMessage(42, i_xp)
	endif
EndEvent
