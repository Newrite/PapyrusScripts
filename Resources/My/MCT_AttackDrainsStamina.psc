;/ Decompiled by Champollion V1.0.1
Source   : MCT_AttackDrainsStamina.psc
Modified : 2020-06-20 22:48:40
Compiled : 2020-06-20 22:48:41
User     : george
Computer : GAME-PC
/;
scriptName MCT_AttackDrainsStamina extends ReferenceAlias

;-- Properties --------------------------------------
globalvariable property MCT_swingStaminaBase auto
globalvariable property MCT_swingStaminaRecoverLag auto
globalvariable property MCT_swingStaminaMult auto
globalvariable property MCT_swingStaminaRecoverMult auto
keyword property boundWeapon auto
keyword property healthDrainWeapon auto
keyword property WeapTypeBoundArrow auto

;-- Variables ---------------------------------------
Float swingDrain = 0.000000
Float totalDrain = 0.000000
Float drainone = 10.000000
Float draintwo = 15.000000

;-- Functions ---------------------------------------

function OnRaceSwitchComplete()

	utility.wait(5 as Float)
	self.OnInit()
endFunction

function OnAnimationEvent(objectreference akSource, String asEventName)
	;debug.Notification("event: "+asEventName)
	if asEventName == "weaponLeftSwing"
		self.swing(true, asEventName)
	else
		self.swing(false, asEventName)
	endIf
endFunction

function drainMagicka(actor actorRef, int weaponType, String asEventName)
	;debug.Notification("тип: "+weaponType)
	if (weaponType >= 0) && (weaponType <= 4)
		actorRef.damageActorValue("Magicka", drainone)
		return
	endIf
	if ((asEventName == "bowDrawStart") || (asEventName == "reload") || (asEventName == "ReloadFast")) && actorRef.WornHasKeyword(WeapTypeBoundArrow)
		actorRef.damageActorValue("Magicka", draintwo+drainone)
		return
	endIf
	actorRef.damageActorValue("Magicka", draintwo)
endFunction

function drainHealth(actor actorRef, float toDrain, String asEventName)
	if toDrain <= 0.0
		return
	endif
	actorRef.damageActorValue("Health", toDrain)
	if ((asEventName == "bowDrawStart") || (asEventName == "reload") || (asEventName == "ReloadFast")) && actorRef.WornHasKeyword(WeapTypeBoundArrow)
		actorRef.damageActorValue("Magicka", drainone)
	endif
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
	if ((asEventName == "bowDrawStart") || (asEventName == "reload") || (asEventName == "ReloadFast")) && actorRef.WornHasKeyword(WeapTypeBoundArrow)
		actorRef.damageActorValue("Magicka", drainone)
	endif
	self.GotoState("recover")
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

function OnDrainStamina(String eventName, String strArg, Float numArg, Form sender)

	self.drainStamina(self.GetActorReference(), numArg, eventName)
endFunction

; Skipped compiler generated GotoState

function OnInit()

	;debug.trace("MCT_AttackDrainsStamina OnInit", 0)
	self.registerKeys()
endFunction

function updateSwingDrain(actor actorRef, Bool leftHand, weapon equippedWeapon)
	
	Float weaponWeight = 4 as Float
	if equippedWeapon != none
		weaponWeight = equippedWeapon.getWeight()
	endIf
	swingDrain += weaponWeight * MCT_swingStaminaMult.getValue() + MCT_swingStaminaBase.getValue()
	
endFunction

; Skipped compiler generated GetState

function swing(Bool leftHand, String asEventName)

	actor actorRef = self.GetActorReference()
	weapon equippedWeapon = actorRef.GetEquippedWeapon(leftHand)
	if equippedWeapon.HasKeyword(boundWeapon)
		drainMagicka(actorRef, equippedWeapon.GetWeaponType() as int, asEventName)
		return
	endif
	if equippedWeapon.HasKeyword(healthDrainWeapon)
		drainHealth(actorRef, equippedWeapon.getWeight() as Float / 2.0, asEventName)
		return
	endif
	if swingDrain == 0.000000
		self.updateSwingDrain(actorRef, leftHand, equippedWeapon)
		self.drainStamina(actorRef, swingDrain, asEventName)
		return 
	endIf
	self.drainStamina(actorRef, swingDrain, asEventName)
	self.updateSwingDrain(actorRef, leftHand, equippedWeapon)
endFunction

function OnPlayerLoadGame()

	self.RegisterForModEvent("MCT_drainStamina", "OnDrainStamina")
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
