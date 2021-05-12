;/ Decompiled by Champollion V1.0.1
Source   : MRL_newEnchAddDaggers.psc
Modified : 2021-02-13 16:08:06
Compiled : 2021-02-13 16:09:53
User     : newrite
Computer : WINDOWS
/;
scriptName MRL_newEnchAddDaggers extends activemagiceffect

;-- Properties --------------------------------------
formlist property LiftOfItemsToAdd auto
soulgem property SoulGemGrandFilled auto
weapon property weaponToRemove auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnEffectStart(Actor Target, Actor Caster)

	Int iIndex = LiftOfItemsToAdd.GetSize()
	if Caster.GetItemCount(weaponToRemove as form) >= iIndex + 1 && Caster.GetItemCount(SoulGemGrandFilled as form) >= 1
		Caster.RemoveItem(weaponToRemove as form, iIndex + 1, false, none)
		Caster.RemoveItem(SoulGemGrandFilled as form, 1, false, none)
		while iIndex
			iIndex -= 1
			Caster.AddItem((LiftOfItemsToAdd.GetAt(iIndex) as weapon) as form, 1, false)
		endWhile
	else
		debug.Notification("РњРЅРµ РЅРµ С…РІР°С‚Р°РµС‚ Р·Р°РіРѕС‚РѕРІРєРё РёР»Рё Р·Р°РїРѕР»РЅРµРЅРЅРѕРіРѕ РІРµР»РёРєРѕРіРѕ РєР°РјРЅСЏ РґСѓС€")
	endIf
endFunction
