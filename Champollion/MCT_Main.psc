;/ Decompiled by Champollion V1.0.1
Source   : MCT_Main.psc
Modified : 2021-01-15 03:08:11
Compiled : 2021-01-15 03:08:13
User     : george
Computer : GAME-PC
/;
scriptName MCT_Main extends Quest

;-- Properties --------------------------------------
perk property MCT_ShieldSweepAttack auto
globalvariable property MCT_PlayerAttackControlEnabled auto
perk property MCT_IncreasedDamageFromPenetrationActor auto
globalvariable property MCT_CGOIntegrationEnabled auto
perk property MCT_ReduceDamageFromBlades auto
Quest property leftListenerQuest auto
keyword property MCT_StaggerImmune auto
Int property buildNumber auto
perk property MCT_CritMedOnStandingPowerAttack auto
perk property MCT_IncreasesDamageFromEnraged auto
spell property MCT_CombatFocusActivatedAbility auto
Quest property attackControllerQuest auto
perk property MCT_NoCritChanceOnImmune auto
Quest property attackDrainsStaminaQuest auto
perk property MCT_DamageDoublesOnTwoHandSidePowerAttack auto
perk property MCT_DamageDoublesOnDualPowerLastHit auto
Quest property rightListenerQuest auto
actor property player auto
spell property MCT_BaseWeaponSpeedMultSpell auto
Quest property sheathListenerQuest auto
Quest property powerAttackKeyListenerQuest auto
Quest property forwardListenerQuest auto
Quest property modifierKeyListenerQuest auto
Quest property backwardListenerQuest auto
globalvariable property MCT_StaggerByArrowEnabled auto
perk property MCT_CritLowOnStandingPowerAttack auto
Quest property cgoIntegration auto
perk property MCT_AttackSweepOnTwohand auto
globalvariable property MCT_AttackSpeedFixEnabled auto
Quest property sneakKeyListener auto
Quest property escapeListenerQuest auto
spell property MCT_MeleeActorMonitorAbility auto
perk property MCT_SpellPowerBlock auto
perk property MCT_CritHighOnStandingPowerAttack auto
perk property MCT_ReduceDamageWithBlades auto
perk property MCT_NoDamageToDodging auto
spell property MCT_DefaultRacePlayerSpell auto
globalvariable property MCT_PowerAttackControlEnabled auto
perk property MCT_IncreasedDamageWithPenetratesArmor auto
spell property MCT_CombatFocusPowerLesser auto
Quest property statCheckerQuest auto
spell property MCT_CombatFocusAbility auto
perk property MCT_SpellBlock auto
perk property MCT_IncreasedDamageFromPenetrationWeapon auto
perk property MCT_ReduceDamageOnFrontalArrows auto
spell property MCT_NoStaminaRegenWhileRunning auto
Quest property powerBlockKeyListener auto
spell property MCT_CombatFocusPower auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function playerLoadGame()

	utility.wait(2 as Float)
	if buildNumber != 63
		self.restart()
		buildNumber = 63
		return 
	endIf
	if MCT_AttackSpeedFixEnabled.getValueInt()
		player.addSpell(MCT_BaseWeaponSpeedMultSpell, true)
	else
		player.removeSpell(MCT_BaseWeaponSpeedMultSpell)
	endIf
	if MCT_PlayerAttackControlEnabled.getValueInt()
		player.addPerk(MCT_AttackSweepOnTwohand)
		player.addPerk(MCT_ReduceDamageFromBlades)
		player.addPerk(MCT_ReduceDamageWithBlades)
		player.addPerk(MCT_IncreasedDamageFromPenetrationActor)
		player.addPerk(MCT_IncreasedDamageFromPenetrationWeapon)
		player.addPerk(MCT_IncreasedDamageWithPenetratesArmor)
		player.addPerk(MCT_ReduceDamageOnFrontalArrows)
	else
		player.removePerk(MCT_AttackSweepOnTwohand)
		player.removePerk(MCT_ReduceDamageFromBlades)
		player.removePerk(MCT_ReduceDamageWithBlades)
		player.removePerk(MCT_IncreasedDamageFromPenetrationActor)
		player.removePerk(MCT_IncreasedDamageFromPenetrationWeapon)
		player.removePerk(MCT_IncreasedDamageWithPenetratesArmor)
		player.removePerk(MCT_ReduceDamageOnFrontalArrows)
	endIf
	if MCT_PowerAttackControlEnabled.getValueInt()
		if !powerAttackKeyListenerQuest.isRunning()
			powerAttackKeyListenerQuest.start()
		endIf
		player.addPerk(MCT_ShieldSweepAttack)
		player.addPerk(MCT_DamageDoublesOnTwoHandSidePowerAttack)
		player.addPerk(MCT_CritHighOnStandingPowerAttack)
		player.addPerk(MCT_CritLowOnStandingPowerAttack)
		player.addPerk(MCT_CritMedOnStandingPowerAttack)
		player.addPerk(MCT_NoCritChanceOnImmune)
	else
		if powerAttackKeyListenerQuest.isRunning()
			powerAttackKeyListenerQuest.stop()
		endIf
		player.removePerk(MCT_ShieldSweepAttack)
		player.removePerk(MCT_DamageDoublesOnTwoHandSidePowerAttack)
		player.removePerk(MCT_CritHighOnStandingPowerAttack)
		player.removePerk(MCT_CritLowOnStandingPowerAttack)
		player.removePerk(MCT_CritMedOnStandingPowerAttack)
		player.removePerk(MCT_NoCritChanceOnImmune)
	endIf
	if MCT_CGOIntegrationEnabled.getValueInt()
		if !cgoIntegration.isRunning()
			cgoIntegration.start()
		endIf
	elseIf cgoIntegration.isRunning()
		cgoIntegration.stop()
	endIf
endFunction

; Skipped compiler generated GetState

function stopQuests()

	statCheckerQuest.stop()
	attackControllerQuest.stop()
	powerAttackKeyListenerQuest.stop()
	attackDrainsStaminaQuest.stop()
	escapeListenerQuest.stop()
	sneakKeyListener.stop()
	powerBlockKeyListener.stop()
	cgoIntegration.stop()
	sheathListenerQuest.stop()
	modifierKeyListenerQuest.stop()
	forwardListenerQuest.stop()
	backwardListenerQuest.stop()
	rightListenerQuest.stop()
	leftListenerQuest.stop()
	utility.wait(2 as Float)
endFunction

function deactivate()

	self.removeFromPlayer()
	self.stopQuests()
	self.stop()
	utility.wait(2 as Float)
	debug.notification("Engarde Deactivated...")
endFunction

function restart()

	debug.trace("MCT_Main restarting", 0)
	debug.notification("Engarde Restarting...")
	self.deactivate()
	utility.wait(2 as Float)
	self.start()
	utility.wait(2 as Float)
	debug.messageBox("Engarde restarted...")
endFunction

; Skipped compiler generated GotoState

function OnInit()

	debug.trace("MCT_Main OnInit", 0)
	debug.notification("Engarde Starting...")
	utility.wait(1 as Float)
	self.removeFromPlayer()
	self.stopQuests()
	utility.wait(1 as Float)
	if MCT_AttackSpeedFixEnabled.getValueInt()
		player.addSpell(MCT_BaseWeaponSpeedMultSpell, false)
	endIf
	if MCT_PlayerAttackControlEnabled.getValueInt()
		player.addPerk(MCT_AttackSweepOnTwohand)
		player.addPerk(MCT_ReduceDamageFromBlades)
		player.addPerk(MCT_ReduceDamageWithBlades)
		player.addPerk(MCT_IncreasedDamageFromPenetrationActor)
		player.addPerk(MCT_IncreasedDamageFromPenetrationWeapon)
		player.addPerk(MCT_IncreasedDamageWithPenetratesArmor)
		player.addPerk(MCT_ReduceDamageOnFrontalArrows)
	endIf
	if MCT_PowerAttackControlEnabled.getValueInt()
		player.addPerk(MCT_ShieldSweepAttack)
		player.addPerk(MCT_DamageDoublesOnTwoHandSidePowerAttack)
		player.addPerk(MCT_CritHighOnStandingPowerAttack)
		player.addPerk(MCT_CritLowOnStandingPowerAttack)
		player.addPerk(MCT_CritMedOnStandingPowerAttack)
	endIf
	player.addPerk(MCT_NoCritChanceOnImmune)
	player.addPerk(MCT_NoDamageToDodging)
	player.addPerk(MCT_IncreasesDamageFromEnraged)
	player.addPerk(MCT_SpellBlock)
	player.addPerk(MCT_SpellPowerBlock)
	player.addSpell(MCT_DefaultRacePlayerSpell, false)
	player.addSpell(MCT_NoStaminaRegenWhileRunning, false)
	player.addSpell(MCT_CombatFocusPowerLesser, false)
	player.addSpell(MCT_MeleeActorMonitorAbility, false)
	utility.wait(1 as Float)
	if MCT_PowerAttackControlEnabled.getValueInt()
		powerAttackKeyListenerQuest.start()
	endIf
	attackControllerQuest.start()
	statCheckerQuest.start()
	escapeListenerQuest.start()
	attackDrainsStaminaQuest.start()
	sneakKeyListener.start()
	powerBlockKeyListener.start()
	if MCT_CGOIntegrationEnabled.getValueInt()
		cgoIntegration.start()
	endIf
	sheathListenerQuest.start()
	modifierKeyListenerQuest.start()
	forwardListenerQuest.start()
	backwardListenerQuest.start()
	rightListenerQuest.start()
	leftListenerQuest.start()
	debug.notification("Engarde Started...")
	buildNumber = 63
