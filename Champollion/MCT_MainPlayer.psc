;/ Decompiled by Champollion V1.0.1
Source   : MCT_MainPlayer.psc
Modified : 2021-01-13 04:10:19
Compiled : 2021-01-13 04:10:20
User     : george
Computer : GAME-PC
/;
scriptName MCT_MainPlayer extends ReferenceAlias

;-- Properties --------------------------------------
mct_main property mainQuest auto
mct_mcm property mcmQuest auto
mct_sneakkeylistener property sneakKeyListener auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnPlayerLoadGame()

	sneakKeyListener.registerKeys()
	mainQuest.playerLoadGame()
	mcmQuest.OnGameReload()
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState
