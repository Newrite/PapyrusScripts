scriptName DLC1PlayerVampireChangeScript extends Quest

spell property VampireDrain01 auto
Quest property VampireTrackingQuest auto
faction property PlayerVampireFaction auto
spell property DLC1VampireRaiseDeadLeftHand03 auto
spell property DLC1PlayerVampireLvl10AndBelowAbility auto
spell property DLC1SupernaturalReflexes auto
perk property DLC1UnearthlyWill auto
globalvariable property GameDaysPassed auto
globalvariable property DLC1BloodMagic auto
globalvariable property DLC1VampireTotalPerksEarned auto
spell property VampireSunDamage04 auto
spell property VampireCharm auto
String property BiteStart = "BiteStart" auto
spell property LeveledRaiseDeadSpell auto
spell property VampireDrain02 auto
globalvariable property DLC1VampireMaxPerks auto
effectshader property DLC1VampireChangeBack02FXS auto
Float property UnearthlyWillExtensionTimeSeconds auto
{How long (in real seconds) that feeding extends vampire time}
Bool property Untimed auto
spell property DLC1PlayerVampireLvl20AndBelowAbility auto
spell property DLC1NightCloak auto
perk property DLC1VampireBite auto
Quest property DialogueGenericVampire auto
spell property DLC1CorpseCurse auto
Bool property DLC1HasLightfoot auto
spell property AbVampire04 auto
spell property VampireSunDamage01 auto
armor property beastRing auto
faction property HunterFaction auto
Float property StandardDurationSeconds auto
{How long (in real seconds) the transformation lasts}
armor property gargNecklace auto
perk property DLC1NightCloakPerk auto
spell property DLC1AbVampireFloatBodyFX auto
{Spell FX Art holder for Levitation Glow.}
message property DLC1VampirePerkEarned auto
magiceffect property DLC1RevertEffect auto
spell property DLC1VampireRaiseDeadLeftHand02 auto
globalvariable property DCL1VampireLevitateStateGlobal auto
{This Global tracks what state the Vampire Lord is in: 0 = Not a Vampire Lord,  1 = Walking, 2 = Levitating}
String property LandStart = "LandStart" auto
String property TransformToHuman = "TransformToHuman" auto
playervampirequestscript property PlayerVampireQuest auto
spell property VampireRaiseThrall03 auto
spell property CurrentEquippedLeftSpell auto
perk property DLC1VampiricGrip auto
spell property VampireHuntersSight auto
spell property DLC1ConjureGargoyleLeftHand auto
perk property DLC1CorpseCursePerk auto
perk property DLC1SupernaturalReflexesPerk auto
sound property NPCVampireTransformation auto
globalvariable property DLC1VampirePerkPoints auto
spell property DLC1PlayerVampireLvl50AndOverAbility auto
perk property DLC1MistFormPerk auto
globalvariable property pDLC1nVampireNecklaceGargoyle auto
perk property DLC1DetectLifePerk auto
imagespacemodifier property VampireWarn auto
spell property DLC1VampireChange auto
spell property DLC1VampireLordSunDamage auto
armor property DLC1VampireLordArmor auto
armor property batNecklace auto
sound property VampireIMODSound auto
spell property DLC1VampireBats auto
spell property DLC1VampireDrain09 auto
effectshader property DLC1VampireChangeBackFXS auto
perk property DLC1GargoylePerk auto
spell property DLC1VampireDrain08 auto
spell property DLC1Revert auto
spell property LeveledDrainSpell auto
spell property VampireRaiseThrall01 auto
globalvariable property DLC1NightPower auto
spell property VampireDrain04 auto
spell property DLC1VampireDrain06 auto
spell property DLC1VampireMistform auto
idle property SpecialFeeding auto
spell property VampireDrain03 auto
Float property DurationWarningTimeSeconds auto
{How long (in real seconds) before turning back we should warn the player}
globalvariable property pDLC1nVampireRingBeast auto
spell property VampireSunDamage03 auto
globalvariable property VampireFeedReady auto
spell property VampireSunDamage02 auto
armor property eruditeRing auto
formlist property VampireDispelList auto
faction property DLC1PlayerVampireLordFaction auto
spell property DLC1PlayerVampireLvl45AndBelowAbility auto
spell property AbVampire04b auto
spell property AbVampire03b auto
spell property AbVampire02b auto
formlist property CrimeFactions auto
imagespacemodifier property VampireChange auto
spell property AbVampire01b auto
message property PlayerVampireFeedMessage auto
spell property AbVampire03 auto
spell property AbVampire02 auto
spell property AbVampire01 auto
spell property LeveledAbility auto
Float property DLC1BiteHealthRecover auto
perk property DLC1VampireActivationBlocker auto
spell property DLC1PlayerVampireLvl15AndBelowAbility auto
message property DLC1BloodPointsMsg auto
spell property DLC1VampireDetectLife auto
globalvariable property DLC1VampireNextPerk auto
spell property DLC1VampireDrain07 auto
globalvariable property DLC1VampireBloodPoints auto
spell property VampireRaiseThrall02 auto
globalvariable property PlayerVampireShiftBackTime auto
spell property DLC1VampireRaiseDeadLeftHand01 auto
spell property VampireRaiseThrall04 auto
visualeffect property FeedBloodVFX auto
{Visual Effect on Wolf for Feeding Blood}
perk property LightFoot auto
globalvariable property TimeScale auto
spell property FeedBoost auto
spell property DLC1VampireRaiseDeadLeftHand04 auto
spell property DLC1PlayerVampireLvl25AndBelowAbility auto
race property VampireLordRace auto
spell property DLC1VampireDrain05 auto
String property LiftoffStart = "LiftoffStart" auto
String property Levitate = "LevitateStart" auto
globalvariable property pDLC1nVampireRingErudite auto
spell property DLC1VampireRaiseDeadLeftHand05 auto
spell property DLC1PlayerVampireLvl35AndBelowAbility auto
String property Ground = "GroundStart" auto
spell property DLC1PlayerVampireLvl30AndBelowAbility auto
spell property DLC1VampiresGrip auto
globalvariable property pDLC1nVampireNecklaceBats auto
spell property BleedingFXSpell auto
{This Spell is for making the target of feeding bleed.}
spell property DLC1PlayerVampireLvl40AndBelowAbility auto
message property PlayerVampireExpirationWarning auto

