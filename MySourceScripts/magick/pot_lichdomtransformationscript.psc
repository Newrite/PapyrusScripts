Scriptname POT_LichdomTransformationScript extends ActiveMagicEffect

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property POT_GameDaysPassedSinceCursed Auto
GlobalVariable Property pDLC1VQ04SafeToEnter Auto

Spell Property POT_LichEyesFX Auto
Spell Property POT_LichMistFX Auto
Spell Property POT_LichAgeingAbility Auto
Spell Property POT_LichRaceChange Auto
Spell Property POT_LichWaterbreathing Auto
Spell Property POT_LichUndeadKeyword Auto
Spell Property POT_LichTransformationFX Auto
Spell Property POT_LichResurrection Auto
Spell Property POT_LichBleedout Auto
Spell Property POT_LichUndyingSight Auto
Spell Property POT_LichUndyingPerception Auto
Spell Property POT_LichLivingDeath Auto
Spell Property POT_LichDisguiseForm Auto
Spell Property POT_LichUnnaturalResistance Auto
Spell Property POT_LichUnnaturalResistanceHigh Auto
Spell Property POT_LichFrostResistance Auto
Spell Property POT_LichFrostResistanceHigh Auto
Spell Property POT_LichShockResistance Auto
Spell Property POT_LichShockResistanceHigh Auto
Spell Property POT_LichFireWeakness Auto
Spell Property POT_LichFireWeaknessHigh Auto
Spell Property POT_LichPoisonResistance Auto
Spell Property POT_LichDiseaseResistance Auto
Spell Property POT_LichCureDisease Auto
Spell Property POT_LichPhylacteryAbility Auto
Spell Property POT_LichMagicBoost01 Auto
Spell Property POT_LichEmpowerment01 Auto
Spell Property POT_LichNecroticDementia01 Auto
Spell Property POT_LichAuraOfDeath01 Auto
Spell Property POT_LichWeakened01 Auto
Spell Property POT_LichWeakened02 Auto
Spell Property POT_LichWeakened03 Auto
Spell Property POT_LichWeakened04 Auto
Spell Property POT_LichWeakened05 Auto

Float Property POT_DaysCursed Auto
Float Property POT_DaysCursed01 Auto
Float Property POT_DaysCursed02 Auto
Float Property POT_DaysCursed03 Auto
Float Property POT_DaysCursed04 Auto
Float Property POT_DaysCursed05 Auto

Faction Property VampirePCFaction Auto

Actor Property PlayerRef Auto

Idle Property BleedOutStart Auto
Idle Property BleedOutStop Auto

ImageSpaceModifier Property VampireTransformDecreaseISMD  Auto

EffectShader Property VampireChangeFX auto

Sound Property MagVampireTransform01 Auto

int ONE = 1
int TWO = 2
int THREE = 3
int FOUR = 4
int FIVE = 5

;Control the Transformation Effect into the Lich, we want it so be similar to the Vampire Transformation but unlike the Vampire Transformation it will take the player 10 days to become a Lich and another 40 days to fully develop.
;The development is handled by the Lich ageing Script, this one just handles the Lich transformation itself.

Event OnEffectStart(Actor Target, Actor Caster)
	Game.ForceThirdPerson()
	Game.ShakeCamera(afStrength = 0.75, afDuration = 7)
	Game.DisablePlayerControls()
	PlayerRef.PlayIdle(BleedOutStart)
	Utility.Wait(2.0)
	VampireChangeFX.play(PlayerRef)
	VampireTransformDecreaseISMD.applyCrossFade(2.0)
	MAGVampireTransform01.Play(PlayerRef)
	utility.wait(2.0)
	imageSpaceModifier.removeCrossFade()
	Utility.Wait(1.0)
	PlayerRef.PlayIdle(BleedOutStop)
	Utility.Wait(1.0)
	VampireChangeFX.stop(PlayerRef)
	Utility.Wait(1.5)

;Clear player's diseases, unlike the vanilla scripts poorly implemented way which does not cover DLC or mod added diseases we will instead cast a cure disease spell, this will ensure any custom diseases will be removed as well.

        POT_LichCureDisease.Cast(Game.GetPlayer())

	utility.Wait(1.0)
	Game.EnablePlayerControls()

	If Target == PlayerRef
		POT_GameDaysPassedSinceCursed.SetValue(1)
		POT_DaysCursed01 = GameDaysPassed.Value + ONE
		POT_DaysCursed02 = GameDaysPassed.Value + TWO
		POT_DaysCursed03 = GameDaysPassed.Value + THREE
		POT_DaysCursed04 = GameDaysPassed.Value + FOUR
		POT_DaysCursed05 = GameDaysPassed.Value + FIVE
		RegisterForUpdateGameTime(24)
	EndIf