endFunction

function removeFromPlayer()

	player.removePerk(MCT_AttackSweepOnTwohand)
	player.removePerk(MCT_ShieldSweepAttack)
	player.removePerk(MCT_ReduceDamageFromBlades)
	player.removePerk(MCT_ReduceDamageWithBlades)
	player.removePerk(MCT_IncreasedDamageFromPenetrationActor)
	player.removePerk(MCT_IncreasedDamageFromPenetrationWeapon)
	player.removePerk(MCT_IncreasedDamageWithPenetratesArmor)
	player.removePerk(MCT_ReduceDamageOnFrontalArrows)
	player.removePerk(MCT_DamageDoublesOnTwoHandSidePowerAttack)
	player.removePerk(MCT_CritHighOnStandingPowerAttack)
	player.removePerk(MCT_CritLowOnStandingPowerAttack)
	player.removePerk(MCT_CritMedOnStandingPowerAttack)
	player.removePerk(MCT_NoCritChanceOnImmune)
	player.removePerk(MCT_NoDamageToDodging)
	player.removePerk(MCT_IncreasesDamageFromEnraged)
	player.removePerk(MCT_SpellBlock)
	player.removePerk(MCT_SpellPowerBlock)
	player.removeSpell(MCT_BaseWeaponSpeedMultSpell)
	player.removeSpell(MCT_DefaultRacePlayerSpell)
	player.removeSpell(MCT_NoStaminaRegenWhileRunning)
	player.removeSpell(MCT_CombatFocusPowerLesser)
	player.removeSpell(MCT_CombatFocusActivatedAbility)
	player.removeSpell(MCT_CombatFocusPower)
	player.removeSpell(MCT_CombatFocusAbility)
	player.removeSpell(MCT_MeleeActorMonitorAbility)
	utility.wait(2 as Float)
endFunction
