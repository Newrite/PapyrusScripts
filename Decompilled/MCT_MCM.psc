;/ Decompiled by Champollion V1.0.1
Source   : MCT_MCM.psc
Modified : 2021-01-31 04:42:17
Compiled : 2021-01-31 04:42:19
User     : george
Computer : GAME-PC
/;
scriptName MCT_MCM extends ski_configbase

;-- Properties --------------------------------------
perk property MCT_IncreasedDamageWithPenetratesArmor auto
mct_escapelistener property escapeQuest auto
perk property MCT_IncreasedDamageFromPenetrationWeapon auto
perk property MCT_IncreasedDamageFromPenetrationActor auto
perk property MCT_AttackSweepOnTwohand auto
spell property MCT_CombatFocusPowerLesser auto
globalvariable property MCT_SprintToSneakEnabled auto
mct_controllistener property forwardKeyListener auto
mct_sheathkeylistener property sheathKeyListener auto
spell property MCT_CombatFocusAbility auto
spell property MCT_CombatFocusPower auto
mct_controllistener property leftKeyListener auto
spell property MCT_CombatFocusActivatedAbility auto
mct_main property mainQuest auto
globalvariable property MCT_swingStaminaRecoverLag auto
globalvariable property MCT_KeySheathe auto
mct_sneakkeylistener property sneakKeyListener auto
spell property MCT_NoStaminaRegenWhileRunning auto
globalvariable property MCT_PowerAttackInuryEnabled auto
globalvariable property MCT_PowerAttackEtherealizeEnabled auto
mct_controllistener property backKeyListener auto
globalvariable property MCT_swingStaminaRecoverMult auto
globalvariable property MCT_BashStaminaMult auto
globalvariable property MCT_swingStaminaMult auto
globalvariable property MCT_swingStaminaBase auto
mct_controllistener property rightKeyListener auto
globalvariable property MCT_KeySneak auto
globalvariable property MCT_StaggerMagnitudeBase auto
globalvariable property MCT_PowerAttackSlowTimeEnabled auto
quest property staminaQuest auto

;-- Variables ---------------------------------------
Int powerAttackInjuryEnabledId
Int playerStaminaDrainId
Int bashStaminaMultId
Int twohandAttackSweepsEnabledId
Int activateToSheathId
Int escapeStaminaBaseId
Int permanentCombatFocusId
Int fCombatDistanceId
Int sneakKeyId
Int powerAttackEtherealizeEnabledId
Int fCombatStaminaRegenRateMultId
Int leftKeyId
Int staggerMagnitudeBaseId
Int backwardKeyId
Int noStaminaRegenWhileRunningId
Int toggleMCTId
Int escapeStaminaMultId
Int sheatheKeyId
Int swingStaminaRecoverLagId
Int powerAttackSlowTimeEnabledId
Int armorPenetrationsEnabledId
Int dailyPowerCombatFocusId
Int lesserPowerCombatFocusId
Int swingStaminaRecoverMultId
Int swingStaminaMultId
Int fSprintStaminaWeightMultId
Int fCombatBashReachId
Int forwardKeyId
Int rightKeyId
Int fWeaponTwoHandedAnimationSpeedMultId
Int swingStaminaBaseId

;-- Functions ---------------------------------------

function OnInit()

	debug.trace("MCT_MCM OnInit", 0)
	parent.OnInit()
	utility.wait(1 as Float)
	self.OnGameReload()
endFunction

function OnVersionUpdate(Int version)

	debug.trace("Engarde updating to build: " + version as String, 0)
	Pages = new String[6]
	Pages[0] = "GameSettings"
	Pages[1] = "Stamina"
	Pages[2] = "Stagger"
	Pages[3] = "Attacks"
	Pages[4] = "KeyButton"
	Pages[5] = "Others"
endFunction

; Skipped compiler generated GotoState

