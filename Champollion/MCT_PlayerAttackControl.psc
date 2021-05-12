;/ Decompiled by Champollion V1.0.1
Source   : MCT_PlayerAttackControl.psc
Modified : 2020-12-02 10:31:13
Compiled : 2020-12-02 10:31:15
User     : george
Computer : GAME-PC
/;
scriptName MCT_PlayerAttackControl extends ReferenceAlias

;-- Properties --------------------------------------
spell property MCT_DualWieldCombo1Spell auto
globalvariable property MCT_BashStaminaMult auto
spell property MCT_SprintAttackCoolDownSpell auto
actor property player auto
spell property MCT_BashPowerAttackingDaggerSpell auto
spell property MCT_PowerAttackCoolDownSpell auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnInit()

	debug.trace("MCT_PlayerAttackControl OnInit", 0)
	self.RegisterForAnimationEvent(player as objectreference, "HitFrame")
	self.RegisterForAnimationEvent(player as objectreference, "bashExit")
endFunction

function OnRaceSwitchComplete()

	utility.wait(5 as Float)
	self.OnInit()
endFunction

; Skipped compiler generated GetState

function OnAnimationEvent(objectreference akSource, String asEventName)

	if asEventName == "HitFrame"
		player.doCombatSpellApply(MCT_PowerAttackCoolDownSpell, player as objectreference)
	else
		Int leftHandItemType = player.GetEquippedItemType(0)
		Float weight = 7 as Float
		if leftHandItemType == 10
			armor shieldUsed = player.getEquippedShield()
			weight = shieldUsed.getWeight()
		else
			form equippedItem = player.GetEquippedObject(0)
			if equippedItem == none
				equippedItem = player.GetEquippedObject(1)
			endIf
			if equippedItem as weapon
				weight = equippedItem.getWeight()
			endIf
		endIf
		Float staminaUsed = weight * MCT_BashStaminaMult.getValue()
		player.DamageActorValue("Stamina", staminaUsed)
	endIf
endFunction

; Skipped compiler generated GotoState
