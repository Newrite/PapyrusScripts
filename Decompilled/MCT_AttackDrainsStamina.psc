;/ Decompiled by Champollion V1.0.1
Source   : MCT_AttackDrainsStamina.psc
Modified : 2021-02-19 11:18:31
Compiled : 2021-02-19 11:18:48
User     : newrite
Computer : WINDOWS
/;
scriptName MCT_AttackDrainsStamina extends ReferenceAlias

;-- Properties --------------------------------------
globalvariable property MCT_swingStaminaBase auto
keyword property healthDrainWeapon auto
keyword property WeapTypeBoundArrow auto
keyword property boundWeapon auto
globalvariable property MCT_swingStaminaRecoverMult auto
globalvariable property MCT_swingStaminaRecoverLag auto
globalvariable property MCT_swingStaminaMult auto

;-- Variables ---------------------------------------
Float totalDrain = 0.000000
Float draintwo = 15.0000
Float drainone = 10.0000
Float swingDrain = 0.000000

;-- Functions ---------------------------------------

function OnInit()

	self.registerKeys()
endFunction

function OnPlayerLoadGame()

	self.RegisterForModEvent("MCT_drainStamina", "OnDrainStamina")
endFunction

; Skipped compiler generated GotoState

function swing(Bool leftHand, String asEventName)

	actor actorRef = self.GetActorReference()
	weapon equippedWeapon = actorRef.GetEquippedWeapon(leftHand)
	if equippedWeapon.HasKeyword(boundWeapon)
		self.drainMagicka(actorRef, equippedWeapon.GetWeaponType(), asEventName)
		return 
	endIf
	if equippedWeapon.HasKeyword(healthDrainWeapon)
		self.drainHealth(actorRef, equippedWeapon.getWeight() / 2.00000, asEventName)
		return 
	endIf
	if swingDrain == 0.000000
		self.updateSwingDrain(actorRef, leftHand, equippedWeapon)
		self.drainStamina(actorRef, swingDrain, asEventName)
		return 
	endIf
	self.drainStamina(actorRef, swingDrain, asEventName)
	self.updateSwingDrain(actorRef, leftHand, equippedWeapon)
endFunction

function drainStamina(actor actorRef, Float drainAmount, String asEventName)

	if drainAmount < 0.000000
		return 
	endIf
	Float currentStamina = actorRef.getActorValue("Stamina")
	if drainAmount > currentStamina
		totalDrain += currentStamina
		actorRef.damageActorValue("Stamina", currentStamina)
	else
		totalDrain += drainAmount
		actorRef.damageActorValue("Stamina", drainAmount)
	endIf
	if (asEventName == "bowDrawStart" || asEventName == "reload" || asEventName == "ReloadFast") && actorRef.WornHasKeyword(WeapTypeBoundArrow)
		actorRef.damageActorValue("Magicka", drainone)
	endIf
	self.GotoState("recover")
endFunction

function OnRaceSwitchComplete()

	utility.wait(5 as Float)
	self.OnInit()
endFunction

function updateSwingDrain(actor actorRef, Bool leftHand, weapon equippedWeapon)

	Float weaponWeight = 4 as Float
	if equippedWeapon != none
		weaponWeight = equippedWeapon.getWeight()
	endIf
	swingDrain += weaponWeight * MCT_swingStaminaMult.getValue() + MCT_swingStaminaBase.getValue()
endFunction

function registerKeys()

	actor actorRef = self.GetActorReference()
	self.RegisterForAnimationEvent(actorRef as objectreference, "bowDrawStart")
	self.RegisterForAnimationEvent(actorRef as objectreference, "weaponSwing")
	self.RegisterForAnimationEvent(actorRef as objectreference, "weaponLeftSwing")
	self.RegisterForAnimationEvent(actorRef as objectreference, "reload")
	self.RegisterForAnimationEvent(actorRef as objectreference, "ReloadFast")
	self.RegisterForModEvent("MCT_drainStamina", "OnDrainStamina")
endFunction

function drainMagicka(actor actorRef, Int weaponType, String asEventName)

	if weaponType >= 0 && weaponType <= 4
		actorRef.damageActorValue("Magicka", drainone)
		return 
	endIf
	if (asEventName == "bowDrawStart" || asEventName == "reload" || asEventName == "ReloadFast") && actorRef.WornHasKeyword(WeapTypeBoundArrow)
		actorRef.damageActorValue("Magicka", draintwo + drainone)
		return 
	endIf
	actorRef.damageActorValue("Magicka", draintwo)
endFunction

; Skipped compiler generated GetState

function OnDrainStamina(String eventName, String strArg, Float numArg, Form sender)

	self.drainStamina(self.GetActorReference(), numArg, eventName)
endFunction

function OnAnimationEvent(objectreference akSource, String asEventName)

	if asEventName == "weaponLeftSwing"
		self.swing(true, asEventName)
	else
		self.swing(false, asEventName)
	endIf
endFunction

function drainHealth(actor actorRef, Float toDrain, String asEventName)

	if toDrain <= 0.000000
		return 
	endIf
	actorRef.damageActorValue("Health", toDrain)
	if (asEventName == "bowDrawStart" || asEventName == "reload" || asEventName == "ReloadFast") && actorRef.WornHasKeyword(WeapTypeBoundArrow)
		actorRef.damageActorValue("Magicka", drainone)
	endIf
endFunction

;-- State -------------------------------------------
state recover

	function OnUpdate()

		actor actorRef = self.GetActorReference()
		if actorRef.GetAnimationVariableBool("IsAttacking")
			self.registerForSingleUpdate(MCT_swingStaminaRecoverLag.getValue())
		else
			self.GetActorReference().restoreActorValue("Stamina", totalDrain * MCT_swingStaminaRecoverMult.getValue())
			swingDrain = 0.000000
			totalDrain = 0.000000
			self.GotoState("")
		endIf
	endFunction

	function onBeginState()

		self.registerForSingleUpdate(MCT_swingStaminaRecoverLag.getValue())
	endFunction
endState
