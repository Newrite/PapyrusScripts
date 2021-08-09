scriptname MRL_CurseOfMagicka extends activemagiceffect

;;;

FormList Property listOfNovicePerks auto
FormList Property listOfApprenticePerks auto
FormList Property listOfAdeptPerks auto
FormList Property listOfExpertPerks auto
FormList Property listOfMasterPerks auto

Spell Property CursedRegenSpell auto
Spell Property CursedExplosion auto

GlobalVariable Property gCurseDamage Auto
GlobalVariable Property gCurseCost Auto
GlobalVariable Property gCurseSummon Auto
GlobalVariable Property gCurseMultiplay Auto

Float Property MaxCurseDamage Auto
Float Property MaxCurseSummon Auto
Float Property MaxCurseCost Auto

Keyword Property LichKeyword auto

Actor CursedActor

int iLeftCastIndex = 0
int iRightCastIndex = 1
int iDualCastIndex = 2

float fLichMultiplay = 1.0
float fConstDamageExplosion = 50.0

Spell SpellLeft
Spell SpellRight

string sCrusedValue = "EnchantingSkillAdvance"

bool bRegisterStage = true

;;;

bool Function IsConcentratedSpell(Spell akSpell)

	if (akSpell.GetNthEffectMagicEffect(akSpell.GetCostliestEffectIndex())).GetCastingType() == 2
		return 1
	endif

	return 0

endFunction

Function UpdateSpells()

	if (CursedActor.GetEquippedObject(0) as Spell)
		SpellLeft = CursedActor.GetEquippedSpell(0)
	endif

	if (CursedActor.GetEquippedObject(1) as Spell)
		SpellRight = CursedActor.GetEquippedSpell(1)
	endif

EndFunction

bool Function WaitCondition(int index)

	if index == iLeftCastIndex
		return CursedActor.GetAnimationVariableBool("IsCastingLeft") && !(CursedActor.GetAnimationVariableBool("IsCastingRight") && IsConcentratedSpell(SpellRight))
	endif

	if index == iRightCastIndex
		return !(CursedActor.GetAnimationVariableBool("IsCastingLeft") && IsConcentratedSpell(SpellLeft)) && CursedActor.GetAnimationVariableBool("IsCastingRight")
	endif

	if index == iDualCastIndex
		return CursedActor.GetAnimationVariableBool("IsCastingLeft") && CursedActor.GetAnimationVariableBool("IsCastingRight") || CursedActor.GetAnimationVariableBool("IsCastingDual")
	endif

	return 0

endFunction

Function OverExplosion()

	float ExplosionValue = CursedActor.GetActorValue("Health") as Float / CursedActor.GetActorValuePercentage("Health") as Float * 0.5

	float fDiffMultHPToPCL = Game.GetGameSettingfloat("fDiffMultHPToPCL")

	CursedExplosion.SetNthEffectMagnitude(0, (fConstDamageExplosion + ExplosionValue) / fDiffMultHPToPCL)
	CursedExplosion.SetNthEffectMagnitude(1, (fConstDamageExplosion + ExplosionValue) / fDiffMultHPToPCL)

	CursedExplosion.Cast(CursedActor, CursedActor)
	CursedActor.ModActorValue(sCrusedValue, -100.0)

EndFunction

Function ApplyConcCursed(float Cost, int WaitIndex)

	while WaitCondition(WaitIndex) && CursedActor.IsInCombat()

		if CursedActor.GetActorValue(sCrusedValue) as Float < 100.0
			CursedActor.ModActorValue(sCrusedValue, Cost)
			CursedActor.DamageActorValue("Stamina", Cost)
		endif

		if CursedActor.GetActorValue(sCrusedValue) as Float >= 100.0
			OverExplosion()
		endif

		Utility.Wait(1.0)

	endwhile

endFunction

float function CursedValueFromPerk(Perk akPerk)

	Int iIndex = listOfNovicePerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if akPerk == listOfNovicePerks.GetAt(iIndex) As Perk
			return 1.0
		endif
    EndWhile
	
	iIndex = listOfApprenticePerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if akPerk == listOfApprenticePerks.GetAt(iIndex) As Perk
			return 2.0
		endif
    EndWhile
	
	iIndex = listOfAdeptPerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if akPerk == listOfAdeptPerks.GetAt(iIndex) As Perk
			return 3.0
		endif
    EndWhile
	
	iIndex = listOfExpertPerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if akPerk == listOfExpertPerks.GetAt(iIndex) As Perk
			return 4.0
		endif
    EndWhile
	
	iIndex = listOfMasterPerks.GetSize() as int
    While iIndex
        iIndex -= 1
		if akPerk == listOfMasterPerks.GetAt(iIndex) As Perk
			return 5.0
		endif
    EndWhile
	
	return 0.0
	
