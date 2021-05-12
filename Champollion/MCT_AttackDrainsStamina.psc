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

;-- Variables ---------------------------------------
Float swingDrain = 0.000000
Float totalDrain = 0.000000

;-- Functions ---------------------------------------

function OnRaceSwitchComplete()

	utility.wait(5 as Float)
	self.OnInit()
endFunction

function OnAnimationEvent(objectreference akSource, String asEventName)

	if asEventName == "weaponLeftSwing"
		self.swing(true)
	else
		self.swing(false)
	endIf
endFunction

function drainStamina(actor actorRef, Float drainAmount)

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
	self.GotoState("recover")
endFunction

function registerKeys()

	actor actorRef = self.GetActorReference()
	self.RegisterForAnimationEvent(actorRef as objectreference, "bowDrawStart")
	self.RegisterForAnimationEvent(actorRef as objectreference, "weaponSwing")
	self.RegisterForAnimationEvent(actorRef as objectreference, "weaponLeftSwing")
	self.RegisterForModEvent("MCT_drainStamina", "OnDrainStamina")
endFunction

function OnDrainStamina(String eventName, String strArg, Float numArg, Form sender)

	self.drainStamina(self.GetActorReference(), numArg)
endFunction

; Skipped compiler generated GotoState

function OnInit()

	debug.trace("MCT_AttackDrainsStamina OnInit", 0)
	self.registerKeys()
endFunction

function updateSwingDrain(actor actorRef, Bool leftHand)

	Float weaponWeight = 4 as Float
	weapon equippedWeapon = actorRef.GetEquippedWeapon(leftHand)
	if equippedWeapon != none
		weaponWeight = equippedWeapon.getWeight()
	endIf
	swingDrain += weaponWeight * MCT_swingStaminaMult.getValue() + MCT_swingStaminaBase.getValue()
endFunction

; Skipped compiler generated GetState

function swing(Bool leftHand)

	actor actorRef = self.GetActorReference()
	if swingDrain == 0.000000
		self.updateSwingDrain(actorRef, leftHand)
		self.drainStamina(actorRef, swingDrain)
		return 
	endIf
	self.drainStamina(actorRef, swingDrain)
	self.updateSwingDrain(actorRef, leftHand)
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
