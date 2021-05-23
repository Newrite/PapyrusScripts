scriptname MRL_CurseOfMagicka extends activemagiceffect

FormList Property listOfNovicePerks auto
FormList Property listOfApprenticePerks auto
FormList Property listOfAdeptPerks auto
FormList Property listOfExpertPerks auto
FormList Property listOfMasterPerks auto
Spell Property cursedRegenSpell auto
GlobalVariable Property gCurseDamage Auto
GlobalVariable Property gCurseCost Auto
GlobalVariable Property gCurseSummon Auto
Float Property MaxCurseDamage Auto
Float Property MaxCurseSummon Auto
Float Property MaxCurseCost Auto
Keyword Property LichKeyword auto
Keyword Property RitualSpellEffect auto

actor cursedActor
int LeftCastIndex = 0																;Used for function WaitCondition()
int RightCastIndex = 1																;Used for function WaitCondition()
int DualCastIndex = 2																;Used for function WaitCondition()
Spell SpellLeft																		;The spell equipped in the player's left hand.
Spell SpellRight		;The spell equipped in the player's right hand.											    		

bool registerStage = true

bool Function IsConcentrated(Spell s)												;Returns true if the spell is a concentration spell. Otherwise returns false.
	if (s.GetNthEffectMagicEffect(s.GetCostliestEffectIndex())).GetCastingType() == 2
		return 1
	else
		return 0
	endif
endFunction

bool Function IsRitualSpell(Spell s)												;Returns true if the spell is a ritual spell (FF or concentration). Otherwise returns false.
	if (s.GetNthEffectMagicEffect(0)).HasKeyword(RitualSpellEffect)
		return 1
	else
		return 0
	endif
endFunction

float function getSpellHalfCostPerk(perk spellPerk)

	Int iIndex = listOfNovicePerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if spellPerk == listOfNovicePerks.GetAt(iIndex) As Perk
			return 2.0
		endif
    EndWhile
	
	iIndex = listOfApprenticePerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if spellPerk == listOfApprenticePerks.GetAt(iIndex) As Perk
			return 4.0
		endif
    EndWhile
	
	iIndex = listOfAdeptPerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if spellPerk == listOfAdeptPerks.GetAt(iIndex) As Perk
			return 6.0
		endif
    EndWhile
	
	iIndex = listOfExpertPerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if spellPerk == listOfExpertPerks.GetAt(iIndex) As Perk
			return 8.0
		endif
    EndWhile
	
	iIndex = listOfMasterPerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if spellPerk == listOfMasterPerks.GetAt(iIndex) As Perk
			return 10.0
		endif
    EndWhile
	
	return 0.0
	
endfunction

Function UpdateSpells()																;Updates the spells that the player has equipped
	if (cursedActor.GetEquippedObject(0) as Spell)			
		SpellLeft = cursedActor.GetEquippedSpell(0)
	endif
	if (cursedActor.GetEquippedObject(1) as Spell)
		SpellRight = cursedActor.GetEquippedSpell(1)
	endif
endFunction

bool Function WaitCondition(int index)												;Returns the condition for applying the health cost while channeling concentration spells. Use the index variables for the parameter.
	if (index == LeftCastIndex)
		return cursedActor.GetAnimationVariableBool("IsCastingLeft") && !(cursedActor.GetAnimationVariableBool("IsCastingRight") && IsConcentrated(SpellRight))
	elseif (index == RightCastIndex)
		return !(cursedActor.GetAnimationVariableBool("IsCastingLeft") && IsConcentrated(SpellLeft)) && cursedActor.GetAnimationVariableBool("IsCastingRight")
	elseif (index == DualCastIndex)
		return cursedActor.GetAnimationVariableBool("IsCastingLeft") && cursedActor.GetAnimationVariableBool("IsCastingRight") || cursedActor.GetAnimationVariableBool("IsCastingDual")
	else
		return 0
	endif
endFunction

Function ApplyConcCursed(float Cost, int WaitIndex)
	cursedActor.ModActorValue("EnchantingSkillAdvance", Cost)
	cursedActor.DamageActorValue("Stamina", Cost)
	;Debug.Notification("ApplyConcCursed"+Cost)
	while (WaitCondition(WaitIndex))
		;Wait for the player to change the casting conditions.
		Utility.Wait(1.0)
		if cursedActor.GetActorValue("EnchantingSkillAdvance") as Float >= 100.0 || !cursedActor.IsInCombat()
			return
		endif
		cursedActor.ModActorValue("EnchantingSkillAdvance", Cost)
		cursedActor.DamageActorValue("Stamina", Cost)
		;Debug.Notification("fromwhile"+Cost)
	endwhile
endFunction