Bool __tryingToShiftBack = false
Bool __trackingStarted = false
Bool __shiftingBack = false
Bool __prepped = false
Bool __shuttingDown = false
Float __durationWarningTime = -1.00000
Float __UnearthlyWillExtensionTime = -1.00000

function StartTracking()

	actor PlayerActor = game.GetPlayer()
	if __trackingStarted
		return 
	endIf
	__trackingStarted = true
	if game.GetPlayer().isEquipped(beastRing as form)
		pDLC1nVampireRingBeast.setValue(1 as Float)
	endIf
	if game.GetPlayer().isEquipped(eruditeRing as form)
		pDLC1nVampireRingErudite.setValue(1 as Float)
	endIf
	if game.GetPlayer().isEquipped(batNecklace as form)
		pDLC1nVampireNecklaceBats.setValue(1 as Float)
	endIf
	if game.GetPlayer().isEquipped(gargNecklace as form)
		pDLC1nVampireNecklaceGargoyle.setValue(1 as Float)
	endIf
	self.RegisterForEvents()
	DCL1VampireLevitateStateGlobal.setValue(1 as Float)
	debug.Trace("VAMPIRE: Race swap done; starting tracking and effects.", 0)
	PlayerActor.UnequipAll()
	PlayerActor.EquipItem(DLC1VampireLordArmor as form, false, true)
	PlayerActor.SetAttackActorOnSight(true)
	game.SendWereWolfTransformation()
	PlayerActor.AddToFaction(PlayerVampireFaction)
	Int cfIndex = 0
	while cfIndex < CrimeFactions.GetSize()
		debug.Trace("VAMPIRE: Setting enemy flag on " + CrimeFactions.GetAt(cfIndex) as String, 0)
		(CrimeFactions.GetAt(cfIndex) as faction).SetPlayerEnemy(true)
		cfIndex += 1
	endWhile
	HunterFaction.SetPlayerEnemy(true)
	game.SetPlayerReportCrime(false)
	__durationWarningTime = self.RealTimeSecondsToGameTimeDays(DurationWarningTimeSeconds)
	__UnearthlyWillExtensionTime = self.RealTimeSecondsToGameTimeDays(UnearthlyWillExtensionTimeSeconds)
	PlayerActor.RemoveSpell(VampireSunDamage01)
	PlayerActor.RemoveSpell(VampireSunDamage02)
	PlayerActor.RemoveSpell(VampireSunDamage03)
