scriptName DLC1_QF_DLC1VQ03Vampire_01004C3D extends Quest hidden

objectreference property DLC1VQ03DexionTortureRead auto
referencealias property Alias_Dexion auto
objectreference property DLC1VQ03EnablePriestAndVigilants auto
referencealias property Alias_Spectator7 auto
referencealias property Alias_Spectator1 auto
faction property DLC1VampireFaction auto
referencealias property Alias_Spectator8 auto
objectreference property DLC1VQ02HarkonWaitMarker auto
referencealias property Alias_Spectator4 auto
playervampirequestscript property PlayerVampireQuest auto
objectreference property DLC1_VQ03_DraugrParent auto
objectreference property DLC1ForbearsHoldoutMapMarkerREF auto
referencealias property Alias_VampiresNote auto
objectreference property DLC1VQ03TortureSpectator1 auto
objectreference property DLC1VQ03TortureSpectator8 auto
Quest property DLC1Radiant auto
referencealias property Alias_Harkon auto
scene property DLC1VQ03VampireDawnguardScene auto
referencealias property Alias_Spectator2 auto
objectreference property DLC1VQ03TortureSpectator3 auto
referencealias property Alias_DeadVampire auto
referencealias property Serana auto
referencealias property Alias_Spectator5 auto
faction property DLC1VampireFeedNoCrimeFaction auto
Quest property DLC1VQ01 auto
scene property DLC1VQ03VampireSpeechReactionScene auto
faction property DLC1VampireCrimeFaction auto
objectreference property StandMarker auto
objectreference property DLC1VQ03TortureSpectator5 auto
faction property DLC1DexionThrall auto
referencealias property Alias_Spectator3 auto
objectreference property OpenDungeon auto
referencealias property Alias_DawnguardLieutenant auto
objectreference property DLC1VQ03CampHunters auto
objectreference property DLC1VQ03RoadsideIntact auto
referencealias property Sarcophagus auto
Quest property VQ04 auto
dlc1_npcmentalmodelscript property MM auto
faction property CrimeFactionHaafingar auto
referencealias property Alias_Vanik auto
objectreference property DLC1VQ03DoorEnableMarker auto
locationalias property Alias_ForbearsHoldout auto
referencealias property Alias_Serana auto
scene property DLC1VQ03VampireMothPriestScene auto
referencealias property Alias_DragonBridge auto
Quest property pDLC1VQElder auto
faction property DLC1MothPriestFaction auto
objectreference property DragonBridgeMapMarker auto
globalvariable property PlayerIsVampire auto
Quest property VQ02 auto
objectreference property HallRuined auto
referencealias property Alias_Innkeeper auto
Quest property RNPCDialogueQuest auto
scene property DLC1VQ03VampireHarkonSpeechFindScroll auto
objectreference property DLC1VQ03Stage20SeranaStandMarker auto
referencealias property Alias_Hulda auto
referencealias property Alias_BarrierControl auto
objectreference property DLC1VQ03RoadsideDestroyed auto
objectreference property DLC1TortureSpectator2 auto
referencealias property Alias_SorexVinius auto
objectreference property DLC1VQ03TortureSpectator4 auto
Quest property DialogueFollower auto
objectreference property DLC1VQ03TortureSpectator6 auto
objectreference property DLC1VQ03SeranaTortureSceneStand auto
objectreference property DLC1VQ02HarkonMeetSerana auto
referencealias property Alias_Urag auto
referencealias property Alias_MalkusCorpse auto
objectreference property SeranaRef auto
objectreference property DLC1VQ03TortureSpectator7 auto
objectreference property HallNormal auto
referencealias property Alias_CorpulusVinius auto
referencealias property Alias_Spectator6 auto
referencealias property Alias_BarrierWidget auto
perk property DLC1VampireFeedDexionVampireSeduction auto

function Fragment_3()

	self.SetObjectiveCompleted(20, 1 as Bool)
	self.SetObjectiveDisplayed(23, 1 as Bool, false)
	self.SetObjectiveDisplayed(24, 1 as Bool, false)
	self.SetObjectiveDisplayed(26, 1 as Bool, false)
	DLC1VQ03VampireSpeechReactionScene.Start()
	DLC1VQ03RoadsideDestroyed.Enable(false)
	DLC1VQ03DoorEnableMarker.Enable(false)
	(RNPCDialogueQuest as dlc1vq03rnpcquestscript).LookingForMothPriest = true
endFunction

function Fragment_12()

	Quest __temp = self as Quest
	dlc1vq03vampirevariables kmyQuest = __temp as dlc1vq03vampirevariables
	self.SetObjectiveCompleted(28, 1 as Bool)
	if kmyQuest.VarWagon == 0
		self.SetObjectiveDisplayed(30, true, false)
	endIf
	((self as Quest) as dlc1vq03vampirevariables).VarDragonBridge = 1
	(RNPCDialogueQuest as dlc1vq03rnpcquestscript).LookingForMothPriest = false
