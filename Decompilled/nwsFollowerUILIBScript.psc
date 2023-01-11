;/ Decompiled by Champollion V1.0.1
Source   : nwsFollowerUILIBScript.psc
Modified : 2021-09-15 04:04:15
Compiled : 2021-09-15 04:05:14
User     : nethe
Computer : DESKTOP-DNDELIE
/;
scriptName nwsFollowerUILIBScript extends Quest

;-- Properties --------------------------------------
globalvariable property GameDaysPassed auto
Int property UIType auto hidden
globalvariable property nwsChestAllowed auto
nwsfollowermountsscript property mountScript auto
actor property UIspellTarget auto hidden
Quest property nwsFollowerHistory auto
nwsfollowerhomescript property homeScript auto
Int property isRetreat auto hidden
Bool property UIAll auto hidden
String[] property actSkillStr auto hidden
Int property UIPos0 auto hidden
Int property UIShowAttackMsg auto hidden
nwsfollowerfavscript property favScript auto
actor property myPlayer auto
nwsfollowervariablescript property varScript auto
actor property UIActor auto hidden
Quest property nwsFollowerXStorage auto
nwsfollowermcmscript property mcmScript auto
Quest property nwsFollowerSettings auto
globalvariable property nwsChestPort auto
referencealias property UIAlias auto hidden
nwsfollowercontrollerscript property controlScript auto
nwsfollowersetsscript property setsScript auto
nwsfollowersandboxscript property boxScript auto
nwsfollowerstoragescript property storageScript auto
nwsfollowerhistoryscript property historyScript auto

;-- Variables ---------------------------------------
Int UIMagicka
Int UIStamina
Int UIFolCnt
Int UIHeath
Int UIint
Int UIPick
Bool tookTorches
String[] UIChoices
Int[] UISlots
Int favPick

;-- Functions ---------------------------------------

function DisplayLooting()

	Int myRank = -1
	if UIActor.IsInFaction(varScript.nwsFF_GatherFac)
		myRank = UIActor.GetFactionRank(varScript.nwsFF_GatherFac)
	endIf
	if myRank == -1
		UIChoices[UIPos0 + 5] = "$FF_LootingTypeOff"
	elseIf myRank == 0 || myRank == 11 || myRank == 22
		UIChoices[UIPos0 + 5] = "$FF_LootingType0"
	elseIf myRank == 1 || myRank == 12 || myRank == 23
		UIChoices[UIPos0 + 5] = "$FF_LootingType1"
	elseIf myRank == 2 || myRank == 13 || myRank == 24
		UIChoices[UIPos0 + 5] = "$FF_LootingType2"
	elseIf myRank == 3 || myRank == 14 || myRank == 25
		UIChoices[UIPos0 + 5] = "$FF_LootingType3"
	elseIf myRank == 4 || myRank == 15 || myRank == 26
		UIChoices[UIPos0 + 5] = "$FF_LootingType4"
	elseIf myRank == 5 || myRank == 16 || myRank == 27
		UIChoices[UIPos0 + 5] = "$FF_LootingType5"
	elseIf myRank == 6 || myRank == 17 || myRank == 28
		UIChoices[UIPos0 + 5] = "$FF_LootingType6"
	elseIf myRank == 7 || myRank == 18 || myRank == 29
		UIChoices[UIPos0 + 5] = "$FF_LootingType7"
	elseIf myRank == 8 || myRank == 19 || myRank == 30
		UIChoices[UIPos0 + 5] = "$FF_LootingType8"
	elseIf myRank == 9 || myRank == 20 || myRank == 31
		UIChoices[UIPos0 + 5] = "$FF_LootingType9"
	elseIf myRank == 10 || myRank == 21 || myRank == 32
		UIChoices[UIPos0 + 5] = "$FF_LootingType10"
	endIf
	if myRank >= 22
		UIChoices[UIPos0 + 6] = "$FF_SendLootType2"
	elseIf myRank >= 11
		if UIActor.IsInFaction(setsScript.nwsFF_storedFac)
			UIChoices[UIPos0 + 6] = "$FF_SendLootType1alt"
		else
			UIChoices[UIPos0 + 6] = "$FF_SendLootType1"
		endIf
	elseIf myRank > -1
		UIChoices[UIPos0 + 6] = "$FF_SendLootType0"
	else
		UIChoices[UIPos0 + 6] = "$FF_SendLootTypeOff"
	endIf
endFunction

