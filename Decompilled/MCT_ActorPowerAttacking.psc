;/ Decompiled by Champollion V1.0.1
Source   : MCT_ActorPowerAttacking.psc
Modified : 2020-12-22 10:07:18
Compiled : 2020-12-22 10:07:19
User     : george
Computer : GAME-PC
/;
scriptName MCT_ActorPowerAttacking extends activemagiceffect

;-- Properties --------------------------------------
perk property MCT_PowerAttackedSlowTimePerk auto
actor property player auto
spell property MCT_PowerAttackedSlow01TimeSpell auto
mct_statcheckerquest property statChecker auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnEffectStart(actor akTarget, actor akCaster)

	player.addPerk(MCT_PowerAttackedSlowTimePerk)
	player.DoCombatSpellApply(MCT_PowerAttackedSlow01TimeSpell, player as objectreference)
	statChecker.powerAttacker = akTarget
	statChecker.resetAttacker()
	utility.wait(0.700000)
	player.removePerk(MCT_PowerAttackedSlowTimePerk)
	player.DispelSpell(MCT_PowerAttackedSlow01TimeSpell)
endFunction

; Skipped compiler generated GetState
