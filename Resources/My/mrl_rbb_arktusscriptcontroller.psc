ScriptName MRL_RBB_ArktusScriptController Extends ActiveMagicEffect

Spell Property ArktusSpell Auto
Spell Property ArktusController Auto

Float Property Stamina Auto
Float Property StaminaRateMult Auto
Float Property SpeedMult Auto
Float Property SpeedWeapon Auto
Float Property Expertise Auto
Float Property Health Auto
Float Property DrainMagicka Auto
Float Property AlterationScaling Auto
Float Property DamagePerBaseMana Auto

Float AlterationValue = 0.0
Float ONE = 1.0
Float StaminaValue = 0.0
Float StaminaRateMultValue = 0.0
Float SpeedMultValue = 0.0
Float SpeedWeaponValue = 0.0
Float ExpertiseValue = 0.0
Float HealthValue = 0.0
Float WeaponDamage = 0.0
Float DrainMagickaValue = 0.0
Float AlterationScalingValue = 0.0
Float OldBaseMagicka = 0.0

Actor Caster

Function ArktusCalculate()
  OldBaseMagicka = Caster.GetBaseAV("Magicka")
  AlterationValue = Caster.GetAV("Alteration")
  AlterationScalingValue = ONE + (AlterationValue * AlterationScaling)
  StaminaValue = Stamina * AlterationScalingValue
  StaminaRateMultValue = StaminaRateMult * AlterationScalingValue
  SpeedMultValue = SpeedMult * AlterationScalingValue
  SpeedWeaponValue = SpeedWeapon * AlterationScalingValue
  ExpertiseValue = Expertise * AlterationScalingValue
  HealthValue = Health * AlterationScalingValue
  WeaponDamage = OldBaseMagicka * DamagePerBaseMana
  DrainMagickaValue = DrainMagicka * AlterationScalingValue
EndFunction

Function SetArktusMagnitude()
  if Caster.HasSpell(ArktusSpell)
      Caster.RemoveSpell(ArktusSpell)
  endif
  ArktusSpell.SetNthEffectMagnitude(0, StaminaValue)
  ArktusSpell.SetNthEffectMagnitude(1, StaminaRateMultValue)
  ArktusSpell.SetNthEffectMagnitude(2, SpeedMultValue)
  ArktusSpell.SetNthEffectMagnitude(3, SpeedWeaponValue)
  ArktusSpell.SetNthEffectMagnitude(4, SpeedWeaponValue)
  ArktusSpell.SetNthEffectMagnitude(5, ExpertiseValue)
  ArktusSpell.SetNthEffectMagnitude(6, ExpertiseValue)
  ArktusSpell.SetNthEffectMagnitude(7, HealthValue)
  ArktusSpell.SetNthEffectMagnitude(8, WeaponDamage)
  ArktusSpell.SetNthEffectMagnitude(9, WeaponDamage)
  ArktusSpell.SetNthEffectMagnitude(10, WeaponDamage)
  ArktusSpell.SetNthEffectMagnitude(11, DrainMagickaValue)
  Caster.AddSpell(ArktusSpell, false)
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
  Caster = akCaster
  RegisterForMenu("StatsMenu")
  ArktusCalculate()
  SetArktusMagnitude()
EndEvent

Event OnMenuOpen(String MenuName)
    If MenuName == "StatsMenu"
        if OldBaseMagicka != Caster.GetBaseAV("Magicka")
            ArktusCalculate()
            SetArktusMagnitude()
        endif
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akCaster.RemoveSpell(ArktusSpell)
    While akCaster.HasSpell(ArktusSpell)
        akCaster.RemoveSpell(ArktusSpell)
    EndWhile
    akCaster.RemoveSpell(ArktusController)
    While akCaster.HasSpell(ArktusController)
        akCaster.RemoveSpell(ArktusController)
    EndWhile
EndEvent
