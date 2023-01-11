Scriptname POT_LichdomAgeingScript extends ActiveMagicEffect  

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property POT_GameDaysPassedSinceUndeath Auto

Float Property POT_DaysUndead Auto
Float Property POT_DaysUndead01 Auto
Float Property POT_DaysUndead02 Auto
Float Property POT_DaysUndead03 Auto
Float Property POT_DaysUndead04 Auto

Spell Property POT_LichMagicBoost01 Auto
Spell Property POT_LichMagicBoost02 Auto
Spell Property POT_LichMagicBoost03 Auto
Spell Property POT_LichMagicBoost04 Auto
Spell Property POT_LichMagicBoost05 Auto
Spell Property POT_LichEmpowerment01 Auto
Spell Property POT_LichEmpowerment02 Auto
Spell Property POT_LichEmpowerment03 Auto
Spell Property POT_LichEmpowerment04 Auto
Spell Property POT_LichEmpowerment05 Auto
Spell Property POT_LichNecroticDementia01 Auto
Spell Property POT_LichNecroticDementia02 Auto
Spell Property POT_LichNecroticDementia03 Auto
Spell Property POT_LichNecroticDementia04 Auto
Spell Property POT_LichNecroticDementia05 Auto
Spell Property POT_LichAuraOfDeath01 Auto
Spell Property POT_LichAuraOfDeath02 Auto
Spell Property POT_LichAuraOfDeath03 Auto
Spell Property POT_LichAuraOfDeath04 Auto
Spell Property POT_LichAuraOfDeath05 Auto

Actor Property PlayerRef Auto

ImageSpaceModifier Property VampireTransformDecreaseISMD  Auto


;Controls the ageing system of "The Path of Transcendence" Lichdom mechanic, every 10 days the Lich will grow in power up to a maximum of 40 days.

Event OnEffectStart(Actor Target, Actor Caster)
  
         If Target == PlayerRef
		POT_GameDaysPassedSinceUndeath.SetValue(1)
		POT_DaysUndead01 = GameDaysPassed.Value + 10 
		POT_DaysUndead02 = GameDaysPassed.Value + 20
		POT_DaysUndead03 = GameDaysPassed.Value + 30
		POT_DaysUndead04 = GameDaysPassed.Value + 40
		RegisterForUpdateGameTime(240)
	EndIf

EndEvent

Event OnUpdateGameTime()

	  If GameDaysPassed.Value >= POT_DaysUndead04
               VampireTransformDecreaseISMD.applyCrossFade(2.0)
                utility.wait(2.0)
	         imageSpaceModifier.removeCrossFade()
                PlayerRef.AddSpell(POT_LichMagicBoost05, False)
                PlayerRef.AddSpell(POT_LichEmpowerment05, False)
                PlayerRef.AddSpell(POT_LichNecroticDementia05, False)
                PlayerRef.AddSpell(POT_LichAuraOfDeath05, False)
                PlayerRef.RemoveSpell(POT_LichMagicBoost04)
                PlayerRef.RemoveSpell(POT_LichEmpowerment04)
                PlayerRef.RemoveSpell(POT_LichNecroticDementia04)
                PlayerRef.RemoveSpell(POT_LichAuraOfDeath04)
                UnRegisterForUpdateGameTime()
                Debug.Notification("You feel your vile powers reach their peak...")
		POT_GameDaysPassedSinceUndeath.SetValue(40)

	ElseIf GameDaysPassed.Value >= POT_DaysUndead03
               VampireTransformDecreaseISMD.applyCrossFade(2.0)
               utility.wait(2.0)
	         imageSpaceModifier.removeCrossFade()
                PlayerRef.AddSpell(POT_LichMagicBoost04, False)
                PlayerRef.AddSpell(POT_LichEmpowerment04, False)
                PlayerRef.AddSpell(POT_LichNecroticDementia04, False)
                PlayerRef.AddSpell(POT_LichAuraOfDeath04, False)
                PlayerRef.RemoveSpell(POT_LichMagicBoost03)
                PlayerRef.RemoveSpell(POT_LichEmpowerment03)
                PlayerRef.RemoveSpell(POT_LichNecroticDementia03)
                PlayerRef.RemoveSpell(POT_LichAuraOfDeath03)
                Debug.Notification("You feel your vile powers grow...")
		POT_GameDaysPassedSinceUndeath.SetValue(30)

	ElseIf GameDaysPassed.Value >= POT_DaysUndead02
               VampireTransformDecreaseISMD.applyCrossFade(2.0)
                utility.wait(2.0)
	         imageSpaceModifier.removeCrossFade()
                PlayerRef.AddSpell(POT_LichMagicBoost03, False)
                PlayerRef.AddSpell(POT_LichEmpowerment03, False)
                PlayerRef.AddSpell(POT_LichNecroticDementia03, False)
                PlayerRef.AddSpell(POT_LichAuraOfDeath03, False)
                PlayerRef.RemoveSpell(POT_LichMagicBoost02)
                PlayerRef.RemoveSpell(POT_LichEmpowerment02)
                PlayerRef.RemoveSpell(POT_LichNecroticDementia02)
                PlayerRef.RemoveSpell(POT_LichAuraOfDeath02)
                Debug.Notification("You feel your vile powers grow...")
		POT_GameDaysPassedSinceUndeath.SetValue(20)

	ElseIf GameDaysPassed.Value >= POT_DaysUndead01
               VampireTransformDecreaseISMD.applyCrossFade(2.0)
                utility.wait(2.0)
	         imageSpaceModifier.removeCrossFade()
                PlayerRef.AddSpell(POT_LichMagicBoost02, False)
                PlayerRef.AddSpell(POT_LichEmpowerment02, False)
                PlayerRef.AddSpell(POT_LichNecroticDementia02, False)
                PlayerRef.AddSpell(POT_LichAuraOfDeath02, False)
                PlayerRef.RemoveSpell(POT_LichMagicBoost01)
                PlayerRef.RemoveSpell(POT_LichEmpowerment01)
                PlayerRef.RemoveSpell(POT_LichNecroticDementia01)
                PlayerRef.RemoveSpell(POT_LichAuraOfDeath01)
                Debug.Notification("You feel your vile powers grow...")
		POT_GameDaysPassedSinceUndeath.SetValue(10)
	Endif
EndEvent 