EndEvent

Event OnUpdateGameTime()

	  If GameDaysPassed.Value >= POT_DaysCursed05
               PlayerRef.AddSpell(POT_LichEyesFX, False)
               PlayerRef.AddSpell(POT_LichMistFX, False)
               PlayerRef.AddSpell(POT_LichAgeingAbility, False)
               PlayerRef.AddSpell(POT_LichRaceChange, False)
               PlayerRef.AddSpell(POT_LichResurrection, False)
               PlayerRef.AddSpell(POT_LichUndeadKeyword, False)
               PlayerRef.AddSpell(POT_LichWaterbreathing, False)
               PlayerRef.AddSpell(POT_LichUndyingSight, False)
               PlayerRef.AddSpell(POT_LichUndyingPerception, False)
               PlayerRef.AddSpell(POT_LichLivingDeath, False)
               PlayerRef.AddSpell(POT_LichDisguiseForm, False)
               PlayerRef.AddSpell(POT_LichUnnaturalResistance, False)
               PlayerRef.AddSpell(POT_LichUnnaturalResistanceHigh, False)
               PlayerRef.AddSpell(POT_LichFrostResistance, False)
               PlayerRef.AddSpell(POT_LichFrostResistanceHigh, False)
               PlayerRef.AddSpell(POT_LichShockResistance, False)
               PlayerRef.AddSpell(POT_LichShockResistanceHigh, False)
	        PlayerRef.AddSpell(POT_LichFireWeakness, False)
               PlayerRef.AddSpell(POT_LichFireWeaknessHigh, False)
               PlayerRef.AddSpell(POT_LichPoisonResistance, False)
               PlayerRef.AddSpell(POT_LichDiseaseResistance, False)
               PlayerRef.AddSpell(POT_LichMagicBoost01, False)
               PlayerRef.AddSpell(POT_LichEmpowerment01, False)
               PlayerRef.AddSpell(POT_LichNecroticDementia01, False)
               PlayerRef.AddSpell(POT_LichAuraOfDeath01, False)
               PlayerRef.RemoveSpell(POT_LichPhylacteryAbility)
               PlayerRef.RemoveSpell(POT_LichWeakened05)
               ;Game.GetPlayer().AddToFaction(VampirePCFaction)
               ;Game.GetPlayer().SetAttackActorOnSight(True)
                POT_LichTransformationFX.Cast(Game.GetPlayer())
                pDLC1VQ04SafeToEnter.SetValue(1)
                UnRegisterForUpdateGameTime()
                Debug.Notification("Мощь вырывается из вас во время трансформации...")
             POT_GameDaysPassedSinceCursed.SetValue(5)

	ElseIf GameDaysPassed.Value >= POT_DaysCursed04
             POT_LichBleedOut.Cast(Game.GetPlayer())
		PlayerRef.AddSpell(POT_LichWeakened05, False)
                PlayerRef.RemoveSpell(POT_LichWeakened04)
                Debug.Notification("С каждым днем вы чувствуете себя все слабей...")
		POT_GameDaysPassedSinceCursed.SetValue(4)

	ElseIf GameDaysPassed.Value >= POT_DaysCursed03
             POT_LichBleedOut.Cast(Game.GetPlayer())
                PlayerRef.AddSpell(POT_LichWeakened04, False)
                PlayerRef.RemoveSpell(POT_LichWeakened03)
                Debug.Notification("С каждым днем вы чувствуете себя все слабей...")
		POT_GameDaysPassedSinceCursed.SetValue(3)

	ElseIf GameDaysPassed.Value >= POT_DaysCursed02
              POT_LichBleedOut.Cast(Game.GetPlayer())
                PlayerRef.AddSpell(POT_LichWeakened03, False)
                PlayerRef.RemoveSpell(POT_LichWeakened02)
                Debug.Notification("С каждым днем вы чувствуете себя все слабей...")
		POT_GameDaysPassedSinceCursed.SetValue(2)

	ElseIf GameDaysPassed.Value >= POT_DaysCursed01
             POT_LichBleedOut.Cast(Game.GetPlayer())
                PlayerRef.AddSpell(POT_LichWeakened02, False)
                PlayerRef.RemoveSpell(POT_LichWeakened01)
                Debug.Notification("С каждым днем вы чувствуете себя все слабей...")
		POT_GameDaysPassedSinceCursed.SetValue(1)
	Endif
EndEvent