;	PlayerActor.RemoveSpell(VampireSunDamage04)
	PlayerActor.AddSpell(DLC1VampireLordSunDamage, false)
	PlayerActor.AddSpell(LeveledAbility, false)
	PlayerActor.AddSpell(VampireHuntersSight, false)
	PlayerActor.AddSpell(DLC1Revert, false)
	PlayerActor.AddSpell(DLC1VampireBats, false)
	PlayerActor.EquipSpell((DialogueGenericVampire as vampirequestscript).LastPower, 2)
	self.CheckPerkSpells()
	if PlayerActor.HasPerk(LightFoot) == true
		DLC1HasLightfoot = true
	else
		DLC1HasLightfoot = false
		PlayerActor.AddPerk(LightFoot)
	endIf
	Float currentTime = GameDaysPassed.GetValue()
	Float regressTime = currentTime + self.RealTimeSecondsToGameTimeDays(StandardDurationSeconds)
	if PlayerActor.HasPerk(DLC1UnearthlyWill)
		regressTime += __UnearthlyWillExtensionTime
	endIf
	PlayerVampireShiftBackTime.setValue(regressTime)
	debug.Trace("VAMPIRE: Current day -- " + currentTime as String, 0)
	debug.Trace("VAMPIRE: Player will turn back at day " + regressTime as String, 0)
	PlayerActor.DispelSpell(DLC1VampireChange)
	self.RegisterForUpdate(3 as Float)
	self.SetStage(10)
endFunction

function SetUntimed(Bool untimedValue)

	Untimed = untimedValue
	if Untimed
		self.UnregisterForUpdate()
	endIf
endFunction

; Skipped compiler generated GotoState

function UnloadSpells()

	LeveledDrainSpell.Unload()
	LeveledRaiseDeadSpell.Unload()
	DLC1VampiresGrip.Unload()
	DLC1ConjureGargoyleLeftHand.Unload()
	DLC1CorpseCurse.Unload()
endFunction

function PrepShift()

	actor PlayerActor = game.GetPlayer()
	debug.Trace("VAMPIRE: Prepping shift...", 0)
	VampireChange.Apply(1.00000)
	VampireIMODSound.Play(PlayerActor as objectreference)
	game.SetInCharGen(true, true, false)
	PlayerActor.AddPerk(DLC1VampireActivationBlocker)
	game.SetBeastForm(true)
	game.EnableFastTravel(false)
	PlayerActor.SetActorValue("GrabActorOffset", 70 as Float)
	Int count = 0
	while count < VampireDispelList.GetSize()
		spell gone = VampireDispelList.GetAt(count) as spell
		if gone != none
			PlayerActor.DispelSpell(gone)
		endIf
		count += 1
	endWhile
	game.DisablePlayerControls(false, false, true, false, false, false, false, false, 1)
	game.ForceThirdPerson()
	game.ShowFirstPersonGeometry(false)
	self.EstablishLeveledSpells()
	self.PreloadSpells()
	__prepped = true
endFunction

function Revert()

	debug.Trace("VAMPIRE: Perks stat = " + game.QueryStat("NumVampirePerks") as String, 0)
	if game.QueryStat("NumVampirePerks") as Float >= DLC1VampireMaxPerks.value
		game.AddAchievement(58)
	endIf
	self.UnregisterForUpdate()
	self.SetStage(100)
endFunction

function Shutdown()

	if __shuttingDown
		return 
	endIf
	__shuttingDown = true
	actor PlayerActor = game.GetPlayer()
	DCL1VampireLevitateStateGlobal.setValue(0 as Float)
	PlayerActor.GetActorBase().SetInvulnerable(false)
	PlayerActor.SetGhost(false)
	game.SetBeastForm(false)
	game.EnableFastTravel(true)
	game.SetInCharGen(false, false, false)
	debug.Trace("VAMPIRE: Transform to human done - remove activation blocking perk and allow recast of Vampire Change spell", 0)
	PlayerActor.RemovePerk(DLC1VampireActivationBlocker)
	PlayerActor.RemoveSpell(VampireHuntersSight)
	self.UnloadSpells()
	game.EnablePlayerControls(false, false, true, true, true, false, false, false, 1)
	self.stop()
endFunction

