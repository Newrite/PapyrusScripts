ScriptName MRL_RBB_ArktusScriptController Extends ActiveMagicEffect

Spell Property ArktusSpell Auto
Spell Property ArktusController Auto

Float Property DamagePerBaseMana Auto

Float WeaponDamage = 0.0
Float OldBaseMagicka = 0.0

Actor Caster

Function ArktusCalculate()
  OldBaseMagicka = Caster.GetBaseAV("Magicka")
  If (OldBaseMagicka > 100)
      WeaponDamage = (OldBaseMagicka - 100) * DamagePerBaseMana
  EndIf
EndFunction

Function SetArktusMagnitude()
  if Caster.HasSpell(ArktusSpell)
      Caster.RemoveSpell(ArktusSpell)
  endif
  ArktusSpell.SetNthEffectMagnitude(0, WeaponDamage)
  ArktusSpell.SetNthEffectMagnitude(1, WeaponDamage)
  ArktusSpell.SetNthEffectMagnitude(2, WeaponDamage)
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