endFunction

function Fragment_17()

	self.SetObjectiveCompleted(50, 1 as Bool)
	self.SetObjectiveDisplayed(60, 1 as Bool, false)
endFunction

function Fragment_13()

	Quest __temp = self as Quest
	dlc1vq03mothpriestfightscript kmyQuest = __temp as dlc1vq03mothpriestfightscript
	DLC1_VQ03_DraugrParent.Disable(false)
	Alias_Dexion.TryToEnable()
	DLC1VQ03EnablePriestAndVigilants.Enable(false)
	Alias_Dexion.GetActorReference().AllowBleedoutDialogue(true)
	DLC1VQ03CampHunters.Enable(false)
	DLC1ForbearsHoldoutMapMarkerREF.AddToMap(false)
	DLC1VQ03VampireDawnguardScene.Start()
	Alias_Spectator1.GetActorReference().Enable(false)
	Alias_Spectator2.GetActorReference().Enable(false)
	self.SetObjectiveCompleted(23, true)
	self.SetObjectiveCompleted(24, true)
	self.SetObjectiveCompleted(25, true)
	self.SetObjectiveCompleted(26, true)
	self.SetObjectiveCompleted(28, true)
	self.SetObjectiveCompleted(30, true)
	self.SetObjectiveCompleted(35, true)
	self.SetObjectiveCompleted(37, true)
	self.SetObjectiveDisplayed(38, true, false)
	((self as Quest) as dlc1vq03vampirevariables).VarDragonBridge = 1
	((self as Quest) as dlc1vq03vampirevariables).VarWagon = 1
	((self as Quest) as dlc1vq03vampirevariables).VarBook = 1
endFunction

function Fragment_26()

	game.GetPlayer().AddPerk(DLC1VampireFeedDexionVampireSeduction)
	self.SetObjectiveCompleted(39, true)
	self.SetObjectiveDisplayed(40, true, false)
	if PlayerIsVampire.getValue() != 1 as Float
		debug.Trace(self as String + ": Major badness! Player is not a vampire on the vampire side of the questline!", 0)
	endIf
endFunction

function Fragment_7()

	Alias_Harkon.GetReference().MoveTo(DLC1VQ02HarkonWaitMarker, 0.000000, 0.000000, 0.000000, true)
	Alias_Serana.GetReference().MoveTo(DLC1VQ03Stage20SeranaStandMarker, 0.000000, 0.000000, 0.000000, true)
	self.SetStage(5)
	game.GetPlayer().AddToFaction(DLC1VampireFaction)
	DLC1Radiant.SetStage(10)
endFunction

function Fragment_11()

	self.SetObjectiveCompleted(25, 1 as Bool)
	self.SetObjectiveDisplayed(27, 1 as Bool, false)
endFunction

function Fragment_10()

	self.SetObjectiveCompleted(24, 1 as Bool)
	self.SetObjectiveCompleted(25, 1 as Bool)
	self.SetObjectiveDisplayed(26, 1 as Bool, false)
	self.SetObjectiveDisplayed(28, 1 as Bool, false)
endFunction

function Fragment_15()

	self.SetObjectiveCompleted(38, 1 as Bool)
	self.SetObjectiveCompleted(47, 1 as Bool)
	self.SetObjectiveDisplayed(50, 1 as Bool, false)
	Alias_Dexion.GetActorRef().AddToFaction(DLC1VampireFeedNoCrimeFaction)
	Alias_Dexion.GetActorRef().RemoveFromFaction(DLC1DexionThrall)
	Alias_Dexion.GetActorRef().RemoveFromFaction(DLC1MothPriestFaction)
	Alias_Dexion.GetActorRef().SetActorValue("Confidence", 0 as Float)
endFunction

function Fragment_25()

	Quest __temp = self as Quest
	dlc1vq03mothpriestfightscript kmyQuest = __temp as dlc1vq03mothpriestfightscript
	DLC1VQ03VampireMothPriestScene.Start()
	kmyQuest.StartMothPriestFight()
	self.SetObjectiveCompleted(41, true)
endFunction

function Fragment_21()

	Quest __temp = self as Quest
	dlc1vq03mothpriestfightscript kmyQuest = __temp as dlc1vq03mothpriestfightscript
	self.SetObjectiveDisplayed(10, 1 as Bool, false)
	RNPCDialogueQuest.Start()
	kmyQuest.StartUp()
endFunction

function Fragment_24()

	Quest __temp = self as Quest
	dlc1vq03vampirevariables kmyQuest = __temp as dlc1vq03vampirevariables
	if kmyQuest.VarBook == 0
		self.SetObjectiveDisplayed(37, 1 as Bool, false)
	endIf
	((self as Quest) as dlc1vq03vampirevariables).VarDragonBridge = 1
	((self as Quest) as dlc1vq03vampirevariables).VarWagon = 1
	((self as Quest) as dlc1vq03vampirevariables).VarBook = 1
