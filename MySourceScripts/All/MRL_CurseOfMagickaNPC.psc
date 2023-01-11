scriptname MRL_CurseOfMagickaNPC extends activemagiceffect

;;;

FormList Property listOfNovicePerks auto
FormList Property listOfApprenticePerks auto
FormList Property listOfAdeptPerks auto
FormList Property listOfExpertPerks auto
FormList Property listOfMasterPerks auto

Spell Property CursedRegenSpell auto

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
string restorationMod = "RestorationMod"
string alterationMod = "AlterationMod"
string destructionMod = "DestructionMod"
string conjurationMod = "ConjurationMod"
string illusionMod = "IllusionMod"

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
		return CursedActor.GetAnimationVariableBool("IsCastingLeft") && IsConcentratedSpell(SpellLeft)
	endif

	if index == iRightCastIndex
		return IsConcentratedSpell(SpellRight) && CursedActor.GetAnimationVariableBool("IsCastingRight")
	endif

	if index == iDualCastIndex
		return (IsConcentratedSpell(SpellRight) && IsConcentratedSpell(SpellLeft)) && CursedActor.GetAnimationVariableBool("IsCastingDual")
	endif

	return false

endFunction

Function ApplyCurse(float[] arr)
	CursedActor.ModActorValue(sCrusedValue, arr[0])
	CursedActor.DamageActorValue("Stamina", arr[1])
	CursedRegenSpell.SetNthEffectMagnitude(0, arr[1])
	CursedRegenSpell.Cast(CursedActor, CursedActor)
EndFunction

Function ApplyConcCursed(float[] arr, int WaitIndex)

	while WaitCondition(WaitIndex) && CursedActor.IsInCombat()

		ApplyCurse(arr)

		Utility.Wait(1.0)

	endwhile

endFunction

float Function GetCurseMult(string avString)
	float av = CursedActor.GetActorValue(avString)
	if av > 60.0
		return 0.4
	endif
	if av <= 0.0
		return 1.0
	endif
	return 1 - (av / 100)
EndFunction

; 0 дестракт
; 1 восстановление
; 2 изменение
; 3 колдовство
; 4 иллюзии

string Function GetAvStringFromIndex(int i)
	if i == 0
		return destructionMod
	endif
	if i == 1
		return restorationMod
	endif
	if i == 2
		return alterationMod
	endif
	if i == 3
		return conjurationMod
	endif
	if i == 4
		return illusionMod
	endif
EndFunction

float[] function CursedValueFromPerk(Perk akPerk)

	float[] _return = new float[2]

	Int iIndex = listOfNovicePerks.GetSize() as int
    While iIndex
      iIndex -= 1
			if akPerk == listOfNovicePerks.GetAt(iIndex) As Perk
				float curseMult = GetCurseMult(GetAvStringFromIndex(iIndex))
				_return[0] = 0.5 * curseMult
				_return[1] = 3.0 * curseMult
				return _return
			endif
    EndWhile
	
	iIndex = listOfApprenticePerks.GetSize() as int
    While iIndex
      iIndex -= 1
			if akPerk == listOfApprenticePerks.GetAt(iIndex) As Perk
				float curseMult = GetCurseMult(GetAvStringFromIndex(iIndex))
				_return[0] = 1.0 * curseMult
				_return[1] = 6.0 * curseMult
				return _return
			endif
    EndWhile
	
	iIndex = listOfAdeptPerks.GetSize() as int
    While iIndex
      iIndex -= 1
			if akPerk == listOfAdeptPerks.GetAt(iIndex) As Perk
				float curseMult = GetCurseMult(GetAvStringFromIndex(iIndex))
				_return[0] = 2.0 * curseMult
				_return[1] = 9.0 * curseMult
				return _return
			endif
    EndWhile
	
	iIndex = listOfExpertPerks.GetSize() as int
    While iIndex
      iIndex -= 1
			if akPerk == listOfExpertPerks.GetAt(iIndex) As Perk
				float curseMult = GetCurseMult(GetAvStringFromIndex(iIndex))
				_return[0] = 3.0 * curseMult
				_return[1] = 12.0 * curseMult
				return _return
			endif
    EndWhile
	
	iIndex = listOfMasterPerks.GetSize() as int
    While iIndex
      iIndex -= 1
			if akPerk == listOfMasterPerks.GetAt(iIndex) As Perk
				float curseMult = GetCurseMult(GetAvStringFromIndex(iIndex))
				_return[0] = 4.0 * curseMult
				_return[1] = 15.0 * curseMult
				return _return
			endif
    EndWhile
	
	_return[0] = 0.0
	_return[1] = 0.0
	return _return
	
endfunction

Function SpellCurse(Form akSpell, float[] arr)

	if cursedActor.HasKeyword(LichKeyword)
		arr[0] = arr[0] * 0.5
	endif

	if IsConcentratedSpell(akSpell as Spell)

		arr[0] = arr[0] * 0.5
		arr[1] = arr[1] * 0.5

		bool bDual = CursedActor.GetAnimationVariableBool("IsCastingDual")

		if bDual
			ApplyConcCursed(arr, iDualCastIndex)
		endif

		if akSpell == SpellLeft && CursedActor.GetAnimationVariableBool("IsCastingLeft")
			ApplyConcCursed(arr, iLeftCastIndex)
		endif

		if akSpell == SpellRight && CursedActor.GetAnimationVariableBool("IsCastingRight")
			ApplyConcCursed(arr, iRightCastIndex)
		endif

	else

		ApplyCurse(arr)

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

		Spell spellCast = akSpell as Spell
		if spellCast
			float[] arr = CursedValueFromPerk(spellCast.GetPerk() as Perk)
			if arr[0] > 0.1
				arr[0] = arr[0] * fLichMultiplay
				arr[1] = arr[1] * fLichMultiplay
				SpellCurse(akSpell, arr)
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

		CursedActor = akCaster
		
endEvent
