;/ Decompiled by Champollion V1.0.1
Source   : MCT_PowerAttackEventListener.psc
Modified : 2021-01-03 23:13:30
Compiled : 2021-01-03 23:13:32
User     : george
Computer : GAME-PC
/;
scriptName MCT_PowerAttackEventListener extends ReferenceAlias

;-- Properties --------------------------------------
actor property player auto
idle property MCTPowerAttackRightHandSprint1hm auto
spell property MCT_DodgingSpell auto
idle property MCTPowerAttackRightHandSprint2hw auto
spell property MCT_PowerAttackingSpell auto
idle property MCTPowerBash auto
idle property MCTPowerAttackRightHandSprint2hm auto
spell property MCT_DodgingHorizontalSpell auto
idle property MCTPowerAttackLeftHandSprint auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnInit()

	debug.trace("MCT_PowerAttackEventListener OnInit", 0)
	self.RegisterForAnimationEvent(player as objectreference, "PowerAttack_Start_end")
	self.RegisterForAnimationEvent(player as objectreference, "CastOKStop")
	self.RegisterForAnimationEvent(player as objectreference, "SoundPlay.NPCHumanCombatShieldBashPower")
	self.RegisterForControl("Ready Weapon")
endFunction

function OnControlUp(String control, Float HoldTime)

	player.playIdle(MCTPowerAttackRightHandSprint1hm)
	player.playIdle(MCTPowerAttackLeftHandSprint)
	player.playIdle(MCTPowerAttackRightHandSprint2hm)
	player.playIdle(MCTPowerAttackRightHandSprint2hw)
endFunction

; Skipped compiler generated GetState

function OnAnimationEvent(objectreference akSource, String asEventName)

	player.DispelSpell(MCT_DodgingSpell)
	player.DispelSpell(MCT_DodgingHorizontalSpell)
	player.doCombatSpellApply(MCT_PowerAttackingSpell, player as objectreference)
endFunction

function OnRaceSwitchComplete()

	utility.wait(5.00000)
	self.OnInit()
endFunction

function OnControlDown(String control)

	player.playIdle(MCTPowerBash)
endFunction

; Skipped compiler generated GotoState
