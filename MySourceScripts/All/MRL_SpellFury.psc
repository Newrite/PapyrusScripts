Scriptname MRL_SpellFury extends activemagiceffect
{TODO:
1: Рассчет магнитуды абилки на удешевление, записать значение в глобалку
2: Рассчет магнитуды абилки на вытягивание магии
3: Обновление магнитуды удешевления при смене оружия
4: Выдача перка спелфури
5: Рассчет самого высокого навыка магии и запись значения в глобалку
6: Рассчет восстановления магии с удара и запись в глобалку (удешевление половина от этого значения)
7: Увеличение скорости каста спелов зависящее от двух перков, пишется в глобалку}

FormList Property SpellFurySpells auto

Perk property SpellFuryPerk01 auto
Perk property SpellFuryPerk02 auto
Perk property SpellFuryPerk03 auto

Spell property SpellCostReductionAbility auto
Spell property ManaDrainAbility auto
Spell Property ArmorBuff Auto

GlobalVariable property RestoreMagickaPerHit auto
GlobalVariable property TresholdDrainMagicka auto
GlobalVariable property SpellCostReduction auto
GlobalVariable property SpellCastSpeedFactor auto


string gSchoolMagicka = ""

actor Caster = none

Float MaxMagicka

bool RegisterStage = true

Function SetSchoolString()

	float temp = 0.0
	
	if temp < game.GetPlayer().GetActorValue("destruction") as Float
		temp = game.GetPlayer().GetActorValue("destruction") as Float
		gSchoolMagicka = "destruction"
	endif

	if temp < game.GetPlayer().GetActorValue("restoration") as Float
		temp = game.GetPlayer().GetActorValue("restoration") as Float
		gSchoolMagicka = "restoration"
	endif

	if temp < game.GetPlayer().GetActorValue("alteration") as Float
		temp = game.GetPlayer().GetActorValue("alteration") as Float
		gSchoolMagicka = "alteration"
	endif
	
	if temp < game.GetPlayer().GetActorValue("illusion") as Float
		temp = game.GetPlayer().GetActorValue("illusion") as Float
		gSchoolMagicka = "illusion"
	endif
	
	if temp < game.GetPlayer().GetActorValue("conjuration") as Float
		temp = game.GetPlayer().GetActorValue("conjuration") as Float
		gSchoolMagicka = "conjuration"
	endif
	
endFunction

Function SetSpellSpeedFactor()

    if Caster.HasPerk(SpellFuryPerk03)
        SpellCastSpeedFactor.SetValue(1.81)
        return
    endif

    if Caster.HasPerk(SpellFuryPerk02)
        SpellCastSpeedFactor.SetValue(1.42)
    endif

    if Caster.HasPerk(SpellFuryPerk01)
        SpellCastSpeedFactor.SetValue(1.17)
    endif

EndFunction

Function SetMagnitudeSpellCostReductionAbility()

    int i = 3

    while i
        i = i - 1
        SpellCostReductionAbility.SetNthEffectMagnitude(i, SpellCostReduction.GetValue() as Float)
    endWhile

EndFunction

Function SetMagnitudeManaDrainAbility()

    ;Debug.Notification("MaxMagicka: " + MaxMagicka)

    ManaDrainAbility.SetNthEffectMagnitude(0, MaxMagicka / 100 * 3 as Float)

EndFunction

Float Function GetMaxMagicka()

    return (Caster.GetActorValue("magicka") / Caster.GetActorValuePercentage("magicka")) as Float

EndFunction

Function UpdateGlobals()

    TresholdDrainMagicka.SetValue(Caster.GetActorValue(gSchoolMagicka) as Float * 0.5 / 100)
    RestoreMagickaPerHit.SetValue((Caster.GetEquippedWeapon(false).GetBaseDamage() as Float * 0.5) + (Caster.GetLevel() as Float * 0.5))
    SpellCostReduction.SetValue(RestoreMagickaPerHit.GetValue() as Float * 0.5)

EndFunction

Function ResetGlobals()

    SpellCastSpeedFactor.SetValue(1.0)
    TresholdDrainMagicka.SetValue(0.0)
    RestoreMagickaPerHit.SetValue(0.0)
    SpellCostReduction.SetValue(0.0)

EndFunction

Function AddAllSpells()
    
    int i = SpellFurySpells.GetSize()
    while i
        i = i - 1
        Caster.AddSpell(SpellFurySpells.GetAt(i) as Spell, false)
    endWhile

    Caster.AddSpell(SpellCostReductionAbility, false)
    Caster.AddSpell(ManaDrainAbility, false)

EndFunction

Function RemoveAllSpells()
    
    int i = SpellFurySpells.GetSize()
    while i
        i = i - 1
        Caster.RemoveSpell(SpellFurySpells.GetAt(i) as Spell)
    endWhile

    Caster.RemoveSpell(SpellCostReductionAbility)
    Caster.RemoveSpell(ManaDrainAbility)

EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)

    Caster = akCaster

    Utility.Wait(1.0)

    RemoveAllSpells()

    SetSchoolString()
    SetSpellSpeedFactor()

    UpdateGlobals()

    SetMagnitudeManaDrainAbility()
    SetMagnitudeSpellCostReductionAbility()

    AddAllSpells()

    RegisterForSingleUpdate(5.0)

endEvent

Event OnSpellCast(Form akSpell)

    if akSpell as Spell

            if Caster.HasPerk(SpellFuryPerk02)

                ArmorBuff.Cast(Caster, Caster)

            endif
    endif

EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

  if akBaseObject as Weapon

    Utility.Wait(1)
    UpdateGlobals()
    Caster.RemoveSpell(SpellCostReductionAbility)
    SetMagnitudeSpellCostReductionAbility()
    Caster.AddSpell(SpellCostReductionAbility, false)

  endif

endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

  if akBaseObject as Weapon

    UpdateGlobals()
    Caster.RemoveSpell(SpellCostReductionAbility)
    SetMagnitudeSpellCostReductionAbility()
    Caster.AddSpell(SpellCostReductionAbility, false)

  endif

endEvent

Event OnUpdate()

	if RegisterStage == false

		UnregisterForUpdate()
		return

	else
        
        SetSchoolString()
        SetSpellSpeedFactor()

        Float mag = GetMaxMagicka()
        
		if (Math.abs(MaxMagicka - mag)  > 3.0)
            MaxMagicka = mag
            Caster.RemoveSpell(ManaDrainAbility)
            SetMagnitudeManaDrainAbility()
            Caster.AddSpell(ManaDrainAbility, false)

        endif

	endif

	RegisterForSingleUpdate(5.0)

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    RegisterStage = false
    RemoveAllSpells()
    ResetGlobals()

EndEvent