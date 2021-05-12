;/ Decompiled by Champollion V1.0.1
Source   : MCT_SheathKeyListener.psc
Modified : 2021-01-15 02:35:53
Compiled : 2021-01-15 02:35:54
User     : george
Computer : GAME-PC
/;
scriptName MCT_SheathKeyListener extends Quest

;-- Properties --------------------------------------
Bool property activateToSheathe auto
actor property player auto
globalvariable property MCT_KeySheathe auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnKeyDown(Int key)

	if utility.IsInMenuMode()
		return 
	endIf
	if player.IsWeaponDrawn()
		debug.sendAnimationEvent(player as objectreference, "Unequip")
	else
		player.DrawWeapon()
	endIf
endFunction

function OnInit()

	debug.trace("MCT_SheathKeyListener OnInit", 0)
	self.registerKeys()
endFunction

function registerKeys()

	self.UnregisterForAllControls()
	self.UnregisterForAllKeys()
	if activateToSheathe
		self.RegisterForControl("Activate")
	else
		self.RegisterForKey(MCT_KeySheathe.getValueInt())
	endIf
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnControlDown(String control)

	utility.waitMenuMode(0.100000)
	if utility.IsInMenuMode()
		return 
	endIf
	debug.sendAnimationEvent(player as objectreference, "Unequip")
endFunction