function OnPageReset(String page)

	self.RegisterForSingleUpdate(1 as Float)
	self.OnGameReload()
	self.resetId()
	actor playerRef = game.getPlayer()
	if page == "" || page == "GameSettings"
		self.AddTextOption("This page is for", "", 0)
		self.AddTextOption("Use TES5Edit or SSEEdit", "", 0)
		self.AddTextOption("display only", "", 0)
		self.AddTextOption("to change game settings", "", 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddHeaderOption("Attack Distances:", 0)
		self.AddEmptyOption()
		fCombatDistanceId = self.AddTextOption("Melee distance", game.getGameSettingFloat("fCombatDistance") as String, 0)
		fCombatBashReachId = self.AddTextOption("Bash distance", game.getGameSettingFloat("fCombatBashReach") as String, 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddHeaderOption("Attack Speed:", 0)
		self.AddEmptyOption()
		fWeaponTwoHandedAnimationSpeedMultId = self.AddTextOption("Two hand attack speed", game.getGameSettingFloat("fWeaponTwoHandedAnimationSpeedMult") as String, 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddHeaderOption("Stamina:", 0)
		self.AddEmptyOption()
		fCombatStaminaRegenRateMultId = self.AddTextOption("Combat stamina regen rate", game.getGameSettingFloat("fCombatStaminaRegenRateMult") as String, 0)
		fSprintStaminaWeightMultId = self.AddTextOption("Sprint stamina usage rate", game.getGameSettingFloat("fSprintStaminaWeightMult") as String, 0)
	elseIf page == "Stamina"
		self.AddHeaderOption("Attacking:", 0)
		self.AddEmptyOption()
		playerStaminaDrainId = self.AddToggleOption("Soul-like stamina system", staminaQuest.isRunning(), 0)
		self.AddEmptyOption()
		swingStaminaBaseId = self.AddSliderOption("Cost per swinging", MCT_swingStaminaBase.getValue(), "{0}", 0)
		swingStaminaMultId = self.AddSliderOption("Cost per weapon weight", MCT_swingStaminaMult.getValue(), "{1}", 0)
		swingStaminaRecoverMultId = self.AddSliderOption("Recovered percentage", MCT_swingStaminaRecoverMult.getValue(), "{2}", 0)
		swingStaminaRecoverLagId = self.AddSliderOption("Recovery lag", MCT_swingStaminaRecoverLag.getValue(), "{1}", 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddHeaderOption("Movement:", 0)
		self.AddEmptyOption()
		noStaminaRegenWhileRunningId = self.AddToggleOption("No stamina regen while running", playerRef.hasSpell(MCT_NoStaminaRegenWhileRunning as form), 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddHeaderOption("Bashing:", 0)
		self.AddEmptyOption()
		bashStaminaMultId = self.AddSliderOption("Bash multiplier", MCT_BashStaminaMult.getValue(), "{1}", 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddHeaderOption("Dodging:", 0)
		self.AddEmptyOption()
		escapeStaminaBaseId = self.AddSliderOption("Base cost", escapeQuest.escapeStaminaBase, "{0}", 0)
		escapeStaminaMultId = self.AddSliderOption("Additional cost based on armor", escapeQuest.escapeStaminaMult, "{1}", 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
	elseIf page == "Stagger"
		staggerMagnitudeBaseId = self.AddSliderOption("Duration modifier", MCT_StaggerMagnitudeBase.getValue(), "{2}", 0)
	elseIf page == "Attacks"
		self.AddHeaderOption("Power Attack Effects:", 0)
		self.AddEmptyOption()
		powerAttackSlowTimeEnabledId = self.AddToggleOption("Slow time", MCT_PowerAttackSlowTimeEnabled.getValueInt() as Bool, 0)
		powerAttackEtherealizeEnabledId = self.AddToggleOption("Invincible frames", MCT_PowerAttackEtherealizeEnabled.getValueInt() as Bool, 0)
		powerAttackInjuryEnabledId = self.AddToggleOption("Injury", MCT_PowerAttackInuryEnabled.getValueInt() as Bool, 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddHeaderOption("Twohanded attack:", 0)
		self.AddEmptyOption()
		twohandAttackSweepsEnabledId = self.AddToggleOption("Sweeps", playerRef.hasPerk(MCT_AttackSweepOnTwohand), 0)
		armorPenetrationsEnabledId = self.AddToggleOption("Armor penetration", playerRef.hasPerk(MCT_IncreasedDamageWithPenetratesArmor), 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
	elseIf page == "KeyButton"
		self.AddHeaderOption("Direction keys:", 0)
		self.AddEmptyOption()
		forwardKeyId = self.AddKeyMapOption("Forward key", forwardKeyListener.keyToListen, 0)
		backwardKeyId = self.AddKeyMapOption("Backward key", backKeyListener.keyToListen, 0)
		leftKeyId = self.AddKeyMapOption("Left key", leftKeyListener.keyToListen, 0)
		rightKeyId = self.AddKeyMapOption("Right key", rightKeyListener.keyToListen, 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddHeaderOption("Other keys:", 0)
		self.AddEmptyOption()
		activateToSheathId = self.AddToggleOption("Interact key sheathes", sheathKeyListener.activateToSheathe, 0)
		if !sheathKeyListener.activateToSheathe
			sheatheKeyId = self.AddKeyMapOption("Sheathe key", MCT_KeySheathe.getValueInt(), 0)
		else
			self.AddEmptyOption()
		endIf
		if !MCT_SprintToSneakEnabled.getValueInt()
			sneakKeyId = self.AddKeyMapOption("Sneak key", MCT_KeySneak.getValueInt(), 0)
			self.AddEmptyOption()
		endIf
		self.AddEmptyOption()
		self.AddEmptyOption()
	elseIf page == "Others"
		self.AddHeaderOption("Combat Focus:", 0)
		self.AddEmptyOption()
		lesserPowerCombatFocusId = self.AddToggleOption("Togglable power", playerRef.hasSpell(MCT_CombatFocusPowerLesser as form), 0)
		dailyPowerCombatFocusId = self.AddToggleOption("Daily power", playerRef.hasSpell(MCT_CombatFocusPower as form), 0)
		permanentCombatFocusId = self.AddToggleOption("Always active", playerRef.hasSpell(MCT_CombatFocusAbility as form), 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddHeaderOption("Entire mod:", 0)
		self.AddEmptyOption()
		if mainQuest.isRunning()
			toggleMCTId = self.AddToggleOption("Deactivate mod", true, 0)
		else
			toggleMCTId = self.AddToggleOption("Activate mod", false, 0)
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

function addAllPerk(FormList perkList)

	actor player = game.getPlayer()
	Int iIndex = perkList.GetSize()
	while iIndex
		iIndex -= 1
		perk perkToAdd = perkList.getAt(iIndex) as perk
		player.addPerk(perkToAdd)
	endWhile
endFunction

function OnOptionSliderAccept(Int option, Float value)

	if option == staggerMagnitudeBaseId
		MCT_StaggerMagnitudeBase.setValue(value)
		self.SetSliderOptionValue(staggerMagnitudeBaseId, value, "{2}", false)
		return 
	endIf
	if option == swingStaminaBaseId
		MCT_swingStaminaBase.setValue(value)
		self.SetSliderOptionValue(swingStaminaBaseId, value, "{0}", false)
		return 
	endIf
	if option == swingStaminaMultId
		MCT_swingStaminaMult.setValue(value)
		self.SetSliderOptionValue(swingStaminaMultId, value, "{1}", false)
		return 
	endIf
	if option == swingStaminaRecoverMultId
		MCT_swingStaminaRecoverMult.setValue(value)
		self.SetSliderOptionValue(swingStaminaRecoverMultId, value, "{2}", false)
		return 
	endIf
	if option == swingStaminaRecoverLagId
		MCT_swingStaminaRecoverLag.setValue(value)
		self.SetSliderOptionValue(swingStaminaRecoverLagId, value, "{1}", false)
		return 
	endIf
	if option == bashStaminaMultId
		MCT_BashStaminaMult.setValue(value)
		self.SetSliderOptionValue(bashStaminaMultId, value, "{1}", false)
		return 
	endIf
	if option == escapeStaminaBaseId
		escapeQuest.escapeStaminaBase = value
		self.SetSliderOptionValue(escapeStaminaBaseId, value, "{0}", false)
		return 
	endIf
	if option == escapeStaminaMultId
		escapeQuest.escapeStaminaMult = value
		self.SetSliderOptionValue(escapeStaminaMultId, value, "{1}", false)
		return 
	endIf
endFunction

Int function GetVersion()

	return mainQuest.buildNumber
endFunction

function resetId()

	playerStaminaDrainId = 0
	activateToSheathId = 0
	toggleMCTId = 0
	fCombatDistanceId = 0
	fCombatBashReachId = 0
	fWeaponTwoHandedAnimationSpeedMultId = 0
	fCombatStaminaRegenRateMultId = 0
	fSprintStaminaWeightMultId = 0
	staggerMagnitudeBaseId = 0
	bashStaminaMultId = 0
	swingStaminaBaseId = 0
	swingStaminaMultId = 0
	swingStaminaRecoverMultId = 0
	swingStaminaRecoverLagId = 0
	noStaminaRegenWhileRunningId = 0
	lesserPowerCombatFocusId = 0
	dailyPowerCombatFocusId = 0
	permanentCombatFocusId = 0
	powerAttackSlowTimeEnabledId = 0
	powerAttackEtherealizeEnabledId = 0
	powerAttackInjuryEnabledId = 0
	twohandAttackSweepsEnabledId = 0
	armorPenetrationsEnabledId = 0
	escapeStaminaBaseId = 0
	escapeStaminaMultId = 0
	forwardKeyId = 0
	backwardKeyId = 0
	leftKeyId = 0
	rightKeyId = 0
	sheatheKeyId = 0
	sneakKeyId = 0
endFunction

function OnOptionKeyMapChange(Int option, Int keyCode, String conflictControl, String conflictName)

	if option == sheatheKeyId
		MCT_KeySheathe.setValueInt(keyCode)
		sheathKeyListener.registerKeys()
		self.SetKeyMapOptionValue(sheatheKeyId, keyCode, false)
	elseIf option == sneakKeyId
		MCT_KeySneak.setValueInt(keyCode)
		sneakKeyListener.registerKeys()
		self.SetKeyMapOptionValue(sneakKeyId, keyCode, false)
	elseIf option == forwardKeyId
		forwardKeyListener.keyToListen = keyCode
		forwardKeyListener.registerKeys()
		self.SetKeyMapOptionValue(forwardKeyId, keyCode, false)
	elseIf option == backwardKeyId
		backKeyListener.keyToListen = keyCode
		backKeyListener.registerKeys()
		self.SetKeyMapOptionValue(backwardKeyId, keyCode, false)
	elseIf option == leftKeyId
		leftKeyListener.keyToListen = keyCode
		leftKeyListener.registerKeys()
		self.SetKeyMapOptionValue(leftKeyId, keyCode, false)
	elseIf option == rightKeyId
		rightKeyListener.keyToListen = keyCode
		rightKeyListener.registerKeys()
		self.SetKeyMapOptionValue(rightKeyId, keyCode, false)
	endIf
	self.ForcePageReset()
endFunction

function OnOptionSelect(Int option)

	actor playerRef = game.getPlayer()
	if option == playerStaminaDrainId
		if staminaQuest.isRunning()
			staminaQuest.stop()
			self.SetToggleOptionValue(playerStaminaDrainId, false, false)
		else
			staminaQuest.start()
		endIf
	elseIf option == activateToSheathId
		if sheathKeyListener.activateToSheathe
			sheathKeyListener.activateToSheathe = false
			sheathKeyListener.registerKeys()
		else
			sheathKeyListener.activateToSheathe = true
			sheathKeyListener.registerKeys()
		endIf
	elseIf option == toggleMCTId
		if mainQuest.isRunning()
			mainQuest.deactivate()
		else
			mainQuest.start()
		endIf
	elseIf option == powerAttackSlowTimeEnabledId
		if MCT_PowerAttackSlowTimeEnabled.getValueInt() == 1
			MCT_PowerAttackSlowTimeEnabled.setValueInt(0)
		else
			MCT_PowerAttackSlowTimeEnabled.setValueInt(1)
		endIf
	elseIf option == powerAttackEtherealizeEnabledId
		if MCT_PowerAttackEtherealizeEnabled.getValueInt() == 1
			MCT_PowerAttackEtherealizeEnabled.setValueInt(0)
		else
			MCT_PowerAttackEtherealizeEnabled.setValueInt(1)
		endIf
	elseIf option == powerAttackInjuryEnabledId
		if MCT_PowerAttackInuryEnabled.getValueInt() == 1
			MCT_PowerAttackInuryEnabled.setValueInt(0)
		else
			MCT_PowerAttackInuryEnabled.setValueInt(1)
		endIf
	elseIf option == twohandAttackSweepsEnabledId
		if playerRef.hasPerk(MCT_AttackSweepOnTwohand)
			playerRef.removePerk(MCT_AttackSweepOnTwohand)
		else
			playerRef.addPerk(MCT_AttackSweepOnTwohand)
		endIf
	elseIf option == armorPenetrationsEnabledId
		if playerRef.hasPerk(MCT_IncreasedDamageWithPenetratesArmor)
			playerRef.removePerk(MCT_IncreasedDamageFromPenetrationActor)
			playerRef.removePerk(MCT_IncreasedDamageFromPenetrationWeapon)
			playerRef.removePerk(MCT_IncreasedDamageWithPenetratesArmor)
		else
			playerRef.addPerk(MCT_IncreasedDamageFromPenetrationActor)
			playerRef.addPerk(MCT_IncreasedDamageFromPenetrationWeapon)
			playerRef.addPerk(MCT_IncreasedDamageWithPenetratesArmor)
		endIf
	elseIf option == noStaminaRegenWhileRunningId
		if playerRef.hasSpell(MCT_NoStaminaRegenWhileRunning as form)
			playerRef.removeSpell(MCT_NoStaminaRegenWhileRunning)
		else
			playerRef.addSpell(MCT_NoStaminaRegenWhileRunning, true)
		endIf
	elseIf option == lesserPowerCombatFocusId
		if playerRef.hasSpell(MCT_CombatFocusPowerLesser as form)
			playerRef.removeSpell(MCT_CombatFocusPowerLesser)
			playerRef.removeSpell(MCT_CombatFocusActivatedAbility)
		else
			playerRef.addSpell(MCT_CombatFocusPowerLesser, true)
			playerRef.removeSpell(MCT_CombatFocusActivatedAbility)
			playerRef.removeSpell(MCT_CombatFocusPower)
			playerRef.removeSpell(MCT_CombatFocusAbility)
		endIf
	elseIf option == dailyPowerCombatFocusId
		if playerRef.hasSpell(MCT_CombatFocusPower as form)
			playerRef.removeSpell(MCT_CombatFocusPower)
		else
			playerRef.removeSpell(MCT_CombatFocusPowerLesser)
			playerRef.removeSpell(MCT_CombatFocusActivatedAbility)
			playerRef.addSpell(MCT_CombatFocusPower, true)
			playerRef.removeSpell(MCT_CombatFocusAbility)
		endIf
	elseIf option == permanentCombatFocusId
		if playerRef.hasSpell(MCT_CombatFocusAbility as form)
			playerRef.removeSpell(MCT_CombatFocusAbility)
		else
			playerRef.removeSpell(MCT_CombatFocusPowerLesser)
			playerRef.removeSpell(MCT_CombatFocusActivatedAbility)
			playerRef.removeSpell(MCT_CombatFocusPower)
			playerRef.addSpell(MCT_CombatFocusAbility, true)
		endIf
	endIf
	self.ForcePageReset()
endFunction

function OnOptionMenuOpen(Int option)

	; Empty function
endFunction

function OnOptionHighlight(Int option)

	if option == fCombatDistanceId
		self.SetInfoText("Recommands 141, or if using Requiem 150")
	elseIf option == fCombatBashReachId
		self.SetInfoText("Recommands 100")
	elseIf option == fWeaponTwoHandedAnimationSpeedMultId
		self.SetInfoText("Recommands 2.0")
	elseIf option == fCombatStaminaRegenRateMultId
		self.SetInfoText("Recommands 1.0")
	elseIf option == fSprintStaminaWeightMultId
		self.SetInfoText("Recommands 0.05")
	elseIf option == swingStaminaBaseId
		self.SetInfoText("Effects how much stamina drained per swing")
	elseIf option == swingStaminaMultId
		self.SetInfoText("Effects how much stamina drained per weapon weight when swinging")
	elseIf option == swingStaminaRecoverMultId
		self.SetInfoText("Percentage of stamina recovered after recovery lag, 0.97 = 97% recovered")
	elseIf option == swingStaminaRecoverLagId
		self.SetInfoText("Time in seconds it takes for stamina to recover after attacking or blocking with weapon")
	elseIf option == playerStaminaDrainId
		self.SetInfoText("Please exit the menu for the change to take effect")
	elseIf option == toggleMCTId
		self.SetInfoText("Please exit the menu for the change to take effect")
	elseIf option == activateToSheathId
		self.SetInfoText("The activate key sheathes weapons if it is drawn")
	elseIf option == powerAttackSlowTimeEnabledId
		self.SetInfoText("Enables slow time effect with 2 hand directional power attacking")
	elseIf option == powerAttackEtherealizeEnabledId
		self.SetInfoText("Enables invincible time frame effect with 1 hand side and back power attacking")
	elseIf option == powerAttackInjuryEnabledId
		self.SetInfoText("Enables injury effect with 1 hand side power attacking")
	elseIf option == noStaminaRegenWhileRunningId
		self.SetInfoText("Disables stamina regen while in running mode")
	elseIf option == bashStaminaMultId
		self.SetInfoText("Bashing stamina cost proportional to shield weight multiply by this value")
	elseIf option == staggerMagnitudeBaseId
		self.SetInfoText("Modifies stagger duration on normal and power attack hits")
	elseIf option == escapeStaminaBaseId
		self.SetInfoText("Base amount of stamina to perform dodge")
	elseIf option == escapeStaminaMultId
		self.SetInfoText("Effects additional stamina cost base on body armor weight")
	elseIf option == forwardKeyId
		self.SetInfoText("Key mapped to forward movement")
	elseIf option == backwardKeyId
		self.SetInfoText("Key mapped to backward movement")
	elseIf option == leftKeyId
		self.SetInfoText("Key mapped to left movement")
	elseIf option == rightKeyId
		self.SetInfoText("Key mapped to right movement")
	elseIf option == sheatheKeyId
		self.SetInfoText("Key mapped to sheathe your weapon")
	elseIf option == sneakKeyId
		self.SetInfoText("Key mapped to toggle sneak mode")
	elseIf option == lesserPowerCombatFocusId
		self.SetInfoText("Make Combat Focus a toggleable lesser power")
	elseIf option == dailyPowerCombatFocusId
		self.SetInfoText("Make Combat Focus a daily power")
	elseIf option == permanentCombatFocusId
		self.SetInfoText("Make Combat Focus an always active ability")
	elseIf option == twohandAttackSweepsEnabledId
		self.SetInfoText("Twohand normal attacks will sweep when standing still")
	elseIf option == armorPenetrationsEnabledId
		self.SetInfoText("Battleaxes and Warhammers penetrate 50% armor")
	endIf
endFunction

function removeAllPerk(FormList perkList)

	actor player = game.getPlayer()
	Int iIndex = perkList.GetSize()
	while iIndex
		iIndex -= 1
		perk perkToRemove = perkList.getAt(iIndex) as perk
		player.removePerk(perkToRemove)
	endWhile
endFunction

function OnOptionMenuAccept(Int option, Int index)

	; Empty function
endFunction

function OnOptionSliderOpen(Int option)

	if option == staggerMagnitudeBaseId
		self.SetSliderDialogStartValue(MCT_StaggerMagnitudeBase.getValue())
		self.SetSliderDialogDefaultValue(0.000000)
		self.SetSliderDialogRange(-1.00000, 1.00000)
		self.SetSliderDialogInterval(0.0100000)
		return 
	endIf
	if option == swingStaminaBaseId
		self.SetSliderDialogStartValue(MCT_swingStaminaBase.getValue())
		self.SetSliderDialogDefaultValue(0.000000)
		self.SetSliderDialogRange(-30.0000, 30.0000)
		self.SetSliderDialogInterval(1 as Float)
		return 
	endIf
	if option == swingStaminaMultId
		self.SetSliderDialogStartValue(MCT_swingStaminaMult.getValue())
		self.SetSliderDialogDefaultValue(2.00000)
		self.SetSliderDialogRange(0.000000, 8.00000)
		self.SetSliderDialogInterval(0.100000)
		return 
	endIf
	if option == swingStaminaRecoverMultId
		self.SetSliderDialogStartValue(MCT_swingStaminaRecoverMult.getValue())
		self.SetSliderDialogDefaultValue(0.970000)
		self.SetSliderDialogRange(0.000000, 1.00000)
		self.SetSliderDialogInterval(0.0100000)
		return 
	endIf
	if option == swingStaminaRecoverLagId
		self.SetSliderDialogStartValue(MCT_swingStaminaRecoverLag.getValue())
		self.SetSliderDialogDefaultValue(3.50000)
		self.SetSliderDialogRange(1 as Float, 5 as Float)
		self.SetSliderDialogInterval(0.100000)
		return 
	endIf
	if option == bashStaminaMultId
		self.SetSliderDialogStartValue(MCT_BashStaminaMult.getValue())
		self.SetSliderDialogDefaultValue(1.00000)
		self.SetSliderDialogRange(0 as Float, 5 as Float)
		self.SetSliderDialogInterval(0.100000)
		return 
	endIf
	if option == escapeStaminaBaseId
		self.SetSliderDialogStartValue(escapeQuest.escapeStaminaBase)
		self.SetSliderDialogDefaultValue(5 as Float)
		self.SetSliderDialogRange(0 as Float, 25 as Float)
		self.SetSliderDialogInterval(1 as Float)
		return 
	endIf
	if option == escapeStaminaMultId
		self.SetSliderDialogStartValue(escapeQuest.escapeStaminaMult)
		self.SetSliderDialogDefaultValue(0.500000)
		self.SetSliderDialogRange(0 as Float, 3 as Float)
		self.SetSliderDialogInterval(0.100000)
		return 
	endIf
endFunction

function OnOptionDefault(Int option)

	if option == sheatheKeyId
		MCT_KeySheathe.setValueInt(19)
		sheathKeyListener.registerKeys()
		self.SetKeyMapOptionValue(sheatheKeyId, 19, false)
	elseIf option == sneakKeyId
		MCT_KeySneak.setValueInt(44)
		sneakKeyListener.registerKeys()
		self.SetKeyMapOptionValue(sneakKeyId, 44, false)
	elseIf option == forwardKeyId
		forwardKeyListener.keyToListen = 17
		forwardKeyListener.registerKeys()
		self.SetKeyMapOptionValue(forwardKeyId, 17, false)
	elseIf option == backwardKeyId
		backKeyListener.keyToListen = 31
		backKeyListener.registerKeys()
		self.SetKeyMapOptionValue(backwardKeyId, 31, false)
	elseIf option == leftKeyId
		leftKeyListener.keyToListen = 30
		leftKeyListener.registerKeys()
		self.SetKeyMapOptionValue(leftKeyId, 30, false)
	elseIf option == rightKeyId
		rightKeyListener.keyToListen = 32
		rightKeyListener.registerKeys()
		self.SetKeyMapOptionValue(rightKeyId, 32, false)
	endIf
	self.ForcePageReset()
endFunction