function updateGlobals()
	float EnchantingSkillAdvance = cursedActor.GetActorValue("EnchantingSkillAdvance") as Float
	if EnchantingSkillAdvance >= 100.0
		gCurseDamage.SetValue(MaxCurseDamage)
		gCurseCost.SetValue(MaxCurseCost)
		gCurseSummon.SetValue(MaxCurseSummon)
	else
		gCurseDamage.SetValue(EnchantingSkillAdvance * 0.2)
		gCurseCost.SetValue(EnchantingSkillAdvance * 0.5)
		gCurseSummon.SetValue(EnchantingSkillAdvance * 0.25)
	endif
endFunction

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)				;When something is equipped: 
	UpdateSpells()																	;Update spells.
endEvent

Event OnSpellCast(Form akSpell)
	;Debug.Notification("Proc EventSpellCast")
	;Debug.MessageBox("Proc EventSpellCast")
	if cursedActor.IsInCombat()
		if cursedActor.GetActorValue("EnchantingSkillAdvance") as Float < 100.0
			Spell spellCast = akSpell as Spell
			if spellCast
				;Debug.Notification("This is Spell")
				float varCurse = getSpellHalfCostPerk(spellCast.GetPerk() as Perk)
				if varCurse > 0.1
					if cursedActor.HasKeyword(LichKeyword)
						varCurse = varCurse / 2.0
					endif
					;Debug.Notification("1:" + varCurse)
					if (IsConcentrated(spellCast))
						;Debug.Notification("Curse Stack Conc")
						bool bDual = (cursedActor.GetAnimationVariableBool("IsCastingLeft") && cursedActor.GetAnimationVariableBool("IsCastingRight") || cursedActor.GetAnimationVariableBool("IsCastingDual"))	
						if(IsRitualSpell(spellCast) && bDual)								
							ApplyConcCursed(varCurse / 2.0, DualCastIndex)
						elseif(bDual && IsConcentrated(SpellRight) && IsConcentrated(SpellLeft))
							ApplyConcCursed(varCurse / 2.0, DualCastIndex)
							if cursedActor.GetAnimationVariableBool("IsCastingLeft")
								spellCast = SpellLeft
							elseif cursedActor.GetAnimationVariableBool("IsCastingRight")
								spellCast = SpellRight
							endif
						endif 
						if(spellCast == SpellLeft && cursedActor.GetAnimationVariableBool("IsCastingLeft"))
							ApplyConcCursed(varCurse / 2.0, LeftCastIndex)
						elseif (spellCast == SpellRight && cursedActor.GetAnimationVariableBool("IsCastingRight"))
							ApplyConcCursed(varCurse / 2.0, RightCastIndex)
						endif
						cursedRegenSpell.SetNthEffectMagnitude(0, varCurse * 2.5)
						cursedRegenSpell.Cast(cursedActor, cursedActor)
					else
						;Debug.Notification("Curse FF Stack")
						cursedActor.ModActorValue("EnchantingSkillAdvance", varCurse as Float)
						cursedActor.DamageActorValue("Stamina", varCurse as Float)
						cursedRegenSpell.SetNthEffectMagnitude(0, varCurse * 2.5)
						cursedRegenSpell.Cast(cursedActor, cursedActor)
					endif
				endif
			endif
		endif
		Enchantment enchCast = akSpell as Enchantment
		if enchCast
			;Debug.Notification("This is Enchantment")
			float EnchantingSkillAdvance = cursedActor.GetActorValue("EnchantingSkillAdvance") as Float
			if (EnchantingSkillAdvance < 5.0) && (EnchantingSkillAdvance > 0)
				cursedActor.ModActorValue("EnchantingSkillAdvance", -EnchantingSkillAdvance)
			endif
			if EnchantingSkillAdvance >= 5.0 
				cursedActor.ModActorValue("EnchantingSkillAdvance", -(1.0 + ((EnchantingSkillAdvance / 60.0) * (EnchantingSkillAdvance / 60.0))) * 4.0)
			endif
		endif
	endif
endEvent

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)
	if cursedActor.IsInCombat()
		Enchantment bowEnch = akWeapon.GetEnchantment()
		if bowEnch
			;Debug.Notification("This is enchBowShot")
			float EnchantingSkillAdvance = cursedActor.GetActorValue("EnchantingSkillAdvance") as Float
			if (EnchantingSkillAdvance < 5.0) && (EnchantingSkillAdvance > 0)
				cursedActor.ModActorValue("EnchantingSkillAdvance", -EnchantingSkillAdvance)
			endif
			if EnchantingSkillAdvance >= 5.0 
				cursedActor.ModActorValue("EnchantingSkillAdvance", -(1.0 + ((EnchantingSkillAdvance / 60.0) * (EnchantingSkillAdvance / 60.0))) * 4.0)
			endif
		endif
	endif
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

		registerStage = true
		cursedActor = akCaster
		updateGlobals()
		RegisterForSingleUpdate(3.0)
		
endEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	registerStage = false
endEvent

Event OnUpdate()
	if registerStage == false
		UnregisterForUpdate()
		return
	else
		updateGlobals()
	endif
	RegisterForSingleUpdate(3.0)
EndEvent