function PreloadSpells()

	LeveledDrainSpell.Preload()
	LeveledRaiseDeadSpell.Preload()
	DLC1VampiresGrip.Preload()
	DLC1ConjureGargoyleLeftHand.Preload()
	DLC1CorpseCurse.Preload()
endFunction

function ShiftBack()

	__tryingToShiftBack = true
	actor PlayerActor = game.GetPlayer()
	while PlayerActor.GetAnimationVariableBool("bIsSynced")
		utility.Wait(0.100000)
	endWhile
	__shiftingBack = false
	self.ActuallyShiftBackIfNecessary()
endFunction

function RegisterForEvents()

	debug.Trace("Registering for Animation Events", 0)
	actor PlayerActor = game.GetPlayer()
	self.RegisterForAnimationEvent(PlayerActor as objectreference, Ground)
	self.RegisterForAnimationEvent(PlayerActor as objectreference, Levitate)
	self.RegisterForAnimationEvent(PlayerActor as objectreference, BiteStart)
	self.RegisterForAnimationEvent(PlayerActor as objectreference, LiftoffStart)
	self.RegisterForAnimationEvent(PlayerActor as objectreference, LandStart)
	self.RegisterForAnimationEvent(PlayerActor as objectreference, TransformToHuman)
endFunction

function ActuallyShiftBackIfNecessary()

	actor PlayerActor = game.GetPlayer()
	if __shiftingBack
		return 
	endIf
	__shiftingBack = true
	PlayerActor.GetActorBase().SetInvulnerable(true)
	PlayerActor.SetGhost(true)
	if DLC1HasLightfoot == false
		PlayerActor.RemovePerk(LightFoot)
	endIf
	self.UnregisterForEvents()
	DCL1VampireLevitateStateGlobal.setValue(1 as Float)
	debug.Trace("VAMPIRE: Player returning to normal.", 0)
	game.SetInCharGen(true, true, false)
	self.UnregisterForUpdate()
	if PlayerActor.IsDead()
		debug.Trace("VAMPIRE: Player is dead; bailing out.", 0)
		return 
	endIf
	VampireChange.Apply(1.00000)
	VampireIMODSound.Play(PlayerActor as objectreference)
	DLC1VampireChangeBackFXS.Play(PlayerActor as objectreference, 12.0000)
	Int count = 0
	while count < VampireDispelList.GetSize()
		spell gone = VampireDispelList.GetAt(count) as spell
		if gone != none
			PlayerActor.DispelSpell(gone)
		endIf
		count += 1
	endWhile
	CurrentEquippedLeftSpell = PlayerActor.GetEquippedSpell(0)
	(DialogueGenericVampire as vampirequestscript).LastLeftHandSpell = CurrentEquippedLeftSpell
	if PlayerActor.GetEquippedSpell(2) == DLC1Revert
		(DialogueGenericVampire as vampirequestscript).LastPower = DLC1VampireBats
	else
		(DialogueGenericVampire as vampirequestscript).LastPower = PlayerActor.GetEquippedSpell(2)
	endIf
	PlayerActor.RemoveSpell(LeveledDrainSpell)
	PlayerActor.RemoveSpell(LeveledAbility)
	PlayerActor.RemoveSpell(LeveledRaiseDeadSpell)
	PlayerActor.RemoveSpell(DLC1VampiresGrip)
	PlayerActor.RemoveSpell(DLC1ConjureGargoyleLeftHand)
	PlayerActor.RemoveSpell(DLC1CorpseCurse)
	PlayerActor.RemoveSpell(DLC1VampireDetectLife)
	PlayerActor.RemoveSpell(DLC1VampireMistform)
	PlayerActor.RemoveSpell(DLC1VampireBats)
	PlayerActor.RemoveSpell(DLC1SupernaturalReflexes)
	PlayerActor.RemoveSpell(DLC1NightCloak)
	PlayerActor.RemoveSpell(DLC1Revert)
	PlayerActor.RemoveSpell(DLC1VampireLordSunDamage)
	PlayerActor.DispelSpell(DLC1VampireDetectLife)
	PlayerActor.DispelSpell(DLC1VampireMistform)
	PlayerActor.DispelSpell(DLC1SupernaturalReflexes)
	PlayerActor.DispelSpell(DLC1Revert)
	PlayerActor.DispelSpell(VampireHuntersSight)
	PlayerActor.RemoveSpell(DLC1AbVampireFloatBodyFX)
	pDLC1nVampireNecklaceBats.setValue(0 as Float)
	pDLC1nVampireNecklaceGargoyle.setValue(0 as Float)
	pDLC1nVampireRingBeast.setValue(0 as Float)
	pDLC1nVampireRingErudite.setValue(0 as Float)
	PlayerVampireQuest.VampireProgression(PlayerActor)
	Float currHealth = PlayerActor.GetAV("Health")
	if currHealth <= 70 as Float
		debug.Trace("VAMPIRE: Player's health is only " + currHealth as String + "; restoring.", 0)
		PlayerActor.RestoreAV("Health", 70 as Float - currHealth)
	endIf
	debug.Trace("VAMPIRE: Setting race " + (VampireTrackingQuest as dlc1vampiretrackingquest).PlayerRace as String + " on " + PlayerActor as String, 0)
	PlayerActor.RemoveItem(DLC1VampireLordArmor as form, 2, true, none)
	PlayerActor.SetRace((VampireTrackingQuest as dlc1vampiretrackingquest).PlayerRace)
	DLC1VampireChangeBackFXS.stop(PlayerActor as objectreference)
	DLC1VampireChangeBack02FXS.Play(PlayerActor as objectreference, 0.100000)
	game.ShowFirstPersonGeometry(true)
	PlayerActor.SetAttackActorOnSight(false)
	HunterFaction.SetPlayerEnemy(false)
	PlayerActor.RemoveFromFaction(PlayerVampireFaction)
	Int cfIndex = 0
	while cfIndex < CrimeFactions.GetSize()
		(CrimeFactions.GetAt(cfIndex) as faction).SetPlayerEnemy(false)
		cfIndex += 1
	endWhile
	game.SetPlayerReportCrime(true)
	utility.Wait(5 as Float)
	debug.Trace("OnRaceSwitchComplete event took more than 5 seconds, shutting down ourselves.", 0)
