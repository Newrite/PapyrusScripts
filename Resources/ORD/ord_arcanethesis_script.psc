Scriptname ORD_ArcaneThesis_Script extends activemagiceffect  

; -----

FormList Property ORD_Alt_ArcaneThesis_FormList Auto
Message Property ORD_Alt_ArcaneThesis_Message Auto
ImagespaceModifier Property ORD_Alt_Cast_Imod Auto
FormList Property ORD_Alt_ArcaneThesis_FormList_Compatibility_IfThisSpell Auto
FormList Property ORD_Alt_ArcaneThesis_FormList_Compatibility_ThenThisSpell Auto
GlobalVariable Property ORD_Alt_ArcaneThesis_Global_Status Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Alt_ArcaneThesis_Global_Status.GetValue() == 0

		ORD_Alt_ArcaneThesis_Global_Status.SetValue(1)
		ORD_Alt_ArcaneThesis_FormList.Revert()

		Spell EquippedSpell = akTarget.GetEquippedSpell(0)
		ORD_Alt_ArcaneThesis_FormList.AddForm(EquippedSpell)

		Int ExceptionListID = ORD_Alt_ArcaneThesis_FormList_Compatibility_IfThisSpell.Find(EquippedSpell)
		If ExceptionListID != -1
			; is in special treatment list
			Spell ProcSpell = ORD_Alt_ArcaneThesis_FormList_Compatibility_ThenThisSpell.GetAt(ExceptionListID) as Spell
			ORD_Alt_ArcaneThesis_FormList.AddForm(ProcSpell)
		EndIf

		Utility.Wait(0.01)
		ORD_Alt_Cast_Imod.Apply()
		ORD_Alt_ArcaneThesis_Message.Show()
	EndIf

EndEvent

; -----