endfunction

function UpdateGlobals()

	float EnchantingSkillAdvance = cursedActor.GetActorValue(sCrusedValue) as Float

	if EnchantingSkillAdvance >= 100.0
		gCurseDamage.SetValue(MaxCurseDamage)
		gCurseCost.SetValue(MaxCurseCost)
		gCurseSummon.SetValue(MaxCurseSummon)
	else
		gCurseDamage.SetValue(EnchantingSkillAdvance * 0.5)
		gCurseCost.SetValue(EnchantingSkillAdvance * 0.5)
		gCurseSummon.SetValue(EnchantingSkillAdvance * 0.25)
	endif

endFunction

Function SpellCurse(Form akSpell, float CurseValue)

	if IsConcentratedSpell(akSpell as Spell)

		bool bDual = CursedActor.GetAnimationVariableBool("IsCastingDual")

		if bDual && IsConcentratedSpell(SpellRight)
			ApplyConcCursed(CurseValue / 2.0, iDualCastIndex)
		endif

		if akSpell == SpellLeft && CursedActor.GetAnimationVariableBool("IsCastingLeft")
			ApplyConcCursed(CurseValue / 2.0, iLeftCastIndex)
		endif

		if akSpell == SpellRight && CursedActor.GetAnimationVariableBool("IsCastingRight")
			ApplyConcCursed(CurseValue / 2.0, iRightCastIndex)
		endif

		CursedRegenSpell.SetNthEffectMagnitude(0, CurseValue * 3.0)
		CursedRegenSpell.Cast(CursedActor, CursedActor)

	else
		CursedActor.ModActorValue(sCrusedValue, CurseValue as Float)
		CursedActor.DamageActorValue("Stamina", CurseValue as Float)
		CursedRegenSpell.SetNthEffectMagnitude(0, CurseValue * 3.0)
		CursedRegenSpell.Cast(CursedActor, CursedActor)
		
		if CursedActor.GetActorValue(sCrusedValue) as Float >= 100.0
			OverExplosion()
		endif

	endif



EndFunction

Function EnchantmentCurse()

	float EnchantingSkillAdvance = CursedActor.GetActorValue(sCrusedValue) as Float

	if (EnchantingSkillAdvance < 5.0) && (EnchantingSkillAdvance > 0)
		CursedActor.ModActorValue(sCrusedValue, -EnchantingSkillAdvance)
	endif
	
	if EnchantingSkillAdvance >= 5.0 
		CursedActor.ModActorValue(sCrusedValue, -(1.0 + ((EnchantingSkillAdvance / 60.0) * (EnchantingSkillAdvance / 60.0))) * 4.0)
	endif

EndFunction

;;;

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

	UpdateSpells()

endEvent

Event OnSpellCast(Form akSpell)

	if CursedActor.IsInCombat()

		if CursedActor.GetActorValue("EnchantingSkillAdvance") as Float < 100.0
			Spell spellCast = akSpell as Spell

			if spellCast

				float CurseValue = CursedValueFromPerk(spellCast.GetPerk() as Perk)
				if CurseValue > 0.1
					;;SpellCurse(akSpell, CurseValue * gCurseMultiplay.GetValue() as Float * fLichMultiplay)
					SpellCurse(akSpell, CurseValue * fLichMultiplay)
				endif

			endif

		endif

		Enchantment enchCast = akSpell as Enchantment

		if enchCast
			EnchantmentCurse()
		endif

	endif

endEvent

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)

	if cursedActor.IsInCombat()

		Enchantment bowEnch = akWeapon.GetEnchantment()

		if bowEnch
			EnchantmentCurse()
		endif

	endif

EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)

		bRegisterStage = true
		CursedActor = akCaster
		UpdateGlobals()
		RegisterForSingleUpdate(3.0)
		
endEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)

	bRegisterStage = false

endEvent

Event OnUpdate()

	if bRegisterStage == false
		UnregisterForUpdate()
		return
	else
		UpdateGlobals()
		if CursedActor.HasKeyword(LichKeyword)
			fLichMultiplay = 0.5
		else
			fLichMultiplay = 1.0
		endif
	endif

	RegisterForSingleUpdate(3.0)

EndEvent