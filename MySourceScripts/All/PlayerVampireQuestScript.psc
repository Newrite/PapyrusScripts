ScriptName PlayerVampireQuestScript extends Quest Conditional

;рудименты, удалить при первой возможности
Float Property LastFeedTime Auto
Float Property FeedTimer Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property VampireFeedReady Auto
Int Property Req_StatusCache  Auto  
Faction Property VampirePCFaction  Auto  
Message Property VampireStage4Message Auto
Message Property VampireStageProgressionMessage Auto

;Variable to track if the player is a vampire
;0 = Not a Vampire
;1 = Vampire
Int Property VampireStatus Auto Conditional

Message Property VampireFeedMessage Auto
Race Property ArgonianRace  Auto  
Race Property ArgonianRaceVampire  Auto  
Race Property BretonRace  Auto  
Race Property BretonRaceVampire  Auto  
Race Property DarkElfRace  Auto  
Race Property DarkElfRaceVampire  Auto  
Race Property HighElfRace  Auto  
Race Property HighElfRaceVampire  Auto  
Race Property ImperialRace  Auto  
Race Property ImperialRaceVampire  Auto  
Race Property KhajiitRace  Auto  
Race Property KhajiitRaceVampire  Auto  
Race Property NordRace  Auto  
Race Property NordRaceVampire  Auto  
Race Property OrcRace  Auto  
Race Property OrcRaceVampire  Auto  
Race Property RedguardRace  Auto  
Race Property RedguardRaceVampire  Auto  
Race Property WoodElfRace  Auto  
Race Property WoodElfRaceVampire  Auto  
Race Property CureRace Auto
Static Property XMarker Auto

Idle Property VampireFeedingBedRight Auto
Idle Property VampireFeedingBedrollRight Auto
imageSpaceModifier Property VampireTransformIncreaseISMD  Auto
imageSpaceModifier Property VampireTransformDecreaseISMD  Auto 
effectShader property VampireChangeFX auto

Function VampireFeedBed()

	Game.GetPlayer().PlayIdle(VampireFeedingBedRight)

EndFunction

Function VampireFeedBedRoll()

	Game.GetPlayer().PlayIdle(VampireFeedingBedrollRight)

EndFunction

Function VampireChange(Actor Target)
	;Effects for hiding the change
	Game.DisablePlayerControls()
	VampireChangeFX.play(Target)
	VampireTransformIncreaseISMD.applyCrossFade(2.0)
	ObjectReference myXmarker = Target.PlaceAtMe(Xmarker)
	MAGVampireTransform01.Play(myXmarker)
	myXmarker.Disable()
	utility.wait(2.0)
	imageSpaceModifier.removeCrossFade()
	VampireChangeFX.stop(Target)

	;Change player's race, defaults to Nord Vampire
	if (Target.GetActorBase().GetRace() == ArgonianRace)
		CureRace = ArgonianRace
		Target.SetRace(ArgonianRaceVampire)
	elseif (Target.GetActorBase().GetRace() == BretonRace)
		CureRace = BretonRace
		Target.SetRace(BretonRaceVampire) 
	elseif (Target.GetActorBase().GetRace() == DarkElfRace)
		CureRace = DarkElfRace
		Target.SetRace(DarkElfRaceVampire) 
	elseif (Target.GetActorBase().GetRace() == HighELfRace)
		CureRace = HighELfRace
		Target.SetRace(HighELfRaceVampire) 
	elseif (Target.GetActorBase().GetRace() == ImperialRace)
		CureRace = ImperialRace
		Target.SetRace(ImperialRaceVampire) 
	elseif (Target.GetActorBase().GetRace() == KhajiitRace)
		CureRace = KhajiitRace
		Target.SetRace(KhajiitRaceVampire) 
	elseif (Target.GetActorBase().GetRace() == NordRace)
		CureRace = NordRace
		Target.SetRace(NordRaceVampire) 
	elseif (Target.GetActorBase().GetRace() == OrcRace)
		CureRace = OrcRace
		Target.SetRace(OrcRaceVampire) 
	elseif (Target.GetActorBase().GetRace() == RedguardRace)
		CureRace = RedguardRace
		Target.SetRace(RedguardRaceVampire) 
	elseif (Target.GetActorBase().GetRace() == WoodElfRace)
		CureRace = WoodElfRace
		Target.SetRace(WoodElfRaceVampire) 
	endif

	;Clear player's diseases
	;VampireCureDisease.Cast(Target)
	Target.RemoveSpell(DiseaseBoneBreakFever)
	Target.RemoveSpell(DiseaseBrainRot )
	Target.RemoveSpell(DiseaseRattles )
	Target.RemoveSpell(DiseaseRockjoint )
	Target.RemoveSpell(DiseaseWitbane )
	Target.RemoveSpell(DiseasePorphyricHemophelia)
	Target.RemoveSpell(DiseaseAtaxia)

	;Clear player's trap diseases
	;VampireCureDisease.Cast(Target)
	Target.RemoveSpell(TrapDiseaseBoneBreakFever)
	Target.RemoveSpell(TrapDiseaseBrainRot )
	Target.RemoveSpell(TrapDiseaseRattles )
	Target.RemoveSpell(TrapDiseaseRockjoint )
	Target.RemoveSpell(TrapDiseaseWitbane )
	Target.RemoveSpell(TrapDiseasePorphyricHemophelia)
	Target.RemoveSpell(TrapDiseaseAtaxia)

	;Make player Vampire
	VampireStatus =  1
	VampireProgression(Game.GetPlayer())
	
	;Set the Global for stat tracking
	PlayerIsVampire.SetValue(1)
	
	Utility.Wait(1)
	Game.EnablePlayerControls()	

	;If the player has been cured before, restart the cure quest
	If VC01.GetStageDone(200) == 1
		VC01.SetStage(25)
	EndIf

	Game.GetPlayer().AddtoFaction(VampirePCFactionDawnguard) ; edited by Xarrian
	
