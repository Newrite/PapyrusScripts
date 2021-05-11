Scriptname ORD_ArcaneThesis_Power_Learn_Script extends activemagiceffect  

; -----

FormList Property ORD_Alt_ArcaneThesis_FormList Auto
Message Property ORD_Alt_ArcaneThesis_Message Auto
ImagespaceModifier Property ORD_Alt_Cast_Imod Auto
FormList Property ORD_Alt_ArcaneThesis_FormList_Compatibility_IfThisSpell Auto
FormList Property ORD_Alt_ArcaneThesis_FormList_Compatibility_ThenThisSpell Auto
GlobalVariable Property ORD_Alt_ArcaneThesis_Global_Status Auto
Message Property ORD_Alt_ArcaneThesis_Message_Fail_AlreadySaved Auto
Sound Property MAGFail Auto
Spell Property ORD_Alt_ArcaneThesis_Spell_Power_Learn Auto
Message Property ORD_Alt_ArcaneThesis_Message_Fail_NoDualCast Auto
Keyword Property MagicRitualSpell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell EquippedSpell = akTarget.GetEquippedSpell(0)
	If akTarget.GetAnimationVariableBool("IsCastingDual") || EquippedSpell.HasKeyword(MagicRitualSpell)

		If ORD_Alt_ArcaneThesis_Global_Status.GetValue() == 0

			ORD_Alt_ArcaneThesis_Global_Status.SetValue(1)
			ORD_Alt_ArcaneThesis_FormList.Revert()
			ORD_Alt_ArcaneThesis_FormList.AddForm(EquippedSpell)
			Int ExceptionListID = ORD_Alt_ArcaneThesis_FormList_Compatibility_IfThisSpell.Find(EquippedSpell)
			If ExceptionListID != -1
				; is in special treatment list
				Spell ProcSpell = ORD_Alt_ArcaneThesis_FormList_Compatibility_ThenThisSpell.GetAt(ExceptionListID) as Spell
				ORD_Alt_ArcaneThesis_FormList.AddForm(ProcSpell)
			EndIf

			ORD_Alt_Cast_Imod.Apply()
			ORD_Alt_ArcaneThesis_Message.Show()
			akTarget.RemoveSpell(ORD_Alt_ArcaneThesis_Spell_Power_Learn)
		Else
			MAGFail.Play(akTarget)
			ORD_Alt_ArcaneThesis_Message_Fail_AlreadySaved.Show()
		EndIf
	Else
		ORD_Alt_ArcaneThesis_Message_Fail_NoDualCast.Show()
	EndIf

EndEvent

; -----