function UICmdOneNPC()

	formList rdoList
	Int UICount = 0
	if UIspellTarget != none
		UICount = 1
	endIf
	UIChoices = utility.CreateStringArray(7 + UICount, "")
	UIChoices[0] = "Health: " + UIHeath as String + ", Magicka: " + UIMagicka as String + ", Stamina: " + UIStamina as String + " [x]"
	String classTxt = UIActor.GetActorBase().GetClass().GetName()
	if classTxt == "dremora"
		classTxt = "Warrior"
	endIf
	UIChoices[1] = "Level " + UIActor.GetLevel() as String + " " + classTxt + " [x]"
	if UIspellTarget != none
		UIChoices[2] = "Followers Attack: " + self.GetActorName(UIspellTarget)
	endIf
	Bool allowVoice = false
	form voiceForm = UIActor.GetVoiceType() as form
	if varScript.rdoActive && voiceForm as Bool
		rdoList = game.GetFormFromFile(1144444, "Relationship Dialogue Overhaul.esp") as formList
		if rdoList.Find(voiceForm) != -1
			allowVoice = true
		endIf
	endIf
	if varScript.VoicesFollowerAll.Find(voiceForm) != -1 || allowVoice
		UIChoices[UICount + 2] = "$FF_ForceFollower"
	else
		UIChoices[UICount + 2] = "$FF_NoForceFollower"
	endIf
	allowVoice = false
	if varScript.rdoActive
		rdoList = game.GetFormFromFile(1144443, "Relationship Dialogue Overhaul.esp") as formList
		if rdoList.Find(voiceForm) != -1
			allowVoice = true
		endIf
	endIf
	if varScript.VoicesMarriageAll.Find(voiceForm) != -1 || allowVoice
		UIChoices[UICount + 3] = "$FF_ForceMarry"
	else
		UIChoices[UICount + 3] = "$FF_NoForceMarry"
	endIf
	UIChoices[UICount + 4] = "$FF_SkillMenu"
	UIChoices[UICount + 5] = "$FF_SpellMenu"
	UIChoices[UICount + 6] = "$FF_SubAll"
	UIPick = ((self as form) as uilib_1).ShowList(self.GetActorName(UIActor), UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == UICount + 1
			if UIspellTarget != none
				varScript.nwsAttackTargetSpell.Cast(myPlayer as objectreference, none)
			endIf
		elseIf UIPick == UICount + 2
			controlScript.ForceFollower()
		elseIf UIPick == UICount + 3
			controlScript.ForceMarry()
		elseIf UIPick == UICount + 4
			self.UISkills()
		elseIf UIPick == UICount + 5
			self.UISpells()
		elseIf UIPick == UICount + 6
			self.UICmdAllMenu()
		endIf
	endIf
endFunction

function UIWaitAllSub()

	UIChoices = utility.CreateStringArray(5, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_AllWait"
	UIChoices[2] = "$FF_AllFollowM"
	UIChoices[3] = "$FF_AllBehind"
	UIChoices[4] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_WaitMenu", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			controlScript.WaitAll()
		elseIf UIPick == 2
			controlScript.FollowAll()
		elseIf UIPick == 3
			controlScript.BehindAllEffect()
		elseIf UIPick == 4
			self.UICmdAllMenu()
		endIf
	endIf
endFunction

function UIHomeBase()

	UIChoices = utility.CreateStringArray(23, "")
	UIChoices[0] = "$FF_Exit"
	Int hInd = 0
	Int hLoc = -1
	if UIActor.IsInFaction(varScript.nwsFF_HomeFac)
		hLoc = UIActor.GetFactionRank(varScript.nwsFF_HomeFac)
	endIf
	Int maxNumBases = homeScript.maxBases
	while hInd < maxNumBases
		String homeName
		if hInd < 9
			homeName = "0" + (hInd + 1) as String + " - " + homeScript.nwsHBNames[hInd]
		else
			homeName = (hInd + 1) as String + " - " + homeScript.nwsHBNames[hInd]
		endIf
		if hLoc == hInd
			homeName += " (current)"
		endIf
		UIChoices[hInd + 1] = homeName
		hInd += 1
	endWhile
	UIChoices[21] = "$FF_FolBaseRemSel"
	UIChoices[22] = "$FF_Back"
	Int totalSlots = homeScript.maxHomeSlots
	Int emptySlots = totalSlots - homeScript.nwsBaseTotal
	UIPick = ((self as form) as uilib_1).ShowList("Set Home Base (" + emptySlots as String + " slots left)", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 21
			if UIActor.IsInFaction(varScript.nwsFF_HomeFac)
				homeScript.SetFollowerHome(0, UIActor, true)
				self.UINotifyPlayer("$FF_FolBaseRemove", 3)
			endIf
		elseIf UIPick == 22
			self.UICmdOneMenu(UIActor)
		elseIf homeScript.nwsHomeLocSet[UIPick - 1] == 1
			homeScript.SetFollowerHome(UIPick - 1, UIActor, false)
			self.UINotifyPlayer("$FF_FolAssignBase", 3)
		endIf
	endIf
endFunction

function UIMoralitySub()

	UIChoices = utility.CreateStringArray(6, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_Morality1"
	UIChoices[2] = "$FF_Morality2"
	UIChoices[3] = "$FF_Morality3"
	UIChoices[4] = "$FF_Morality4"
	UIChoices[5] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_SetMorality", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick > 0 && UIPick < 5
			if UIAll
				controlScript.DoTaskAll(31, UIPick - 1)
				self.UINotifyPlayer("$FF_MoralSetAll", 2)
				self.UITraitAllSub()
			else
				if !UIActor.IsInFaction(varScript.nwsFF_MoralFac)
					UIActor.AddToFaction(varScript.nwsFF_MoralFac)
				endIf
				UIActor.SetFactionRank(varScript.nwsFF_MoralFac, UIPick - 1)
				UIActor.SetActorValue("Morality", (UIPick - 1) as Float)
				self.UINotifyPlayer("$FF_MoralSet", 2)
				self.UITraitSub()
			endIf
		endIf
	endIf
endFunction

function UICmdOneMenu(actor myActor)

	UIActor = myActor
	UIAlias = self.FetchAlias(UIActor)
	UIHeath = UIActor.GetActorValue("Health") as Int
	UIMagicka = UIActor.GetActorValue("Magicka") as Int
	UIStamina = UIActor.GetActorValue("Stamina") as Int
	if UIActor.IsInFaction(varScript.nwsFF_FollowerFac)
		UIType = 0
		self.UICmdOneFollower()
	elseIf UIActor.IsInFaction(varScript.PotentialFollowerFaction)
		UIType = 1
		self.UICmdOnePotential()
	else
		UIType = 2
		self.UICmdOneNPC()
	endIf
endFunction

function OnUpdate()

	isRetreat = 0
endFunction

function UITraitSub()

	UIChoices = utility.CreateStringArray(9, "")
	String classTxt = UIActor.GetActorBase().GetClass().GetName()
	if classTxt == "dremora"
		classTxt = "Warrior"
	endIf
	UIChoices[0] = "Level " + UIActor.GetLevel() as String + " " + classTxt + " [x]"
	String regardRankStr = "Disabled"
	if controlScript.nwsUseRegard == 1
		controlScript.SetRegardFaction(UIAlias)
		regardRankStr = "Indifferent"
		Int regardRank = 0
		if UIActor.IsInFaction(varScript.nwsFF_RegardFac)
			regardRank = UIActor.GetFactionRank(varScript.nwsFF_RegardFac)
		endIf
		regardRankStr = stringutil.Substring(mcmScript.actRegard[regardRank], 1, 0)
		regardRankStr += " (Rank " + regardRank as String + ", Points " + (UIAlias as followeraliasscript).regardTotal as String + ")"
	endIf
	UIChoices[1] = "Regard: " + regardRankStr
	if UIActor.GetFactionRank(varScript.nwsFF_RoleFac) == 1
		UIChoices[2] = "$FF_RoleHealer"
	elseIf UIActor.GetFactionRank(varScript.nwsFF_RoleFac) == 2
		UIChoices[2] = "$FF_RoleTank"
	else
		UIChoices[2] = "$FF_RoleStandard"
	endIf
	Int myRank = -1
	String chString = "$FF_CStyle0"
	if UIActor.IsInFaction(varScript.nwsFF_CSFac)
		myRank = UIActor.GetFactionRank(varScript.nwsFF_CSFac)
	endIf
	if myRank == 0
		chString = "$FF_CStyle1"
	elseIf myRank == 1
		chString = "$FF_CStyle2"
	elseIf myRank == 2
		chString = "$FF_CStyle3"
	elseIf myRank == 3
		chString = "$FF_CStyle4"
	elseIf myRank == 4
		chString = "$FF_CStyle5"
	elseIf myRank == 5
		chString = "$FF_CStyle6"
	elseIf myRank == 6
		chString = "$FF_CStyle7"
	elseIf myRank == 7
		chString = "$FF_CStyle8"
	elseIf myRank == 8
		chString = "$FF_CStyle9"
	elseIf myRank == 9
		chString = "$FF_CStyle10"
	endIf
	UIChoices[3] = chString
	myRank = UIActor.GetActorValue("Aggression") as Int
	if myRank == 0
		chString = "$FF_Unaggressive"
	else
		chString = "$FF_Aggressive"
	endIf
	UIChoices[4] = chString
	myRank = UIActor.GetActorValue("Assistance") as Int
	if myRank == 0
		chString = "$FF_AssistNobody"
	elseIf myRank == 1
		chString = "$FF_AssistAllies"
	else
		chString = "$FF_AssistFriends"
	endIf
	UIChoices[5] = chString
	myRank = UIActor.GetActorValue("Confidence") as Int
	if myRank == 0
		chString = "$FF_ConCoward"
	elseIf myRank == 1
		chString = "$FF_ConCautious"
	elseIf myRank == 2
		chString = "$FF_ConAverage"
	elseIf myRank == 3
		chString = "$FF_ConBrave"
	else
		chString = "$FF_ConFoolhardy"
	endIf
	UIChoices[6] = chString
	myRank = UIActor.GetActorValue("Morality") as Int
	if myRank == 0
		chString = "$FF_MoralAny"
	elseIf myRank == 1
		chString = "$FF_MoralEnemy"
	elseIf myRank == 2
		chString = "$FF_MoralProperty"
	else
		chString = "$FF_MoralNo"
	endIf
	UIChoices[7] = chString
	UIChoices[8] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_TraitsTitle", UIChoices, 0, 0)
	if UIPick
		if UIPick == 1
			self.UITraitSub()
		elseIf UIPick == 2
			self.UIRoleSub()
		elseIf UIPick == 3
			self.UICStyleSub()
		elseIf UIPick == 4
			UIAll = false
			self.UIAggressionSub()
		elseIf UIPick == 5
			UIAll = false
			self.UIAssistanceSub()
		elseIf UIPick == 6
			UIAll = false
			self.UIConfidenceSub()
		elseIf UIPick == 7
			UIAll = false
			self.UIMoralitySub()
		elseIf UIPick == 8
			self.UICmdOneMenu(UIActor)
		endIf
	endIf
endFunction

function UIHeadwearSub()

	UIChoices = utility.CreateStringArray(5, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_HeadSetNone"
	if UIActor.IsInFaction(varScript.nwsFF_HelmFac)
		if UIActor.GetFactionRank(varScript.nwsFF_HelmFac) == 1
			UIChoices[2] = "$FF_HeadCombatOff"
			UIChoices[3] = "$FF_NoHelmOn"
		else
			UIChoices[2] = "$FF_HeadCombatOn"
			UIChoices[3] = "$FF_NoHelmOff"
		endIf
	else
		UIChoices[2] = "$FF_HeadCombatOff"
		UIChoices[3] = "$FF_NoHelmOff"
	endIf
	UIChoices[4] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_HeadwearTitle", UIChoices, 0, 0)
	if UIPick
		if UIPick == 1
			(UIAlias as followeraliasscript).wornHelmet = none
			self.UINotifyPlayer("$FF_HeadwearCleared", 0)
		elseIf UIPick == 2
			if UIActor.IsInFaction(varScript.nwsFF_HelmFac)
				if UIActor.GetFactionRank(varScript.nwsFF_HelmFac) == 1
					UIActor.SetFactionRank(varScript.nwsFF_HelmFac, 0)
				else
					UIActor.RemoveFromFaction(varScript.nwsFF_HelmFac)
				endIf
			else
				UIActor.AddToFaction(varScript.nwsFF_HelmFac)
				UIActor.SetFactionRank(varScript.nwsFF_HelmFac, 0)
			endIf
			self.UINotifyPlayer("$FF_HeadwearApplied", 0)
			(UIAlias as followeraliasscript).CheckFollower(0.500000, false, false)
		elseIf UIPick == 3
			if UIActor.IsInFaction(varScript.nwsFF_HelmFac)
				if UIActor.GetFactionRank(varScript.nwsFF_HelmFac) == 0
					UIActor.SetFactionRank(varScript.nwsFF_HelmFac, 1)
				else
					UIActor.RemoveFromFaction(varScript.nwsFF_HelmFac)
				endIf
			else
				UIActor.AddToFaction(varScript.nwsFF_HelmFac)
				UIActor.SetFactionRank(varScript.nwsFF_HelmFac, 1)
			endIf
			self.UINotifyPlayer("$FF_HeadwearApplied", 0)
			(UIAlias as followeraliasscript).CheckFollower(0.500000, false, false)
		elseIf UIPick == 4
			self.UIInventory()
		endIf
	endIf
endFunction

function UISkills()

	self.GetSkillNames()
	UIChoices = utility.CreateStringArray(20, "")
	Int index = 0
	Int[] mySkillVal = new Int[18]
	String[] mySkill = new String[18]
	while index < 18
		mySkillVal[index] = UIActor.GetActorValue(mcmScript.actSkills[index]) as Int
		mySkill[index] = actSkillStr[index]
		index += 1
	endWhile
	index = 0
	Int Index2 = 17
	while Index2 > 0
		index = 0
		while index < Index2
			if mySkillVal[index] < mySkillVal[index + 1]
				Int swapInt = mySkillVal[index]
				String swapStr = mySkill[index]
				mySkillVal[index] = mySkillVal[index + 1]
				mySkill[index] = mySkill[index + 1]
				mySkillVal[index + 1] = swapInt
				mySkill[index + 1] = swapStr
			endIf
			index += 1
		endWhile
		Index2 -= 1
	endWhile
	index = 0
	UIChoices[0] = "$FF_Exit"
	while index < 18
		UIChoices[index + 1] = mySkill[index] + " (" + mySkillVal[index] as String + ")"
		index += 1
	endWhile
	UIChoices[19] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_SkillTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIType == 1
			self.UICmdOnePotential()
		elseIf UIType == 2
			self.UICmdOneNPC()
		else
			self.UICmdOneFollower()
		endIf
	endIf
endFunction

function UICraftingSub()

	UIChoices = utility.CreateStringArray(7, "")
	UIChoices[0] = "$FF_Exit"
	if UIActor.IsInFaction(varScript.nwsFF_CraftTorchFac)
		UIChoices[1] = "$FF_CraftTorchOn"
	else
		UIChoices[1] = "$FF_CraftTorchOff"
	endIf
	if UIActor.IsInFaction(varScript.nwsFF_CraftArrowFac)
		Int arrowRank = UIActor.GetFactionRank(varScript.nwsFF_CraftArrowFac)
		if arrowRank == 0 || arrowRank == 2
			UIChoices[2] = "$FF_CraftArrowsOn"
		else
			UIChoices[2] = "$FF_CraftBoltsOn"
		endIf
	else
		UIChoices[2] = "$FF_CraftArrowsOff"
	endIf
	if UIActor.IsInFaction(varScript.nwsFF_CraftPotionFac)
		UIChoices[3] = "$FF_CraftPotionsOn"
	else
		UIChoices[3] = "$FF_CraftPotionsOff"
	endIf
	if UIActor.IsInFaction(varScript.nwsFF_CraftSharpFac)
		UIChoices[4] = "$FF_SharpWeaponsOn"
	else
		UIChoices[4] = "$FF_SharpWeaponsOff"
	endIf
	if UIActor.IsInFaction(varScript.nwsFF_TavernFac)
		UIChoices[5] = "$FF_DrinkOn"
	else
		UIChoices[5] = "$FF_DrinkOff"
	endIf
	UIChoices[6] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_CraftTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			if UIActor.IsInFaction(varScript.nwsFF_CraftTorchFac)
				UIActor.RemoveFromFaction(varScript.nwsFF_CraftTorchFac)
			else
				UIActor.AddToFaction(varScript.nwsFF_CraftTorchFac)
				UIActor.SetFactionRank(varScript.nwsFF_CraftTorchFac, 0)
			endIf
			self.UICraftingSub()
		elseIf UIPick == 2
			if UIActor.IsInFaction(varScript.nwsFF_CraftArrowFac)
				Int arrowrank = UIActor.GetFactionRank(varScript.nwsFF_CraftArrowFac)
				if arrowrank == 0 || arrowrank == 2
					arrowrank += 1
					UIActor.SetFactionRank(varScript.nwsFF_CraftArrowFac, arrowrank)
				else
					UIActor.RemoveFromFaction(varScript.nwsFF_CraftArrowFac)
				endIf
			else
				UIActor.AddToFaction(varScript.nwsFF_CraftArrowFac)
				UIActor.SetFactionRank(varScript.nwsFF_CraftArrowFac, 0)
			endIf
			self.UICraftingSub()
		elseIf UIPick == 3
			if UIActor.IsInFaction(varScript.nwsFF_CraftPotionFac)
				UIActor.RemoveFromFaction(varScript.nwsFF_CraftPotionFac)
			else
				UIActor.AddToFaction(varScript.nwsFF_CraftPotionFac)
				UIActor.SetFactionRank(varScript.nwsFF_CraftPotionFac, 0)
			endIf
			self.UICraftingSub()
		elseIf UIPick == 4
			if UIActor.IsInFaction(varScript.nwsFF_CraftSharpFac)
				UIActor.RemoveFromFaction(varScript.nwsFF_CraftSharpFac)
			else
				UIActor.AddToFaction(varScript.nwsFF_CraftSharpFac)
				UIActor.SetFactionRank(varScript.nwsFF_CraftSharpFac, 0)
			endIf
			self.UICraftingSub()
		elseIf UIPick == 5
			if UIActor.IsInFaction(varScript.nwsFF_TavernFac)
				UIActor.RemoveFromFaction(varScript.nwsFF_TavernFac)
			else
				UIActor.AddToFaction(varScript.nwsFF_TavernFac)
				UIActor.SetFactionRank(varScript.nwsFF_TavernFac, 0)
			endIf
			self.UICraftingSub()
		elseIf UIPick == 6
			self.UICmdOneMenu(UIActor)
		endIf
	endIf
endFunction

function GetSkillNames()

	actSkillStr = new String[18]
	actSkillStr[0] = " Alchemy"
	actSkillStr[1] = " Alteration"
	actSkillStr[2] = " Block"
	actSkillStr[3] = " Conjuration"
	actSkillStr[4] = " Destruction"
	actSkillStr[5] = " Enchanting"
	actSkillStr[6] = " Heavy Armor"
	actSkillStr[7] = " Illusion"
	actSkillStr[8] = " Light Armor"
	actSkillStr[9] = " Lockpicking"
	actSkillStr[10] = " Archery"
	actSkillStr[11] = " One-Handed"
	actSkillStr[12] = " Pickpocket"
	actSkillStr[13] = " Restoration"
	actSkillStr[14] = " Smithing"
	actSkillStr[15] = " Sneak"
	actSkillStr[16] = " Speech"
	actSkillStr[17] = " Two-Handed"
endFunction

function UICmdOneFollower()

	UIChoices = utility.CreateStringArray(14, "")
	UIChoices[0] = "Health: " + UIHeath as String + ", Magicka: " + UIMagicka as String + ", Stamina: " + UIStamina as String + " [x]"
	UIChoices[1] = "$FF_SkillMenu"
	UIChoices[2] = "$FF_SpellMenu"
	UIChoices[3] = "$FF_Traits"
	UIChoices[4] = "$FF_DoFavor"
	if UIActor.GetActorValue("WaitingForPlayer") != 0 as Float
		UIChoices[5] = "$FF_IsWaiting"
	else
		UIChoices[5] = "$FF_IsFollowing"
	endIf
	UIChoices[6] = "$FF_InvMenu"
	UIChoices[7] = "$FF_Range"
	UIChoices[8] = "$FF_SetCraft"
	UIChoices[9] = "$FF_Extras"
	Int UICount = 10
	if UIActor.GetActorBase().IsUnique()
		UIChoices[10] = "$FF_SetHomeBase"
		UIChoices[11] = "$FF_LoadSaveTweaks"
		UICount = 12
	endIf
	UIChoices[UICount] = "$FF_Dismiss"
	UIChoices[UICount + 1] = "$FF_SubAll"
	UIPick = ((self as form) as uilib_1).ShowList(self.GetActorName(UIActor), UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			self.UISkills()
		elseIf UIPick == 2
			self.UISpells()
		elseIf UIPick == 3
			self.UITraitSub()
		elseIf UIPick == 4
			UIActor.SetDoingFavor(true)
		elseIf UIPick == 5
			UIAll = false
			if UIActor.GetActorValue("WaitingForPlayer") != 0 as Float
				controlScript.FollowerFollowMe(UIActor, 1)
			else
				controlScript.FollowerWaitHere(UIActor, 1, 0)
			endIf
		elseIf UIPick == 6
			self.UIInventory()
		elseIf UIPick == 7
			self.UIRangeSub()
		elseIf UIPick == 8
			self.UICraftingSub()
		elseIf UIPick == 9
			self.UIUtility()
		elseIf UIPick == 10 && UICount > 10
			self.UIHomeBase()
		elseIf UIPick == 11 && UICount > 10
			self.UILoadSaveTweaks()
		elseIf UIPick == UICount
			if UIActor.IsInFaction(varScript.nwsFF_ImportFac)
				controlScript.ExportAction(UIActor, 1, 1)
			elseIf UIActor.IsInFaction(varScript.nwsFF_GuardFaction)
				controlScript.DismissGuardAction(UIActor, 1, 1)
			else
				controlScript.RemoveAction(UIActor, 0, 1)
			endIf
		elseIf UIPick == UICount + 1
			self.UICmdAllMenu()
		endIf
	endIf
endFunction

function UINotifyPlayer(String myMsg, Int myColor)

	if controlScript.nwsColorMsg == 1
		String myColorStr = "#FFC9AE"
		if myColor == 1
			myColorStr = "#BBD5FF"
		elseIf myColor == 2
			myColorStr = "#3FFEC0"
		elseIf myColor == 3
			myColorStr = "#FFDFA4"
		endIf
		((self as form) as uilib_1).ShowNotification(myMsg, myColorStr)
	else
		debug.notification(myMsg)
	endIf
endFunction

String function GetCooldown(Float nextTime)

	Float hoursFloat = (nextTime - GameDaysPassed.GetValue()) / 0.0400000
	hoursFloat = math.floor(hoursFloat * 100 as Float + 0.500000) as Float / 100.000
	String hoursStr = stringutil.Substring(hoursFloat as String, 0, stringutil.Find(hoursFloat as String, ".", 0) + 2)
	return hoursStr
endFunction

String function UISendInput(String myTitle, String myText)

	String myString = ((self as form) as uilib_1).ShowTextInput(myTitle, myText)
	return myString
endFunction

String function GetLocName(actor lookAct)

	String myName
	cell actCell = lookAct.GetParentCell()
	if actCell
		if actCell.GetName()
			myName = actCell.GetName()
		endIf
	endIf
	if myName == ""
		location actLoc = lookAct.GetCurrentLocation()
		if actLoc
			myName = actLoc.GetName()
		endIf
	endIf
	if myName == ""
		myName = "Tamriel"
	endIf
	return myName
endFunction

function UIRangeSubAll()

	UIChoices = utility.CreateStringArray(4, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_AllFollowRange"
	UIChoices[2] = "$FF_AllCombatRange"
	UIChoices[3] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_RangeTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			UIAll = true
			self.UIRangeDist(0)
		elseIf UIPick == 2
			UIAll = true
			self.UIRangeDist(1)
		elseIf UIPick == 3
			self.UICmdAllMenu()
		endIf
	endIf
endFunction

function UITeachSub()

	UIChoices = utility.CreateStringArray(4, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_TeachNoneL"
	spell mySpell = myPlayer.GetEquippedSpell(0)
	if mySpell
		UIChoices[1] = "Teach (Left): " + mySpell.GetName()
	endIf
	UIChoices[2] = "$FF_TeachNoneR"
	mySpell = myPlayer.GetEquippedSpell(1)
	if mySpell
		UIChoices[2] = "Teach (Right): " + mySpell.GetName()
	endIf
	UIChoices[3] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_TeachTitle", UIChoices, 0, 0)
	if UIPick
		if UIPick == 1
			if myPlayer.GetEquippedSpell(0)
				controlScript.TeachSpell(UIActor, 0)
			endIf
		elseIf UIPick == 2
			if myPlayer.GetEquippedSpell(1)
				controlScript.TeachSpell(UIActor, 1)
			endIf
		elseIf UIPick == 3
			self.UICmdOneMenu(UIActor)
		endIf
	endIf
endFunction

function UIUtility()

	UIChoices = utility.CreateStringArray(6, "")
	UIChoices[0] = "$FF_Exit"
	Bool doAdd = false
	if favScript.FindFavorite(UIActor, false)
		UIChoices[1] = "$FF_FavoriteRemove"
	else
		doAdd = true
		UIChoices[1] = "$FF_FavoriteAdd"
	endIf
	UIChoices[2] = "$FF_Teach"
	if !myPlayer.GetEquippedSpell(0) && !myPlayer.GetEquippedSpell(1)
		UIChoices[2] = "$FF_TeachInvalid"
	endIf
	UIChoices[3] = "$FF_Push"
	UIChoices[4] = "$FF_Behind"
	UIChoices[5] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_ExtrasTitle", UIChoices, 0, 0)
	if UIPick
		if UIPick == 1
			if doAdd
				self.UIPickFavorite(2, true, UIActor)
			else
				favScript.FindFavorite(UIActor, true)
				self.UINotifyPlayer("$FF_FavoritesRemoved", 0)
				controlScript.RecordHistory(UIActor)
				self.UICmdOneMenu(UIActor)
			endIf
		elseIf UIPick == 2
			if !myPlayer.GetEquippedSpell(0) && !myPlayer.GetEquippedSpell(1)
				self.UICmdOneMenu(UIActor)
			else
				self.UITeachSub()
			endIf
		elseIf UIPick == 3
			varScript.nwsStaggerAlly.Cast(UIActor as objectreference, none)
		elseIf UIPick == 4
			boxScript.MoveFollower(UIActor, 0, false, 256.000)
		elseIf UIPick == 5
			self.UICmdOneMenu(UIActor)
		endIf
	endIf
endFunction

function UIRangeDist(Int myOpt)

	UIChoices = utility.CreateStringArray(5, "")
	if UIAll
		UIChoices[0] = "$FF_Exit"
		UIChoices[1] = "$FF_AllRangeClose"
		UIChoices[2] = "$FF_AllRangeMedium"
		UIChoices[3] = "$FF_AllRangeFar"
		UIChoices[4] = "$FF_Back"
	else
		UIChoices[0] = "$FF_Exit"
		UIChoices[1] = "$FF_RangeClose"
		UIChoices[2] = "$FF_RangeMedium"
		UIChoices[3] = "$FF_RangeFar"
		UIChoices[4] = "$FF_Back"
	endIf
	if myOpt
		UIPick = ((self as form) as uilib_1).ShowList("$FF_CombatRange", UIChoices, 0, 0)
	else
		UIPick = ((self as form) as uilib_1).ShowList("$FF_FollowRange", UIChoices, 0, 0)
	endIf
	if UIPick > 0 && myOpt as Bool
		if UIPick == 1
			if UIAll
				controlScript.SetCbtRangeAll(1)
				self.UINotifyPlayer("$FF_RangeSetCloseAllCbt", 2)
			else
				controlScript.SetCbtRange(UIActor, 1)
				self.UINotifyPlayer("$FF_RangeSetCloseCbt", 2)
			endIf
		elseIf UIPick == 2
			if UIAll
				controlScript.SetCbtRangeAll(0)
				self.UINotifyPlayer("$FF_RangeSetMedAllCbt", 2)
			else
				controlScript.SetCbtRange(UIActor, 0)
				self.UINotifyPlayer("$FF_RangeSetMedCbt", 2)
			endIf
		elseIf UIPick == 3
			if UIAll
				controlScript.SetCbtRangeAll(2)
				self.UINotifyPlayer("$FF_RangeSetFarAllCbt", 2)
			else
				controlScript.SetCbtRange(UIActor, 2)
				self.UINotifyPlayer("$FF_RangeSetFarCbt", 2)
			endIf
		endIf
		if UIPick >= 1
			if UIAll
				self.UICmdAllMenu()
			else
				self.UICmdOneMenu(UIActor)
			endIf
		endIf
	elseIf UIPick > 0
		if UIPick == 1
			if UIAll
				controlScript.SetRangeAll(1)
				self.UINotifyPlayer("$FF_RangeSetCloseAll", 2)
			else
				controlScript.SetRange(UIActor, 1)
				self.UINotifyPlayer("$FF_RangeSetClose", 2)
			endIf
		elseIf UIPick == 2
			if UIAll
				controlScript.SetRangeAll(0)
				self.UINotifyPlayer("$FF_RangeSetMedAll", 2)
			else
				controlScript.SetRange(UIActor, 0)
				self.UINotifyPlayer("$FF_RangeSetMed", 2)
			endIf
		elseIf UIPick == 3
			if UIAll
				controlScript.SetRangeAll(2)
				self.UINotifyPlayer("$FF_RangeSetFarAll", 2)
			else
				controlScript.SetRange(UIActor, 2)
				self.UINotifyPlayer("$FF_RangeSetFar", 2)
			endIf
		endIf
		if UIPick >= 1
			if UIAll
				self.UIRangeSubAll()
			else
				self.UIRangeSub()
			endIf
		endIf
	endIf
endFunction

function UIFavoriteAction(Int myOpt)

	UIChoices = utility.CreateStringArray(5, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_TravelTo"
	UIChoices[2] = "$FF_CallToYou"
	UIChoices[3] = "$FF_FavoriteRemove"
	UIChoices[4] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList(self.GetActorName(UIActor), UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			self.UINotifyPlayer("$FF_Teleporting", 3)
			utility.Wait(1.00000)
			myPlayer.MoveTo(UIActor as objectreference, 0.000000, 0.000000, 0.000000, true)
		elseIf UIPick == 2
			self.UINotifyPlayer("$FF_CallFollower", 3)
			utility.Wait(0.500000)
			boxScript.MoveFollower(UIActor, 1, false, 256.000)
		elseIf UIPick == 3
			favScript.FindFavorite(UIActor, true)
			self.UINotifyPlayer("$FF_FavoritesRemoved", 0)
			controlScript.RecordHistory(UIActor)
			self.UIPickFavActor(myOpt, favScript.GetListName(myOpt))
		elseIf UIPick == 4
			self.UIPickFavActor(myOpt, favScript.GetListName(myOpt))
		endIf
	endIf
endFunction

function UITeleportSub(Int myOpt)

	if UIActor
		UIActor = historyScript.historyActors[myOpt]
		UIChoices = utility.CreateStringArray(5, "")
		UIChoices[0] = "$FF_Exit"
		UIChoices[1] = "$FF_TravelTo"
		UIChoices[2] = "$FF_CallToYou"
		Bool doAdd = false
		if favScript.FindFavorite(UIActor, false)
			UIChoices[3] = "$FF_FavoriteRemove"
		else
			doAdd = true
			UIChoices[3] = "$FF_FavoriteAdd"
		endIf
		UIChoices[4] = "$FF_Back"
		UIPick = ((self as form) as uilib_1).ShowList(self.GetActorName(UIActor), UIChoices, 0, 0)
		if UIPick > 0
			if UIPick == 1
				self.UINotifyPlayer("$FF_Teleporting", 3)
				utility.Wait(1.00000)
				myPlayer.MoveTo(UIActor as objectreference, 0.000000, 0.000000, 0.000000, true)
			elseIf UIPick == 2
				self.UINotifyPlayer("$FF_CallFollower", 3)
				utility.Wait(0.500000)
				boxScript.MoveFollower(UIActor, 1, false, 256.000)
			elseIf UIPick == 3
				if doAdd
					self.UIPickFavorite(3, true, UIActor)
				else
					favScript.FindFavorite(UIActor, true)
					self.UINotifyPlayer("$FF_FavoritesRemoved", 0)
					controlScript.RecordHistory(UIActor)
				endIf
				self.UIOpenHistory()
			elseIf UIPick == 4
				self.UIOpenHistory()
			endIf
		endIf
	endIf
endFunction

referencealias function FetchAlias(actor myActor)

	referencealias foundAlias
	Int index = 0
	Bool stopLook = false
	while !stopLook
		referencealias checkAlias = varScript.DialogueFollower.GetAlias(index) as referencealias
		if checkAlias
			actor follower = checkAlias.GetReference() as actor
			if myActor == follower
				foundAlias = checkAlias
				stopLook = true
			endIf
		endIf
		index += 1
		stopLook = index >= 12 || stopLook == true
	endWhile
	return foundAlias
endFunction

function UILootSub()

	UIChoices = utility.CreateStringArray(14, "")
	Int myRank = -1
	if UIActor.IsInFaction(varScript.nwsFF_GatherFac)
		myRank = UIActor.GetFactionRank(varScript.nwsFF_GatherFac)
	endIf
	UIChoices[0] = "$FF_Exit"
	if myRank == -1
		UIChoices[1] = "$FF_LootingOffOn"
	else
		UIChoices[1] = "$FF_LootingOff"
	endIf
	if myRank == 0 || myRank == 11 || myRank == 22
		UIChoices[2] = "$FF_LootingOn0"
	else
		UIChoices[2] = "$FF_Looting0"
	endIf
	if myRank == 1 || myRank == 12 || myRank == 23
		UIChoices[3] = "$FF_LootingOn1"
	else
		UIChoices[3] = "$FF_Looting1"
	endIf
	if myRank == 2 || myRank == 13 || myRank == 24
		UIChoices[4] = "$FF_LootingOn2"
	else
		UIChoices[4] = "$FF_Looting2"
	endIf
	if myRank == 3 || myRank == 14 || myRank == 25
		UIChoices[5] = "$FF_LootingOn3"
	else
		UIChoices[5] = "$FF_Looting3"
	endIf
	if myRank == 4 || myRank == 15 || myRank == 26
		UIChoices[6] = "$FF_LootingOn4"
	else
		UIChoices[6] = "$FF_Looting4"
	endIf
	if myRank == 5 || myRank == 16 || myRank == 27
		UIChoices[7] = "$FF_LootingOn5"
	else
		UIChoices[7] = "$FF_Looting5"
	endIf
	if myRank == 6 || myRank == 17 || myRank == 28
		UIChoices[8] = "$FF_LootingOn6"
	else
		UIChoices[8] = "$FF_Looting6"
	endIf
	if myRank == 7 || myRank == 18 || myRank == 29
		UIChoices[9] = "$FF_LootingOn7"
	else
		UIChoices[9] = "$FF_Looting7"
	endIf
	if myRank == 8 || myRank == 19 || myRank == 30
		UIChoices[10] = "$FF_LootingOn8"
	else
		UIChoices[10] = "$FF_Looting8"
	endIf
	if myRank == 9 || myRank == 20 || myRank == 31
		UIChoices[11] = "$FF_LootingOn9"
	else
		UIChoices[11] = "$FF_Looting9"
	endIf
	if myRank == 10 || myRank == 21 || myRank == 32
		UIChoices[12] = "$FF_LootingOn10"
	else
		UIChoices[12] = "$FF_Looting10"
	endIf
	UIChoices[13] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_LootingTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			UIActor.RemoveFromFaction(varScript.nwsFF_GatherFac)
		elseIf UIPick > 1 && UIPick < 13
			if !UIActor.IsInFaction(varScript.nwsFF_GatherFac)
				UIActor.AddToFaction(varScript.nwsFF_GatherFac)
			endIf
			myRank = UIActor.GetFactionRank(varScript.nwsFF_GatherFac)
			Int rankMod = UIPick - 2
			if myRank > 21
				myRank = rankMod + 22
			elseIf myRank > 10
				myRank = rankMod + 11
			else
				myRank = rankMod
			endIf
			UIActor.SetFactionRank(varScript.nwsFF_GatherFac, myRank)
		endIf
		self.UIInventory()
	endIf
endFunction

function UISendLootSub()

	UIChoices = utility.CreateStringArray(5, "")
	Int myRank = -1
	if UIActor.IsInFaction(varScript.nwsFF_GatherFac)
		myRank = UIActor.GetFactionRank(varScript.nwsFF_GatherFac)
	endIf
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_SendLoot_0"
	if UIActor.IsInFaction(setsScript.nwsFF_storedFac)
		UIChoices[2] = "$FF_SendLoot_1alt"
	else
		UIChoices[2] = "$FF_SendLoot_1"
	endIf
	UIChoices[3] = "$FF_SendLoot_2"
	if myRank >= 22
		UIChoices[3] = "$FF_SendLootOn_2"
	elseIf myRank >= 11
		UIChoices[2] = "$FF_SendLootOn_1"
	else
		UIChoices[1] = "$FF_SendLootOn_0"
	endIf
	UIChoices[4] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_LootingTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick > 1 && UIPick < 4 && myRank != -1
			if UIPick == 1
				if myRank > 21
					myRank -= 22
				elseIf myRank > 10
					myRank -= 11
				endIf
			elseIf UIPick == 2
				if myRank > 21
					myRank -= 11
				elseIf myRank < 11
					myRank += 11
				endIf
			elseIf myRank < 11
				myRank += 22
			elseIf myRank < 22
				myRank += 11
			endIf
			UIActor.SetFactionRank(varScript.nwsFF_GatherFac, myRank)
		endIf
		self.UIInventory()
	endIf
endFunction

function UITraitAllSub()

	UIChoices = utility.CreateStringArray(6, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_AggressionAll"
	UIChoices[2] = "$FF_AssistAll"
	UIChoices[3] = "$FF_ConAll"
	UIChoices[4] = "$FF_MoralityAll"
	UIChoices[5] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_TraitsTitle", UIChoices, 0, 0)
	if UIPick
		if UIPick == 1
			UIAll = true
			self.UIAggressionSub()
		elseIf UIPick == 2
			UIAll = true
			self.UIAssistanceSub()
		elseIf UIPick == 3
			UIAll = true
			self.UIConfidenceSub()
		elseIf UIPick == 4
			UIAll = true
			self.UIMoralitySub()
		elseIf UIPick == 5
			self.UICmdAllMenu()
		endIf
	endIf
endFunction

function UIAggressionSub()

	UIChoices = utility.CreateStringArray(4, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_Aggression1"
	UIChoices[2] = "$FF_Aggression2"
	UIChoices[3] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_SetAggression", UIChoices, 0, 0)
	if UIPick
		if UIPick == 1 || UIPick == 2
			if UIAll
				controlScript.DoTaskAll(28, UIPick - 1)
				self.UINotifyPlayer("$FF_AggressionSetAll", 2)
				self.UITraitAllSub()
			else
				if !UIActor.IsInFaction(varScript.nwsFF_AggrFac)
					UIActor.AddToFaction(varScript.nwsFF_AggrFac)
				endIf
				UIActor.SetFactionRank(varScript.nwsFF_AggrFac, UIPick - 1)
				UIActor.SetActorValue("Aggression", (UIPick - 1) as Float)
				self.UINotifyPlayer("$FF_AggressionSet", 2)
				self.UITraitSub()
			endIf
		endIf
	endIf
endFunction

function UIAssistanceSub()

	UIChoices = utility.CreateStringArray(5, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_Assist1"
	UIChoices[2] = "$FF_Assist2"
	UIChoices[3] = "$FF_Assist3"
	UIChoices[4] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_SetAssistance", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick > 0 && UIPick < 4
			if UIAll
				controlScript.DoTaskAll(29, UIPick - 1)
				self.UINotifyPlayer("$FF_AssistSetAll", 2)
				self.UITraitAllSub()
			else
				if !UIActor.IsInFaction(varScript.nwsFF_AssistFac)
					UIActor.AddToFaction(varScript.nwsFF_AssistFac)
				endIf
				UIActor.SetFactionRank(varScript.nwsFF_AssistFac, UIPick - 1)
				UIActor.SetActorValue("Assistance", (UIPick - 1) as Float)
				self.UINotifyPlayer("$FF_AssistSet", 2)
				self.UITraitSub()
			endIf
		endIf
	endIf
endFunction

function UILoot()

	UIChoices = utility.CreateStringArray(7, "")
	UIChoices[0] = "$FF_Exit"
	if controlScript.QueryLooting()
		UIChoices[1] = "$FF_AutoLootStop"
	else
		UIChoices[1] = "$FF_AutoLootStart"
	endIf
	if controlScript.outfitSwitchStyle > 0
		UIChoices[2] = "$FF_SwitchMenu"
	else
		UIChoices[2] = "$FF_SwitchMenuDis"
	endIf
	if nwsChestPort.GetValue() <= GameDaysPassed.GetValue() || storageScript.FreeChest()
		UIChoices[3] = "$FF_KeyPlaceChestM"
	else
		UIChoices[3] = "Place Player Chest (CD: " + self.GetCooldown(nwsChestPort.GetValue()) + " hours)"
	endIf
	if nwsChestAllowed.GetValue() <= GameDaysPassed.GetValue() || storageScript.FreeChest()
		UIChoices[4] = "$FF_KeyOpenChestM"
	else
		UIChoices[4] = "Open Player Chest (CD: " + self.GetCooldown(nwsChestAllowed.GetValue()) + " hours)"
	endIf
	UIChoices[5] = "$FF_TakeTorches"
	if tookTorches
		UIChoices[5] = "$FF_GiveTorches"
	endIf
	UIChoices[6] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_LootTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			controlScript.CallLooting(false, false, false)
		elseIf UIPick == 2
			if controlScript.outfitSwitchStyle > 0
				setsScript.ManualSwitch()
			endIf
		elseIf UIPick == 3
			storageScript.PlaceChest()
		elseIf UIPick == 4
			storageScript.RemoteOpen()
		elseIf UIPick == 5
			if tookTorches
				controlScript.GiveTorchAll()
				self.UINotifyPlayer("$FF_TorchesGiven", 1)
			else
				controlScript.TakeTorchAll()
				self.UINotifyPlayer("$FF_TorchesTaken", 0)
			endIf
			tookTorches = !tookTorches
		elseIf UIPick == 6
			self.UICmdAllMenu()
		endIf
	endIf
endFunction

function UISelectOneMenu()

	Int folCount = varScript.nwsFollowerCount.GetValue() as Int
	UIChoices = utility.CreateStringArray(folCount + 1, "")
	UISlots = utility.CreateIntArray(folCount + 1, 0)
	Int index = 0
	Int count = 1
	UIChoices[0] = "$FF_Exit"
	while index < 12
		referencealias checkAlias = varScript.DialogueFollower.GetAlias(index) as referencealias
		if checkAlias
			actor follower = checkAlias.GetReference() as actor
			if follower
				UIChoices[count] = self.GetActorName(follower)
				UISlots[count] = index
				count += 1
			endIf
		endIf
		index += 1
	endWhile
	UIPick = ((self as form) as uilib_1).ShowList("$FF_Followers", UIChoices, 0, 0)
	if UIPick > 0
		Int mySlot = UISlots[UIPick]
		UIActor = (varScript.DialogueFollower.GetAlias(mySlot) as referencealias).GetReference() as actor
		self.UICmdOneMenu(UIActor)
	endIf
endFunction

String function GetActorName(actor lookAct)

	String myName = lookAct.GetDisplayName()
	if !myName || myName == " "
		myName = lookAct.GetBaseObject().GetName()
	endIf
	return myName
endFunction

function UIOpenHistory()

	actor histActor
	String numVal
	Int histCount = varScript.nwsHistoryCount.GetValue() as Int
	UIChoices = utility.CreateStringArray(histCount + 3, "")
	UIChoices[0] = "$FF_Exit"
	Int index = 1
	while index < histCount + 1
		UIChoices[index] = historyScript.historyDisplayMenu[index - 1]
		index += 1
	endWhile
	UIChoices[histCount + 1] = "$FF_Refresh"
	UIChoices[histCount + 2] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_HistoryTitle{" + histCount as String + "}", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == histCount + 2
			self.UIHistoryFav()
		elseIf UIPick == histCount + 1
			UIPick = -1
			self.UINotifyPlayer("$FF_BuildHistory", 2)
			historyScript.HistoryLoad()
			self.UIOpenHistory()
		else
			self.UITeleportSub(UIPick - 1)
		endIf
	endIf
endFunction

; Skipped compiler generated GotoState

function UILoadSaveTweaks()

	UIChoices = utility.CreateStringArray(4, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_SaveFol"
	UIChoices[2] = "$FF_LoadFol"
	UIChoices[3] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_LoadSaveTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			(nwsFollowerSettings as nwsfollowersettingsscript).LoadSaveTweaks(UIActor, false)
			self.UINotifyPlayer("$FF_TweaksSaved", 1)
		elseIf UIPick == 2
			(nwsFollowerSettings as nwsfollowersettingsscript).LoadSaveTweaks(UIActor, true)
			self.UINotifyPlayer("$FF_TweaksLoaded", 1)
		elseIf UIPick == 3
			self.UICmdOneFollower()
		endIf
	endIf
endFunction

function UIInventory()

	UIChoices = utility.CreateStringArray(13, "")
	UIPos0 = 0
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_Trade"
	UIChoices[2] = "$FF_OpenStorage"
	String choiceStr = "Set Outfit"
	if UIActor.IsInFaction(varScript.nwsFF_storedFac)
		choiceStr = "Change Outfit"
	endIf
	UIChoices[3] = choiceStr + " (" + setsScript.nwsFFsetsUsed as String + "/" + setsScript.storedMax as String + ")"
	if UIActor.IsInFaction(varScript.nwsFF_storedFac)
		UIPos0 = 1
		UIChoices[4] = "Restore Outfit"
	endIf
	UIChoices[UIPos0 + 4] = "$FF_SellItems"
	self.DisplayLooting()
	String chString = "$FF_HeadwearOff"
	if UIActor.IsInFaction(varScript.nwsFF_HelmFac)
		chString = "$FF_HeadwearNone"
		if UIActor.GetFactionRank(varScript.nwsFF_HelmFac) == 1
			chString = "$FF_HeadwearNone"
		elseIf (UIAlias as followeraliasscript).wornHelmet != none
			String itemName = (UIAlias as followeraliasscript).wornHelmet.GetName()
			if stringutil.GetLength(itemName) > 25
				itemName = stringutil.Substring(itemName, 0, 25) + "..."
			endIf
			chString = "Stored Headwear: " + itemName + " >"
		endIf
	endIf
	UIChoices[UIPos0 + 7] = chString
	chString = "$FF_ShieldOff"
	if UIActor.IsInFaction(varScript.nwsFF_ShieldFac)
		chString = "$FF_ShieldNone"
		if (UIAlias as followeraliasscript).outfitShield != none
			String itemname = (UIAlias as followeraliasscript).outfitShield.GetName()
			if stringutil.GetLength(itemname) > 25
				itemname = stringutil.Substring(itemname, 0, 25) + "..."
			endIf
			chString = "Stored Shield: " + itemname + " >"
		endIf
	endIf
	UIChoices[UIPos0 + 8] = chString
	UIChoices[UIPos0 + 9] = "$FF_Undress"
	UIChoices[UIPos0 + 10] = "$FF_Redress"
	UIChoices[UIPos0 + 11] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_InvTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			UIActor.OpenInventory(false)
		elseIf UIPick == 2
			(nwsFollowerXStorage as nwsfollowerxstorescript).OpenStorage(UIActor, false)
		elseIf UIPick == 3
			setsScript.CreateOutfit(UIActor, 0)
		elseIf UIPick == UIPos0 + 3
			setsScript.RemoveOutfit(UIActor, 0)
		elseIf UIPick == UIPos0 + 4
			if controlScript.isSellingItems == 0
				self.UINotifyPlayer("$FF_OpenSell", 1)
				controlScript.CreateSale(UIActor)
			endIf
		elseIf UIPick == UIPos0 + 5
			self.UILootSub()
		elseIf UIPick == UIPos0 + 6
			self.UISendLootSub()
		elseIf UIPick == UIPos0 + 7
			self.UIHeadwearSub()
		elseIf UIPick == UIPos0 + 8
			self.UIShieldSub()
		elseIf UIPick == UIPos0 + 9
			self.UINotifyPlayer("$FF_Undressing", 1)
			utility.Wait(0.500000)
			UIActor.UnequipAll()
			UIActor.UnequipAll()
		elseIf UIPick == UIPos0 + 10
			self.UINotifyPlayer("$FF_Redressing", 1)
			UIActor.UnequipAll()
			UIActor.UnequipAll()
			(UIAlias as followeraliasscript).RefreshVisual()
		elseIf UIPick == UIPos0 + 11
			self.UICmdOneMenu(UIActor)
		endIf
	endIf
endFunction

function UIShieldSub()

	UIChoices = utility.CreateStringArray(3, "")
	UIChoices[0] = "$FF_Exit"
	if UIActor.IsInFaction(varScript.nwsFF_ShieldFac)
		UIChoices[1] = "$FF_ShieldCombatOn"
	else
		UIChoices[1] = "$FF_ShieldCombatOff"
	endIf
	UIChoices[2] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_ShieldTitle", UIChoices, 0, 0)
	if UIPick
		if UIPick == 1
			if UIActor.IsInFaction(varScript.nwsFF_ShieldFac)
				UIActor.RemoveFromFaction(varScript.nwsFF_ShieldFac)
				(UIAlias as followeraliasscript).outfitShield = none
			else
				UIActor.AddToFaction(varScript.nwsFF_ShieldFac)
			endIf
			self.UINotifyPlayer("$FF_ShieldApplied", 0)
			(UIAlias as followeraliasscript).CheckFollower(0.500000, false, false)
		elseIf UIPick == 2
			self.UIInventory()
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

function SetToRetreat()

	isRetreat = 1
	self.RegisterForSingleUpdate(45 as Float)
endFunction

function UIPickFavActor(Int myOpt, String catName)

	actor tmpAct
	formList myList = favScript.nwsFavLists.GetAt(myOpt) as formList
	Int listLen = myList.GetSize()
	Int index = 0
	Int count = 0
	UIChoices = utility.CreateStringArray(listLen + 8, "")
	UIChoices[0] = "$FF_Exit"
	if listLen < 1
		UIChoices[1] = "- No Favorites -"
		count += 2
	else
		while index < listLen
			tmpAct = myList.GetAt(index) as actor
			String tmpName = (index + 1) as String + " - " + self.GetActorName(tmpAct) + "   (" + self.GetLocName(tmpAct) + ")"
			UIChoices[index + 1] = tmpName
			index += 1
		endWhile
		count += listLen + 1
	endIf
	UIChoices[count] = "$FF_RenCategory"
	count += 1
	if myOpt > 0
		UIChoices[count] = "$FF_RemCategory"
		count += 1
	endIf
	if listLen > 0
		UIChoices[count] = "$FF_FavPortM"
		count += 1
	endIf
	if listLen > 0
		UIChoices[count] = "$FF_FavWaitingM"
		count += 1
	endIf
	if listLen > 0
		UIChoices[count] = "$FF_FavFollowM"
		count += 1
	endIf
	UIChoices[count] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList(catName, UIChoices, 0, 0)
	if UIPick > 0
		Bool doNotify = false
		if listLen == 0
			if UIPick == 2
				favScript.NameList(myOpt)
				self.UIPickFavActor(myOpt, catName)
			elseIf myOpt != 0
				if UIPick == 3
					favScript.RemoveList(myOpt)
					self.UIPickFavorite(0, false, none)
				else
					self.UIPickFavorite(0, false, none)
				endIf
			else
				self.UIPickFavorite(0, false, none)
			endIf
		elseIf UIPick < listLen + 1
			UIActor = myList.GetAt(UIPick - 1) as actor
			self.UIFavoriteAction(myOpt)
		elseIf UIPick == listLen + 1
			favScript.NameList(myOpt)
			self.UIPickFavActor(myOpt, catName)
		elseIf UIPick == listLen + 2 && myOpt > 0
			favScript.RemoveList(myOpt)
			self.UIPickFavorite(0, false, none)
		elseIf UIPick == listLen + 2 && myOpt == 0 || UIPick == listLen + 3 && myOpt > 0
			index = 0
			while index < listLen
				tmpAct = myList.GetAt(index) as actor
				if tmpAct
					boxScript.MoveFollower(tmpAct, 1, false, 256.000)
					doNotify = true
				endIf
				index += 1
			endWhile
			if doNotify
				self.UINotifyPlayer("$FF_FavPort", 0)
			endIf
		elseIf UIPick == listLen + 3 && myOpt == 0 || UIPick == listLen + 4 && myOpt > 0
			index = 0
			while index < listLen
				tmpAct = myList.GetAt(index) as actor
				if tmpAct
					if tmpAct.IsInFaction(varScript.nwsFF_FollowerFac)
						controlScript.FollowerWaitAction(tmpAct, 0, 0)
						doNotify = true
					endIf
				endIf
				index += 1
			endWhile
			if doNotify
				self.UINotifyPlayer("$FF_FavWaiting", 0)
			endIf
		elseIf UIPick == listLen + 4 && myOpt == 0 || UIPick == listLen + 5 && myOpt > 0
			index = 0
			while index < listLen
				tmpAct = myList.GetAt(index) as actor
				if tmpAct
					if tmpAct.IsInFaction(varScript.nwsFF_FollowerFac)
						controlScript.FollowerFollowAction(tmpAct, 0)
						doNotify = true
					endIf
				endIf
				index += 1
			endWhile
			if doNotify
				self.UINotifyPlayer("$FF_FavFollow", 0)
			endIf
		elseIf UIPick == listLen + 5 && myOpt == 0 || UIPick == listLen + 6 && myOpt > 0
			self.UIPickFavorite(0, false, none)
		endIf
	endIf
endFunction

function UIRoleSub()

	UIMagicka = UIActor.GetActorValue("Magicka") as Int
	UIStamina = UIActor.GetActorValue("Stamina") as Int
	Int roleCount = 1
	roleCount += (UIMagicka >= 80 || UIStamina >= 50) as Int
	roleCount += (UIStamina >= 30) as Int
	UIChoices = utility.CreateStringArray(roleCount + 2, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_Role_0"
	roleCount = 1
	if UIMagicka >= 80 || UIStamina >= 50
		roleCount += 1
		UIChoices[roleCount] = "$FF_Role_1"
	endIf
	if UIStamina >= 30
		roleCount += 1
		UIChoices[roleCount] = "$FF_Role_2"
	endIf
	UIChoices[4] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_SetRole", UIChoices, 0, 0)
	if UIPick > 0
		Int rolePick = -1
		Int mVal = 1
		if UIPick == 1
			rolePick = 0
		endIf
		if UIMagicka >= 80 || UIStamina >= 50
			mVal += 1
			if UIPick == mVal
				rolePick = 1
			endIf
		endIf
		if UIStamina >= 30
			mVal += 1
			if UIPick == mVal
				rolePick = 2
			endIf
		endIf
		if rolePick > -1
			controlScript.SetFollowerRole(UIActor, rolePick)
			self.UINotifyPlayer("$FF_RoleSet", 2)
		endIf
		self.UITraitSub()
	endIf
endFunction

function UIPickFavorite(Int myOpt, Bool doAdd, actor sentActor)

	UIChoices = utility.CreateStringArray(favScript.maxNumLists + 2, "")
	UIChoices[0] = "$FF_Exit"
	Int index = 0
	while index < favScript.maxNumLists
		String tmpName = favScript.favListNames[index]
		if favScript.favListUsed[index] > 0
			if index == 0 && stringutil.GetLength(tmpName) <= 1
				tmpName = " Default Favorites"
			else
				tmpName = " " + tmpName
			endIf
		else
			tmpName = " Empty"
		endIf
		tmpName = (index + 1) as String + " -" + tmpName
		UIChoices[index + 1] = tmpName
		index += 1
	endWhile
	UIChoices[index + 1] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("Favorite Categories", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick < index + 1
			favPick = UIPick - 1
			String catName = favScript.GetListName(favPick)
			if doAdd
				if favScript.favListUsed[favPick] < 1
					favScript.AddNewList(favPick)
				endIf
				favScript.AddNewFavorite(favPick, UIActor)
				self.UINotifyPlayer("$FF_FavoritesAdded", 1)
				historyScript.removeAct = UIActor
				historyScript.actionKey = 1
				historyScript.RegisterForSingleUpdate(0.500000)
				if myOpt == 1
					UIActor = sentActor
					self.UICmdOnePotential()
				elseIf myOpt == 2
					UIActor = sentActor
					self.UICmdOneMenu(UIActor)
				elseIf myOpt == 3
					UIActor = sentActor
					self.UIOpenHistory()
				endIf
			else
				if favScript.favListUsed[favPick] < 1
					favScript.AddNewList(favPick)
				endIf
				self.UIPickFavActor(favPick, favScript.GetListName(favPick))
			endIf
		elseIf myOpt == 0
			self.UIHistoryFav()
		elseIf myOpt == 1
			UIActor = sentActor
			self.UICmdOnePotential()
		elseIf myOpt == 2
			UIActor = sentActor
			self.UICmdOneMenu(UIActor)
		elseIf myOpt == 3
			UIActor = sentActor
			self.UIOpenHistory()
		endIf
	endIf
endFunction

function UICmdOnePotential()

	UIChoices = utility.CreateStringArray(11, "")
	UIChoices[0] = "Health: " + UIHeath as String + ", Magicka: " + UIMagicka as String + ", Stamina: " + UIStamina as String + " [x]"
	UIChoices[1] = "$FF_SkillMenu"
	UIChoices[2] = "$FF_SpellMenu"
	UIChoices[3] = "$FF_Traits"
	UIChoices[4] = "$FF_Recruit"
	UIChoices[5] = "$FF_DoFavor"
	UIChoices[6] = "$FF_Trade"
	Bool doAdd = false
	if favScript.FindFavorite(UIActor, false)
		UIChoices[7] = "$FF_FavoriteRemove"
	else
		doAdd = true
		UIChoices[7] = "$FF_FavoriteAdd"
	endIf
	UIChoices[8] = "$FF_SetHomeBase"
	if UIActor.IsInFaction(varScript.nwsFF_HomeFac)
		UIChoices[9] = "$FF_SendHome"
		UIChoices[10] = "$FF_SubAll"
	else
		UIChoices[9] = "$FF_SubAll"
	endIf
	UIPick = ((self as form) as uilib_1).ShowList(self.GetActorName(UIActor) + "*", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			self.UISkills()
		elseIf UIPick == 2
			self.UISpells()
		elseIf UIPick == 3
			self.UITraitSub()
		elseIf UIPick == 4
			controlScript.RecruitAction(UIActor, 1)
		elseIf UIPick == 5
			UIActor.SetDoingFavor(true)
		elseIf UIPick == 6
			UIActor.OpenInventory(true)
		elseIf UIPick == 7
			if doAdd
				self.UIPickFavorite(1, true, UIActor)
			else
				favScript.FindFavorite(UIActor, true)
				self.UINotifyPlayer("$FF_FavoritesRemoved", 0)
				controlScript.RecordHistory(UIActor)
				self.UIOpenHistory()
			endIf
		elseIf UIPick == 8
			self.UIHomeBase()
		elseIf UIPick == 9 && UIActor.IsInFaction(varScript.nwsFF_HomeFac)
			Int hLoc = UIActor.GetFactionRank(varScript.nwsFF_HomeFac)
			objectreference hMarker = homeScript.nwsHomeMarkers[hLoc]
			UIActor.MoveTo(hMarker, 0.000000, 0.000000, 0.000000, true)
			self.UINotifyPlayer("Follower Sent Home", 0)
		elseIf UIPick == 10 && UIActor.IsInFaction(varScript.nwsFF_HomeFac) || UIPick == 9
			self.UICmdAllMenu()
		endIf
	endIf
endFunction

function UIConfidenceSub()

	UIChoices = utility.CreateStringArray(7, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_Confidence1"
	UIChoices[2] = "$FF_Confidence2"
	UIChoices[3] = "$FF_Confidence3"
	UIChoices[4] = "$FF_Confidence4"
	UIChoices[5] = "$FF_Confidence5"
	UIChoices[6] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_SetConfidence", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick > 0 && UIPick < 6
			if UIAll
				controlScript.DoTaskAll(30, UIPick - 1)
				self.UINotifyPlayer("$FF_ConSetAll", 2)
				self.UITraitAllSub()
			else
				if !UIActor.IsInFaction(varScript.nwsFF_ConfFac)
					UIActor.AddToFaction(varScript.nwsFF_ConfFac)
				endIf
				UIActor.SetFactionRank(varScript.nwsFF_ConfFac, UIPick - 1)
				UIActor.SetActorValue("Confidence", (UIPick - 1) as Float)
				self.UINotifyPlayer("$FF_ConSet", 2)
				self.UITraitSub()
			endIf
		endIf
	endIf
endFunction

function UICStyleSub()

	UIChoices = utility.CreateStringArray(13, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_UseDefault"
	UIChoices[2] = "$FF_CombatStyle1"
	UIChoices[3] = "$FF_CombatStyle2"
	UIChoices[4] = "$FF_CombatStyle3"
	UIChoices[5] = "$FF_CombatStyle4"
	UIChoices[6] = "$FF_CombatStyle5"
	UIChoices[7] = "$FF_CombatStyle6"
	UIChoices[8] = "$FF_CombatStyle7"
	UIChoices[9] = "$FF_CombatStyle8"
	UIChoices[10] = "$FF_CombatStyle9"
	UIChoices[11] = "$FF_CombatStyle10"
	UIChoices[12] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_SetCStyle", UIChoices, 0, 0)
	if UIPick > 0
		if UIActor.GetActorBase().IsUnique()
			if UIPick == 1
				controlScript.SetCombatST(UIAlias, UIActor, 0, -1)
				self.UINotifyPlayer("$FF_CombatStyleSet", 2)
			elseIf UIPick > 1 && UIPick < 12
				controlScript.SetCombatST(UIAlias, UIActor, 1, UIPick - 2)
				self.UINotifyPlayer("$FF_CombatStyleSet", 2)
			endIf
		else
			self.UINotifyPlayer("$FF_CombatStyleWarn", 0)
		endIf
		self.UITraitSub()
	endIf
endFunction

function UIRangeSub()

	UIChoices = utility.CreateStringArray(5, "")
	UIChoices[0] = "$FF_Exit"
	if UIActor.GetFactionRank(varScript.nwsFF_NCRangeFac) == 1
		UIChoices[1] = "$FF_FollowClose"
	elseIf UIActor.GetFactionRank(varScript.nwsFF_NCRangeFac) == 2
		UIChoices[1] = "$FF_FollowFar"
	else
		UIChoices[1] = "$FF_FollowMed"
	endIf
	if UIActor.GetFactionRank(varScript.nwsFF_RangeFac) == 1 || UIActor.GetFactionRank(varScript.nwsFF_RangeFac) == 4
		UIChoices[2] = "$FF_CombatClose"
	elseIf UIActor.GetFactionRank(varScript.nwsFF_RangeFac) == 2 || UIActor.GetFactionRank(varScript.nwsFF_RangeFac) == 5
		UIChoices[2] = "$FF_CombatFar"
	else
		UIChoices[2] = "$FF_CombatMed"
	endIf
	UIChoices[3] = "$FF_EnforceRangeOff"
	if UIActor.IsInFaction(varScript.nwsFF_RangeFac)
		if UIActor.GetFactionRank(varScript.nwsFF_RangeFac) >= 3
			UIChoices[3] = "$FF_EnforceRangeOn"
		endIf
	endIf
	UIChoices[4] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_RangeTitle", UIChoices, 0, 0)
	if UIPick
		if UIPick == 1
			UIAll = false
			self.UIRangeDist(0)
		elseIf UIPick == 2
			UIAll = false
			self.UIRangeDist(1)
		elseIf UIPick == 3
			controlScript.TogEnforceCbt(UIActor)
			self.UIRangeSub()
		elseIf UIPick == 4
			self.UICmdOneMenu(UIActor)
		endIf
	endIf
endFunction

function UIHistoryFav()

	UIChoices = utility.CreateStringArray(5, "")
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_ShowHistory"
	UIChoices[2] = "$FF_Favorites"
	UIChoices[3] = "$FF_SortSlots"
	UIChoices[4] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_HistoryFavTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			self.UIOpenHistory()
		elseIf UIPick == 2
			self.UIPickFavorite(0, false, none)
		elseIf UIPick == 3
			controlScript.SortSlotsAll()
		elseIf UIPick == 4
			self.UICmdAllMenu()
		endIf
	endIf
endFunction

function UISummon()

	UIFolCnt = varScript.nwsFollowerCount.GetValue() as Int
	UIChoices = utility.CreateStringArray(UIFolCnt + 3, "")
	UISlots = utility.CreateIntArray(UIFolCnt + 3, 0)
	Int index = 0
	Int count = 2
	UIChoices[0] = "$FF_Exit"
	UIChoices[1] = "$FF_All"
	while index < 12
		referencealias checkAlias = varScript.DialogueFollower.GetAlias(index) as referencealias
		if checkAlias
			actor follower = checkAlias.GetReference() as actor
			if follower
				UIChoices[count] = self.GetActorName(follower)
				UISlots[count] = index
				count += 1
			endIf
		endIf
		index += 1
	endWhile
	UIChoices[count] = "$FF_Back"
	UIPick = ((self as form) as uilib_1).ShowList("$FF_SummonTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			boxScript.DoTaskAll(2, 1)
		elseIf UIPick > 1 && UIPick < varScript.nwsFollowerCount.GetValue() as Int + 2
			Int mySlot = UISlots[UIPick]
			UIActor = (varScript.DialogueFollower.GetAlias(mySlot) as referencealias).GetReference() as actor
			boxScript.MoveFollower(UIActor, 1, false, 256.000)
		else
			self.UICmdAllMenu()
		endIf
	endIf
endFunction

function UICmdAllMenu()

	UIChoices = utility.CreateStringArray(12, "")
	UIChoices[0] = "$FF_Exit"
	if isRetreat
		UIChoices[1] = "$FF_FollowersRetreatCancel"
	else
		UIChoices[1] = "$FF_FollowersRetreat"
	endIf
	UIChoices[2] = "$FF_AllWaitFollow"
	UIChoices[3] = "$FF_InventoryLoot"
	UIChoices[4] = "$FF_SummonAll"
	UIChoices[5] = "$FF_SandboxToggle"
	UIChoices[6] = "$FF_HistoryFav"
	UIChoices[7] = "$FF_RangeAll"
	UIChoices[8] = "$FF_TraitsAll"
	UIChoices[9] = "$FF_DismissAll"
	UIChoices[10] = "$FF_KeyHorseM"
	UIChoices[11] = "$FF_SubSingle"
	String strTitle = "$FF_CommandAll"
	UIPick = ((self as form) as uilib_1).ShowList(strTitle, UIChoices, 0, 0)
	if UIPick > 0
		if UIPick == 1
			if isRetreat
				isRetreat = 0
				varScript.nwsRetreatCancel.Cast(myPlayer as objectreference, none)
				self.UINotifyPlayer("$FF_FollowersRetreatingCancel", 0)
			else
				self.UINotifyPlayer("$FF_FollowersRetreating", 0)
				varScript.nwsRetreatAllies.Cast(myPlayer as objectreference, none)
				controlScript.DoTaskAll(15, 0)
				self.SetToRetreat()
			endIf
		elseIf UIPick == 2
			self.UIWaitAllSub()
		elseIf UIPick == 3
			self.UILoot()
		elseIf UIPick == 4
			self.UISummon()
		elseIf UIPick == 5
			controlScript.ToggleSandbox()
		elseIf UIPick == 6
			self.UIHistoryFav()
		elseIf UIPick == 7
			self.UIRangeSubAll()
		elseIf UIPick == 8
			self.UITraitAllSub()
		elseIf UIPick == 9
			controlScript.DismissAll()
		elseIf UIPick == 10
			mountScript.CallHorse()
		elseIf UIPick == 11
			self.UISelectOneMenu()
		endIf
	endIf
endFunction

function UISpells()

	spell actSpell
	String spellName
	actorbase actBase = UIActor.GetActorBase()
	Int baseCount = actBase.GetSpellCount()
	Int grantedCount = UIActor.GetSpellCount()
	String[] namesList = new String[100]
	Int index = 0
	Int count = 0
	if grantedCount > 0
		while index < grantedCount
			actSpell = UIActor.GetNthSpell(index)
			spellName = actSpell.GetName()
			Float fxTotal = actSpell.GetCastTime()
			Int fxIndex = 0
			while fxIndex < actSpell.GetNumEffects()
				fxTotal += actSpell.GetNthEffectArea(fxIndex) as Float
				fxTotal += actSpell.GetNthEffectDuration(fxIndex) as Float
				magiceffect spellEffect = actSpell.GetNthEffectMagicEffect(fxIndex)
				if spellEffect.GetCastingType() == 2
					fxTotal += 1 as Float
				endIf
				fxIndex += 1
			endWhile
			if fxTotal > 0.500000 && spellName != ""
				namesList[count] = spellName
				count += 1
			endIf
			index += 1
		endWhile
	endIf
	if UIActor.HasMagicEffect(varScript.nwsSharpenWeapons)
		namesList[count] = "$FF_BuffSharpen"
		count += 1
	endIf
	if UIActor.IsInFaction(varScript.nwsFF_RegardFac)
		if UIActor.GetFactionRank(varScript.nwsFF_RegardFac) >= 6
			namesList[count] = "$FF_BuffCourage"
			count += 1
		endIf
	endIf
	if UIActor.HasMagicEffect(varScript.nwsFortifyHealthFX)
		namesList[count] = "$FF_BuffInspired"
		count += 1
	endIf
	Int spellCount = count + baseCount
	if spellCount == 0
		UIChoices = utility.CreateStringArray(3, "")
		UIChoices[1] = "$FF_None"
		UIChoices[2] = "$FF_Back"
	else
		UIChoices = utility.CreateStringArray(spellCount + 2, "")
		UIChoices[spellCount + 1] = "$FF_Back"
	endIf
	UIChoices[0] = "$FF_Exit"
	if spellCount > 0
		index = 0
		while index < spellCount
			if index >= baseCount
				spellName = namesList[index - baseCount]
			else
				actSpell = actBase.GetNthSpell(index)
				spellName = actSpell.GetName() + "*"
			endIf
			UIChoices[index + 1] = spellName
			index += 1
		endWhile
	endIf
	UIPick = ((self as form) as uilib_1).ShowList("$FF_SpellTitle", UIChoices, 0, 0)
	if UIPick > 0
		if UIType == 1
			self.UICmdOnePotential()
		elseIf UIType == 2
			self.UICmdOneNPC()
		else
			self.UICmdOneFollower()
		endIf
	endIf
endFunction