EndFunction

Function VampireFeed()
	VampireTransformDecreaseISMD.applyCrossFade(2.0)
	utility.wait(2.0)
	imageSpaceModifier.removeCrossFade()
	
	Game.IncrementStat( "Necks Bitten" )
	VampireFeedMessage.Show()

	Game.GetPlayer().RestoreActorValue("health", 100) ; edited by Xarrian, this is to allow vampires to heal by feeding

	Utility.Wait(0.5)  ; edited by Xarrian

	;Player is no longer hated
	; REQ-537 - The original UDGP comment was "Player is no longer hated. Only used for players that load DLC as a vampire"
	; that means we should consider revising the following two lines to adhere to Dawnguard-related edits from Xarrian.

	Game.GetPlayer().SetAttackActorOnSight(False)

	int cfIndex = 0
	;Debug.Trace("VAMPIRE feed: DLC1CrimeFactions = " + DLC1CrimeFactions)
	;Debug.Trace("VAMPIRE feed: CrimeFactions before = " + CrimeFactions)
	CrimeFactions = DLC1CrimeFactions
	;Debug.Trace("VAMPIRE feed: CrimeFactions after = " + CrimeFactions)
	while (cfIndex < CrimeFactions.GetSize())
; 		Debug.Trace("VAMPIRE: Removing enemy flag from " + CrimeFactions.GetAt(cfIndex))
		(CrimeFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy(false)
		cfIndex += 1
	endwhile

EndFunction

Function VampireProgression(Actor Player)

	VampireTransformIncreaseISMD.applyCrossFade(2.0)
	utility.wait(2.0)
	imageSpaceModifier.removeCrossFade()
	Player.RemoveSpell(AbVampire01)
	Player.RemoveSpell(AbVampire02)
	Player.RemoveSpell(AbVampire03)
	Player.RemoveSpell(AbVampire01b)
	Player.RemoveSpell(AbVampire02b)
	Player.RemoveSpell(AbVampire03b)
	Player.AddSpell(ABVampireSkills, abVerbose = False)
	Player.AddSpell(ABVampireSkills02, abVerbose = False)
	Player.AddSpell(AbVampire04, abVerbose = False)
	Player.AddSpell(AbVampire04b, abVerbose = False)
	
	Player.AddSpell(VampireDrain04, abVerbose = False)				
		
	Player.RemoveSpell(VampireRaiseThrall01)
	Player.RemoveSpell(VampireRaiseThrall02)
	Player.RemoveSpell(VampireRaiseThrall03)
	Player.AddSpell(VampireRaiseThrall04, abVerbose = False)
	Player.RemoveSpell(VampireStrength01)
	Player.RemoveSpell(VampireStrength02)
	Player.RemoveSpell(VampireStrength03)
	Player.AddSpell(VampireStrength04, abVerbose = False)
	Player.RemoveSpell(VampireSunDamage01)
	Player.RemoveSpell(VampireSunDamage02)
	Player.RemoveSpell(VampireSunDamage03)
	Player.AddSpell(VampireSunDamage04, abVerbose = False)

	Player.AddSpell(VampireInvisibilityPC, false)	 ; edited by Xarrian

	Player.AddSpell(VampireCharm, false) ; edited by Xarrian
	
EndFunction

Function VampireCure(Actor Player)
	
	Game.IncrementStat( "Vampirism Cures" )

	VampireStatus = 0
	;Player is no longer hated

	Player.RemoveFromFaction(VampirePCFactionDawnguard) ; edited by Xarrian
	Player.SetAttackActorOnSight(False)
	
	;Remove all abilities
	Player.RemoveSpell(DLC1VampireChange)
	Player.RemoveSpell(ABVampireSkills)
	Player.RemoveSpell(ABVampireSkills02)	
	Player.RemoveSpell(AbVampire01)
	Player.RemoveSpell(AbVampire02)
	Player.RemoveSpell(AbVampire03)
	Player.RemoveSpell(AbVampire04)
	Player.RemoveSpell(AbVampire01b)
	Player.RemoveSpell(AbVampire02b)
	Player.RemoveSpell(AbVampire03b)
	Player.RemoveSpell(AbVampire04b)
	Player.RemoveSpell(VampireDrain01)
	Player.RemoveSpell(VampireDrain02)
	Player.RemoveSpell(VampireDrain03)
	Player.RemoveSpell(VampireDrain04)
	Player.RemoveSpell(VampireRaiseThrall01)
	Player.RemoveSpell(VampireRaiseThrall02)
	Player.RemoveSpell(VampireRaiseThrall03)
	Player.RemoveSpell(VampireRaiseThrall04)
	Player.RemoveSpell(VampireStrength01)	; RRO-121 Since we're using these abilities, we have to remove them too
	Player.RemoveSpell(VampireStrength02)
	Player.RemoveSpell(VampireStrength03)
	Player.RemoveSpell(VampireStrength04)
	Player.RemoveSpell(VampireSunDamage01)
	Player.RemoveSpell(VampireSunDamage02)
	Player.RemoveSpell(VampireSunDamage03)
	Player.RemoveSpell(VampireSunDamage04)
	
	Player.RemoveSpell(VampireCharm)
	Player.RemoveSpell(VampireCloak)	; RRO-121 Since we're using these abilities, we have to remove them too
	Player.RemoveSpell(VampireInvisibilityPC)	
	
	;Change player's race, defaults to Nord
	if (Player.GetRace() == ArgonianRaceVampire)
		Player.SetRace(ArgonianRace)
	elseif (Player.GetRace() == BretonRaceVampire)
		Player.SetRace(BretonRace) 
	elseif (Player.GetRace() == DarkElfRaceVampire)
		Player.SetRace(DarkElfRace) 
	elseif (Player.GetRace() == HighELfRaceVampire)
		Player.SetRace(HighElfRace) 
	elseif (Player.GetRace() == ImperialRaceVampire)
		Player.SetRace(ImperialRace) 
	elseif (Player.GetRace() == KhajiitRaceVampire)
		Player.SetRace(KhajiitRace) 
	elseif (Player.GetRace() == NordRaceVampire)
		Player.SetRace(NordRace) 
	elseif (Player.GetRace() == OrcRaceVampire)
		Player.SetRace(OrcRace) 
	elseif (Player.GetRace() == RedguardRaceVampire)
		Player.SetRace(RedguardRace) 
	elseif (Player.GetRace() == WoodElfRaceVampire)
		Player.SetRace(WoodElfRace) 
	endif

	;Set the Global for stat tracking
	PlayerIsVampire.SetValue(0)
	
	;make sure Hunter's Sight is gone
	Player.RemoveSpell(VampireHuntersSight)
	
EndFunction

Spell Property AbVampire01 Auto
Spell Property AbVampire02 Auto
Spell Property AbVampire03 Auto
Spell Property AbVampire04 Auto
Spell Property AbVampire01b Auto
Spell Property AbVampire02b Auto
Spell Property AbVampire03b Auto
Spell Property AbVampire04b Auto

Spell Property VampireDrain01 Auto
Spell Property VampireDrain02 Auto
Spell Property VampireDrain03 Auto
Spell Property VampireDrain04 Auto

Spell Property VampireRaiseThrall01 Auto
Spell Property VampireRaiseThrall02 Auto
Spell Property VampireRaiseThrall03 Auto
Spell Property VampireRaiseThrall04 Auto

Spell Property VampireStrength01 Auto
Spell Property VampireStrength02 Auto
Spell Property VampireStrength03 Auto
Spell Property VampireStrength04 Auto

Spell Property VampireSunDamage01 Auto
Spell Property VampireSunDamage02 Auto
Spell Property VampireSunDamage03 Auto
Spell Property VampireSunDamage04 Auto

Spell Property VampireHuntersSight Auto
Spell Property VampireCharm Auto
Spell Property VampireCloak Auto
Spell Property VampireInvisibilityPC Auto

Spell Property VampireCureDisease Auto

Spell Property ABVampireSkills Auto
Spell Property ABVampireSkills02 Auto

Spell Property DiseasePorphyricHemophelia Auto


GlobalVariable Property PlayerIsVampire  Auto  

Sound  Property MagVampireTransform01  Auto  

Spell Property DiseaseAtaxia auto
Spell Property DiseaseBoneBreakFever Auto
Spell Property DiseaseBrainRot Auto
Spell Property DiseaseRattles Auto
Spell Property DiseaseRockjoint auto
Spell Property DiseaseWitbane Auto
;Trap Diseases that also need to be removed
Spell Property TrapDiseaseAtaxia auto
Spell Property TrapDiseaseBoneBreakFever Auto
Spell Property TrapDiseaseBrainRot Auto
Spell Property TrapDiseaseRattles Auto
Spell Property TrapDiseaseRockjoint auto
Spell Property TrapDiseaseWitbane Auto
Spell Property TrapDiseasePorphyricHemophelia Auto

Quest Property VC01 Auto
FormList Property CrimeFactions  Auto  

SPELL Property DLC1VampireChange  Auto  

FormList Property DLC1CrimeFactions  Auto  

; used to check for player in vampire lord form
MagicEffect Property DLC1VampireChangeEffect Auto
MagicEffect Property DLC1VampireChangeFXEffect Auto
Faction Property VampirePCFactionDawnguard  Auto  