endFunction

function Fragment_27()

	Quest __temp = self as Quest
	dlc1vq03mothpriestfightscript kmyQuest = __temp as dlc1vq03mothpriestfightscript
	if self.GetStageDone(67) == false
		self.SetObjectiveDisplayed(39, true, false)
	endIf
endFunction

function Fragment_19()

	self.SetObjectiveCompleted(60, 1 as Bool)
	self.SetObjectiveDisplayed(80, 1 as Bool, false)
	Alias_Dexion.GetActorReference().AllowBleedoutDialogue(false)
	DLC1VQ03DexionTortureRead.Disable(false)
endFunction

function Fragment_28()

	Quest __temp = self as Quest
	dlc1vq03mothpriestfightscript kmyQuest = __temp as dlc1vq03mothpriestfightscript
	self.SetObjectiveCompleted(41, true)
	kmyQuest.StartUp()
endFunction

function Fragment_18()

	; Empty function
endFunction

function Fragment_23()

	Quest __temp = self as Quest
	dlc1vq03vampirevariables kmyQuest = __temp as dlc1vq03vampirevariables
	self.SetObjectiveCompleted(24, 1 as Bool)
	self.SetObjectiveCompleted(25, 1 as Bool)
	self.SetObjectiveCompleted(26, 1 as Bool)
	if kmyQuest.VarDragonBridge == 0
		self.SetObjectiveDisplayed(28, 1 as Bool, false)
	endIf
	DragonBridgeMapMarker.AddToMap(false)
endFunction

function Fragment_9()

	self.SetObjectiveDisplayed(25, 1 as Bool, false)
endFunction

function Fragment_22()

	Quest __temp = self as Quest
	dlc1vq03vampirevariables kmyQuest = __temp as dlc1vq03vampirevariables
	self.SetObjectiveCompleted(30, 1 as Bool)
	if kmyQuest.VarBook == 0
		self.SetObjectiveDisplayed(35, 1 as Bool, false)
	endIf
	((self as Quest) as dlc1vq03vampirevariables).VarDragonBridge = 1
	((self as Quest) as dlc1vq03vampirevariables).VarWagon = 1
endFunction

function Fragment_2()

	self.SetObjectiveCompleted(10, 1 as Bool)
	self.SetObjectiveDisplayed(20, 1 as Bool, false)
	DLC1VQ03VampireHarkonSpeechFindScroll.Start()
endFunction

function Fragment_35()

	Quest __temp = self as Quest
	dlc1vq03mothpriestfightscript kmyQuest = __temp as dlc1vq03mothpriestfightscript
	kmyQuest.ClearNoRecovery()
endFunction

function Fragment_14()

	Quest __temp = self as Quest
	dlc1vq03mothpriestfightscript kmyQuest = __temp as dlc1vq03mothpriestfightscript
	self.SetObjectiveCompleted(45, true)
	self.SetObjectiveDisplayed(47, true, false)
	game.GetPlayer().AddToFaction(DLC1DexionThrall)
	Alias_Dexion.GetActorRef().StopCombat()
endFunction

function Fragment_20()

endFunction

function Fragment_1()

	self.SetObjectiveCompleted(80, 1 as Bool)
	RNPCDialogueQuest.Stop()
	VQ04.SetStage(10)
	pDLC1VQElder.SetStage(10)
	DLC1VQ03RoadsideDestroyed.Disable(false)
	self.Stop()
endFunction

function Fragment_16()

	Alias_Harkon.GetReference().MoveTo(DLC1VQ02HarkonMeetSerana, 0.000000, 0.000000, 0.000000, true)
	Alias_Dexion.GetReference().MoveTo(DLC1VQ03DexionTortureRead, 0.000000, 0.000000, 0.000000, true)
	Alias_Spectator1.GetReference().MoveTo(DLC1VQ03TortureSpectator1, 0.000000, 0.000000, 0.000000, true)
	Alias_Spectator2.GetReference().MoveTo(DLC1TortureSpectator2, 0.000000, 0.000000, 0.000000, true)
	Alias_Spectator3.GetReference().MoveTo(DLC1VQ03TortureSpectator3, 0.000000, 0.000000, 0.000000, true)
	Alias_Spectator4.GetReference().MoveTo(DLC1VQ03TortureSpectator4, 0.000000, 0.000000, 0.000000, true)
	Alias_Spectator5.GetReference().MoveTo(DLC1VQ03TortureSpectator5, 0.000000, 0.000000, 0.000000, true)
	Alias_Spectator6.GetReference().MoveTo(DLC1VQ03TortureSpectator6, 0.000000, 0.000000, 0.000000, true)
	Alias_Spectator7.GetReference().MoveTo(DLC1VQ03TortureSpectator7, 0.000000, 0.000000, 0.000000, true)
	Alias_Spectator8.GetReference().MoveTo(DLC1VQ03TortureSpectator8, 0.000000, 0.000000, 0.000000, true)
endFunction
