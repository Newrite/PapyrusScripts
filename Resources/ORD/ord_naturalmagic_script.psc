Scriptname ORD_NaturalMagic_Script extends activemagiceffect  

; -----

FormList Property ORD_Alt_NaturalMagic_FormList Auto
Message Property ORD_Alt_NaturalMagic_Message Auto
ImagespaceModifier Property ORD_Alt_Cast_Imod Auto
Keyword Property MagicRitualSpell Auto
FormList Property ORD_Alt_NaturalMagic_FormList_Exclusion Auto
Message Property ORD_Alt_NaturalMagic_Message_Fail_Ritual Auto
Message Property ORD_Alt_NaturalMagic_Message_Fail_Exclusion Auto
Sound Property MAGFail Auto
Sound Property ORD_Enc_MysticWarrior_Marker_Power Auto
FormList Property ORD_Alt_ArcaneThesis_FormList_Compatibility_IfThisSpell Auto
FormList Property ORD_Alt_ArcaneThesis_FormList_Compatibility_ThenThisSpell Auto
Spell Property ORD_Alt_NaturalMagic_Spell_Power_Learn Auto
Spell Property ORD_Alt_NaturalMagic_Spell_Power_Cast Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell EquippedSpell = akTarget.GetEquippedSpell(0)
	If EquippedSpell.HasKeyword(MagicRitualSpell) == false
		If ORD_Alt_NaturalMagic_FormList_Exclusion.Find(EquippedSpell) == -1
			ORD_Alt_NaturalMagic_FormList.Revert()
			ORD_Alt_NaturalMagic_FormList.AddForm(EquippedSpell)

			Int ExceptionListID = ORD_Alt_ArcaneThesis_FormList_Compatibility_IfThisSpell.Find(EquippedSpell)
			If ExceptionListID != -1
				; is in special treatment list
				Spell ProcSpell = ORD_Alt_ArcaneThesis_FormList_Compatibility_ThenThisSpell.GetAt(ExceptionListID) as Spell
				ORD_Alt_NaturalMagic_FormList.AddForm(ProcSpell)
			EndIf

			ORD_Alt_Cast_Imod.Apply()
			ORD_Enc_MysticWarrior_Marker_Power.Play(akTarget)
			ORD_Alt_NaturalMagic_Message.Show()
			akTarget.UnequipSpell(EquippedSpell,0)
			akTarget.UnequipSpell(EquippedSpell,1)
			akTarget.RemoveSpell(EquippedSpell)
			akTarget.RemoveSpell(ORD_Alt_NaturalMagic_Spell_Power_Learn)
			akTarget.AddSpell(ORD_Alt_NaturalMagic_Spell_Power_Cast,false)
			akTarget.EquipSpell(ORD_Alt_NaturalMagic_Spell_Power_Cast,2)
		Else
			MAGFail.Play(akTarget)	
			ORD_Alt_NaturalMagic_Message_Fail_Exclusion.Show()
		EndIf
	Else
		MAGFail.Play(akTarget)
		ORD_Alt_NaturalMagic_Message_Fail_Ritual.Show()
	EndIf

EndEvent

; -----