endFunction

function CheckPerkSpells()

	actor PlayerActor = game.GetPlayer()
	if PlayerActor.HasPerk(DLC1MistFormPerk) == true && PlayerActor.HasSpell(DLC1VampireMistform as form) == false
		PlayerActor.AddSpell(DLC1VampireMistform, false)
	endIf
	if PlayerActor.HasPerk(DLC1DetectLifePerk) == true && PlayerActor.HasSpell(DLC1VampireDetectLife as form) == false
		PlayerActor.AddSpell(DLC1VampireDetectLife, false)
	endIf
	if PlayerActor.HasPerk(DLC1SupernaturalReflexesPerk) == true && PlayerActor.HasSpell(DLC1SupernaturalReflexes as form) == false
		PlayerActor.AddSpell(DLC1SupernaturalReflexes, false)
	endIf
	if PlayerActor.HasPerk(DLC1VampiricGrip) == true && PlayerActor.HasSpell(DLC1VampiresGrip as form) == false
		PlayerActor.AddSpell(DLC1VampiresGrip, false)
	endIf
	if PlayerActor.HasPerk(DLC1CorpseCursePerk) == true && PlayerActor.HasSpell(DLC1CorpseCurse as form) == false
		PlayerActor.AddSpell(DLC1CorpseCurse, false)
	endIf
	if PlayerActor.HasPerk(DLC1GargoylePerk) == true && PlayerActor.HasSpell(DLC1ConjureGargoyleLeftHand as form) == false
		PlayerActor.AddSpell(DLC1ConjureGargoyleLeftHand, false)
	endIf
	if PlayerActor.HasPerk(DLC1NightCloakPerk) == true && PlayerActor.HasSpell(DLC1NightCloak as form) == false
		PlayerActor.AddSpell(DLC1NightCloak, false)
	endIf
endFunction

Float function GameTimeDaysToRealTimeSeconds(Float gametime)

	Float gameSeconds = gametime * (60 * 60 * 24) as Float
	return gameSeconds / TimeScale.value
endFunction

function Feed(actor victim)

	; Empty function
endFunction

function WarnPlayer()

	VampireWarn.Apply(1.00000)
endFunction

function HandlePlayerLoadGame()

	if __prepped
		self.PreloadSpells()
	endIf
endFunction

