;/ Decompiled by Champollion V1.0.1
Source   : FFAOBGoldbrandScript.psc
Modified : 2018-02-24 07:59:47
Compiled : 2018-02-24 07:59:48
User     : borja
Computer : DESKTOP-BORJA
/;
scriptName FFAOBGoldbrandScript extends ActiveMagicEffect

;-- Properties --------------------------------------
Float property ChargeCost = 30.0000 auto
actor property selfref auto hidden
spell property MySpell auto
keyword property ValidWeapons auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnEffectStart(actor akTarget, actor akCaster)

	selfref = akCaster
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerStanding_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerRight_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerLeft_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerBackward_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerForward_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "WeaponSwing")
	self.registerForAnimationEvent(akCaster as objectreference, "WeaponLeftSwing")
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnAnimationEvent(objectreference akSource, String EventName)

	Bool PowerAttack = selfref.GetAnimationVariableBool("bAllowRotation")
	if EventName == "AttackPowerStanding_FXStart" || EventName == "AttackPowerForward_FXStart" && selfref.IsSprinting() || EventName == "AttackPowerRight_FXStart" || EventName == "AttackPowerLeft_FXStart" || EventName == "AttackPowerBackward_FXStart"
		MySpell.Cast(selfref as objectreference, none)
		selfref.DamageActorValue("RightItemCharge", ChargeCost)
	elseIf EventName == "WeaponSwing" && selfref.GetEquippedWeapon(false).HasKeyword(ValidWeapons) && PowerAttack
		MySpell.Cast(selfref as objectreference, none)
		selfref.DamageActorValue("RightItemCharge", ChargeCost)
	elseIf EventName == "WeaponLeftSwing" && selfref.GetEquippedWeapon(true).HasKeyword(ValidWeapons) && PowerAttack
		MySpell.Cast(selfref as objectreference, none)
		selfref.DamageActorValue("LeftItemCharge", ChargeCost)
	endIf
endFunction
