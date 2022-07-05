Scriptname zzzSXPGainExpStatPolling extends Quest

zzzSXPConfig Property XPConfig Auto
zzzSXPController Property XPC Auto
int[] Property SXPGameStats Auto Hidden

string[] SXPQueryGameStat
int[] SXPNGameStat

State Empty
EndState

State Running
Event OnBeginState()
	PollingInit()
	OnUpdate()
EndEvent

Event OnUpdate()
	int iIndex = 0
	int iElement = SXPNGameStat.Length
	While iIndex < iElement
		PollGameStat(iIndex)
		iIndex += 1
	EndWhile
		
	RegisterForSingleUpdate(XPConfig.SXPGeneral[3])
EndEvent

Event OnEndState()
	UnregisterForUpdate()
EndEvent
EndState

Function PollingInit()
	SXPQueryGameStat = new string[41]
	SXPNGameStat = new int[41]
		
	SXPQueryGameStat[0] = "Locations Discovered"
	SXPQueryGameStat[1] = "Dungeons Cleared"
	SXPQueryGameStat[2] = "Standing Stones Found"
	SXPQueryGameStat[3] = "Food Eaten"
	SXPQueryGameStat[4] = "Books Read"
	SXPQueryGameStat[5] = "Horses Owned"
	SXPQueryGameStat[6] = "Houses Owned"
	SXPQueryGameStat[7] = "Stores Invested In"
	SXPQueryGameStat[8] = "Persuasions"
	SXPQueryGameStat[9] = "Bribes"
	SXPQueryGameStat[10] = "Intimidations"
	SXPQueryGameStat[11] = "Diseases Contracted"
	SXPQueryGameStat[12] = "Quests Completed"
	SXPQueryGameStat[13] = "Misc Objectives Completed"
	SXPQueryGameStat[14] = "Main Quests Completed"
	SXPQueryGameStat[15] = "Side Quests Completed"
	SXPQueryGameStat[16] = "The Companions Quests Completed"
	SXPQueryGameStat[17] = "College Of Winterhold Quests Completed"
	SXPQueryGameStat[18] = "Thieves' Guild Quests Completed"
	SXPQueryGameStat[19] = "The Dark Brotherhood Quests Completed"
	SXPQueryGameStat[20] = "Civil War Quests Completed"
	SXPQueryGameStat[21] = "Daedric Quests Completed"
	SXPQueryGameStat[22] = "Questlines Completed"
	SXPQueryGameStat[23] = "Dawnguard Quests Completed"
	SXPQueryGameStat[24] = "Dragonborn Quests Completed"
	SXPQueryGameStat[25] = "Sneak Attacks"
	SXPQueryGameStat[26] = "Brawls Won"
	SXPQueryGameStat[27] = "Dragon Souls Collected"
	SXPQueryGameStat[28] = "Words Of Power Learned"
	SXPQueryGameStat[29] = "Shouts Learned"
	SXPQueryGameStat[30] = "Shouts Mastered"
	SXPQueryGameStat[31] = "Ingredients Harvested"
	SXPQueryGameStat[32] = "Ingredients Eaten"
	SXPQueryGameStat[33] = "Nirnroots Found"
	SXPQueryGameStat[34] = "Murders"
	SXPQueryGameStat[35] = "Trespasses"
	SXPQueryGameStat[36] = "Necks Bitten"
	SXPQueryGameStat[37] = "Souls Trapped"
	SXPQueryGameStat[38] = "Jail Escapes"
	SXPQueryGameStat[39] = "Backstabs"
	SXPQueryGameStat[40] = "Assaults"
		
	int iIndex = 0
	int iElement = SXPNGameStat.Length
	While iIndex < iElement
		SXPNGameStat[iIndex] = Game.QueryStat(SXPQueryGameStat[iIndex])
		iIndex += 1
	EndWhile
EndFunction

Function SetPollingInterval(float fInterval)
	if fInterval > 0.0
		GoToState("Running")
	else
		GoToState("Empty")
	endif
EndFunction

Function PollGameStat(int iIndex)
	int n_old = SXPNGameStat[iIndex]
	int n_new = Game.QueryStat(SXPQueryGameStat[iIndex])
		if ( n_new > n_old )
			int n_sub = n_new - n_old
			float n_xp = SXPGameStats[iIndex] * n_sub
			SXPNGameStat[iIndex] = n_new
			XPC.GainXPMessage(iIndex, n_xp)
		endif
EndFunction

Function SilentIncrement(int iIndex, int iAmount)
	SXPNGameStat[iIndex] = SXPNGameStat[iIndex] + iAmount
EndFunction