function EstablishLeveledSpells()

	actor PlayerActor = game.GetPlayer()
	Int playerLevel = PlayerActor.GetLevel()
	if playerLevel <= 10
		LeveledDrainSpell = DLC1VampireDrain05
		LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand01
	elseIf playerLevel <= 20
		LeveledDrainSpell = DLC1VampireDrain06
		LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand02
	elseIf playerLevel <= 30
		LeveledDrainSpell = DLC1VampireDrain07
		LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand03
	elseIf playerLevel <= 40
		LeveledDrainSpell = DLC1VampireDrain08
		LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand04
	else
		LeveledDrainSpell = DLC1VampireDrain09
		LeveledRaiseDeadSpell = DLC1VampireRaiseDeadLeftHand05
	endIf
	if playerLevel <= 10
		LeveledAbility = DLC1PlayerVampireLvl10AndBelowAbility
	elseIf playerLevel <= 15
		LeveledAbility = DLC1PlayerVampireLvl15AndBelowAbility
	elseIf playerLevel <= 20
		LeveledAbility = DLC1PlayerVampireLvl20AndBelowAbility
	elseIf playerLevel <= 25
		LeveledAbility = DLC1PlayerVampireLvl25AndBelowAbility
	elseIf playerLevel <= 30
		LeveledAbility = DLC1PlayerVampireLvl30AndBelowAbility
	elseIf playerLevel <= 35
		LeveledAbility = DLC1PlayerVampireLvl35AndBelowAbility
	elseIf playerLevel <= 40
		LeveledAbility = DLC1PlayerVampireLvl40AndBelowAbility
	elseIf playerLevel <= 45
		LeveledAbility = DLC1PlayerVampireLvl45AndBelowAbility
	else
		LeveledAbility = DLC1PlayerVampireLvl50AndOverAbility
	endIf
endFunction

function OnAnimationEventUnregistered(objectreference akSource, String asEventName)

	debug.Trace("Animation Event Unregistered for " + akSource as String + ": " + asEventName, 0)
endFunction

function OnAnimationEvent(objectreference akActor, String akEventName)

	actor PlayerActor = game.GetPlayer()
	debug.Trace("VAMPIRE: Animation Event! " + akActor as String + " " + akEventName, 0)
	if akActor == PlayerActor as objectreference
		if akEventName == TransformToHuman
			self.ActuallyShiftBackIfNecessary()
		endIf
		if akEventName == BiteStart
			debug.Trace("VAMPIRE: Handle BiteStart", 0)
			DLC1VampireBloodPoints.value = DLC1VampireBloodPoints.value + 1 as Float
			if DLC1VampireTotalPerksEarned.value < DLC1VampireMaxPerks.value
				DLC1BloodPointsMsg.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
				debug.Trace("VAMPIRE: Bite kill move, Blood " + DLC1VampireBloodPoints.value as String, 0)
				if DLC1VampireBloodPoints.value >= DLC1VampireNextPerk.value
					DLC1VampireBloodPoints.value = DLC1VampireBloodPoints.value - DLC1VampireNextPerk.value
					DLC1VampirePerkPoints.value = DLC1VampirePerkPoints.value + 1 as Float
					DLC1VampireTotalPerksEarned.value = DLC1VampireTotalPerksEarned.value + 1 as Float
					DLC1VampireNextPerk.value = DLC1VampireNextPerk.value + 2 as Float
					DLC1VampirePerkEarned.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
				endIf
				PlayerActor.SetActorValue("VampirePerks", DLC1VampireBloodPoints.value / DLC1VampireNextPerk.value * 100 as Float)
			endIf
			if PlayerActor.HasPerk(DLC1VampireBite) == 1 as Bool
				PlayerActor.RestoreActorValue("Health", DLC1BiteHealthRecover)
			endIf
			PlayerActor.SetActorValue("VampirePerks", DLC1VampireBloodPoints.value / DLC1VampireNextPerk.value * 100 as Float)
			game.IncrementStat("Necks Bitten", 1)
		endIf
		if akEventName == LandStart
			debug.Trace("VAMPIRE: Handle LandStart", 0)
			DCL1VampireLevitateStateGlobal.setValue(1 as Float)
		endIf
		if akEventName == Ground
			debug.Trace("VAMPIRE: Handle GroundStart", 0)
			DCL1VampireLevitateStateGlobal.setValue(1 as Float)
			CurrentEquippedLeftSpell = PlayerActor.GetEquippedSpell(0)
			debug.Trace("VAMPIRE: saving equipped left spell " + CurrentEquippedLeftSpell as String, 0)
			if CurrentEquippedLeftSpell != none
				PlayerActor.UnequipSpell(CurrentEquippedLeftSpell, 0)
			endIf
			PlayerActor.UnequipSpell(LeveledDrainSpell, 1)
			PlayerActor.RemoveSpell(LeveledRaiseDeadSpell)
			PlayerActor.RemoveSpell(DLC1CorpseCurse)
			PlayerActor.RemoveSpell(DLC1VampiresGrip)
			PlayerActor.RemoveSpell(DLC1ConjureGargoyleLeftHand)
		endIf
		if akEventName == LiftoffStart
			debug.Trace("VAMPIRE: Handle LiftoffStart", 0)
			DCL1VampireLevitateStateGlobal.setValue(2 as Float)
		endIf
		if akEventName == Levitate
			debug.Trace("VAMPIRE: Handle LevitateStart", 0)
			DCL1VampireLevitateStateGlobal.setValue(2 as Float)
			PlayerActor.EquipSpell(LeveledDrainSpell, 1)
			if (DialogueGenericVampire as vampirequestscript).LastLeftHandSpell == none
				(DialogueGenericVampire as vampirequestscript).LastLeftHandSpell = DLC1VampireRaiseDeadLeftHand01
			endIf
			if CurrentEquippedLeftSpell == none
				CurrentEquippedLeftSpell = (DialogueGenericVampire as vampirequestscript).LastLeftHandSpell
				debug.Trace("VAMPIRE: Spell from last session set as current last spell = " + CurrentEquippedLeftSpell as String, 0)
			endIf
			self.CheckPerkSpells()
			PlayerActor.AddSpell(LeveledRaiseDeadSpell, false)
			PlayerActor.EquipSpell(CurrentEquippedLeftSpell, 0)
			debug.Trace("VAMPIRE: Last spell left eqiupped = " + CurrentEquippedLeftSpell as String, 0)
			PlayerActor.EquipSpell(LeveledDrainSpell, 1)
			debug.Trace("VAMPIRE: Last spell right eqiupped = " + LeveledDrainSpell as String, 0)
		endIf
	endIf
