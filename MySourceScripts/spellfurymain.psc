scriptName SpellFuryMain extends activemagiceffect

FormList Property ListOfSpellFury auto
perk property SpellFuryPerk auto
spell property SpellFuryCostReductionAbility auto
globalvariable property SpellFuryGlobalValue auto
globalvariable property SpellFuryGlobalValueSchool auto
globalvariable property SpellFuryGlobalValueCostReduction auto
globalvariable property SpellFuryGlobalValueSpeedCastFactor auto
int indexSpell = 3
string schoolMagicka = "destruction"

Function SetSchoolString()

	float temp = 0.0
	
	if temp < game.GetPlayer().GetActorValue("destruction") as Float
		temp = game.GetPlayer().GetActorValue("destruction") as Float
		schoolMagicka = "destruction"
	endif

	if temp < game.GetPlayer().GetActorValue("restoration") as Float
		temp = game.GetPlayer().GetActorValue("restoration") as Float
		schoolMagicka = "restoration"
	endif

	if temp < game.GetPlayer().GetActorValue("alteration") as Float
		temp = game.GetPlayer().GetActorValue("alteration") as Float
		schoolMagicka = "alteration"
	endif
	
	if temp < game.GetPlayer().GetActorValue("illusion") as Float
		temp = game.GetPlayer().GetActorValue("illusion") as Float
		schoolMagicka = "illusion"
	endif
	
	if temp < game.GetPlayer().GetActorValue("conjuration") as Float
		temp = game.GetPlayer().GetActorValue("conjuration") as Float
		schoolMagicka = "conjuration"
	endif
	
endFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)

	SpellFuryGlobalValue.SetValue((game.GetPlayer().GetEquippedWeapon(false).GetBaseDamage() as Float * 0.50) + (game.GetPlayer().GetLevel() as Float * 0.5))
	
    Int iIndex = ListOfSpellFury.GetSize()
    While iIndex
        iIndex -= 1
        game.GetPlayer().AddSpell(ListOfSpellFury.GetAt(iIndex) As Spell, false)
    EndWhile
	
	game.GetPlayer().AddPerk(SpellFuryPerk)
	
	SetSchoolString()
	SpellFuryGlobalValueSchool.SetValue(game.GetPlayer().GetActorValue(schoolMagicka) as Float * 0.50 / 100)
	SpellFuryGlobalValueSpeedCastFactor.SetValue(2.0)
	SpellFuryGlobalValueCostReduction.SetValue(SpellFuryGlobalValue.GetValue() as Float * 0.50)
	
	While indexSpell
		indexSpell -= 1
		SpellFuryCostReductionAbility.SetNthEffectMagnitude(indexSpell, SpellFuryGlobalValueCostReduction.GetValue() as Float)
	EndWhile
	game.GetPlayer().AddSpell(SpellFuryCostReductionAbility As Spell, false)
	indexSpell = 3
	
endEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

  if akBaseObject as Weapon
    Utility.Wait(1)
	
	game.GetPlayer().RemoveSpell(SpellFuryCostReductionAbility As Spell)
	SpellFuryGlobalValue.SetValue((game.GetPlayer().GetEquippedWeapon(false).GetBaseDamage() as Float * 0.50) + (game.GetPlayer().GetLevel() as Float * 0.5))
	SetSchoolString()
	SpellFuryGlobalValueSchool.SetValue(game.GetPlayer().GetActorValue(schoolMagicka) as Float * 0.50 / 100)
	SpellFuryGlobalValueCostReduction.SetValue(SpellFuryGlobalValue.GetValue() as Float * 0.50)
	
	While indexSpell
		indexSpell -= 1
		SpellFuryCostReductionAbility.SetNthEffectMagnitude(indexSpell, SpellFuryGlobalValueCostReduction.GetValue() as Float)
	EndWhile
	game.GetPlayer().RemoveSpell(SpellFuryCostReductionAbility As Spell)
	game.GetPlayer().AddSpell(SpellFuryCostReductionAbility As Spell, false)
	indexSpell = 3
	
  endIf
  
endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

  if akBaseObject as Weapon
  
	SpellFuryGlobalValue.SetValue((game.GetPlayer().GetEquippedWeapon(false).GetBaseDamage() as Float * 0.50) + (game.GetPlayer().GetLevel() as Float * 0.5))
	SetSchoolString()
	SpellFuryGlobalValueSchool.SetValue(game.GetPlayer().GetActorValue(schoolMagicka) as Float * 0.50 / 100)
	SpellFuryGlobalValueCostReduction.SetValue(SpellFuryGlobalValue.GetValue() as Float * 0.50)
	
	While indexSpell
		indexSpell -= 1
		SpellFuryCostReductionAbility.SetNthEffectMagnitude(indexSpell, SpellFuryGlobalValueCostReduction.GetValue() as Float)
	EndWhile
	game.GetPlayer().RemoveSpell(SpellFuryCostReductionAbility As Spell)
	game.GetPlayer().AddSpell(SpellFuryCostReductionAbility As Spell, false)
	indexSpell = 3
	
  endIf
  
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Int iIndex = ListOfSpellFury.GetSize()
    While iIndex
        iIndex -= 1
        game.GetPlayer().RemoveSpell(ListOfSpellFury.GetAt(iIndex) As Spell)
    EndWhile
	
	game.GetPlayer().RemoveSpell(SpellFuryCostReductionAbility As Spell)
	
	SpellFuryGlobalValue.SetValue(0.0)
	SpellFuryGlobalValueSchool.SetValue(0.0)
	SpellFuryGlobalValueSpeedCastFactor.SetValue(1.0)
	SpellFuryGlobalValueCostReduction.SetValue(0.0)
	
endEvent