endFunction

function UnregisterForEvents()

	debug.Trace("Unregistering for Animation Events", 0)
	actor PlayerActor = game.GetPlayer()
	self.UnRegisterForAnimationEvent(PlayerActor as objectreference, Ground)
	self.UnRegisterForAnimationEvent(PlayerActor as objectreference, Levitate)
	self.UnRegisterForAnimationEvent(PlayerActor as objectreference, BiteStart)
	self.UnRegisterForAnimationEvent(PlayerActor as objectreference, LiftoffStart)
	self.UnRegisterForAnimationEvent(PlayerActor as objectreference, LandStart)
	self.UnRegisterForAnimationEvent(PlayerActor as objectreference, TransformToHuman)
endFunction

function OnUpdate()

	actor PlayerActor = game.GetPlayer()
	game.SetInCharGen(false, false, false)
	debug.Trace("VAMPIRE: Perks stat = " + game.QueryStat("NumVampirePerks") as String, 0)
	if game.QueryStat("NumVampirePerks") as Float >= DLC1VampireMaxPerks.value
		game.AddAchievement(58)
	endIf
	if Untimed
		return 
	endIf
	if PlayerActor.HasMagicEffect(DLC1RevertEffect) == true && !PlayerActor.IsInKillMove() && !__tryingToShiftBack
		debug.Trace("VAMPIRE: Revert effect detected", 0)
		self.Revert()
	else
		game.ForceThirdPerson()
	endIf
endFunction

function InitialShift()

	debug.Trace("VAMPIRE: Player beginning transformation.", 0)
	actor PlayerActor = game.GetPlayer()
	VampireWarn.Apply(1.00000)
	if PlayerActor.IsDead()
		debug.Trace("VAMPIRE: Player is dead; bailing out.", 0)
		return 
	endIf
	PlayerActor.GetActorBase().SetInvulnerable(true)
	PlayerActor.SetGhost(true)
	PlayerActor.SetRace(VampireLordRace)
	PlayerActor.AddSpell(DLC1AbVampireFloatBodyFX, false)
endFunction

Float function RealTimeSecondsToGameTimeDays(Float realtime)

	Float scaledSeconds = realtime * TimeScale.value
	return scaledSeconds / (60 * 60 * 24) as Float
endFunction
