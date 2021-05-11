Scriptname ORD_MysticWarrior_Power_Learn_Script extends activemagiceffect  

; -----

FormList Property ORD_Enc_MysticWarrior_FormList Auto
Message Property ORD_Enc_MysticWarrior_Message Auto
ImagespaceModifier Property ORD_Alt_Cast_Imod Auto
Keyword Property MagicRitualSpell Auto
FormList Property ORD_Enc_MysticWarrior_FormList_Exclusion Auto
Message Property ORD_Enc_MysticWarrior_Message_Fail_Ritual Auto
Message Property ORD_Enc_MysticWarrior_Message_Fail_Exclusion Auto
Sound Property MAGFail Auto
Sound Property ORD_Enc_MysticWarrior_Marker_Power Auto
Message Property ORD_Enc_MysticWarrior_Message_Fail_NoDualCast Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.GetAnimationVariableBool("IsCastingDual")
		Spell EquippedSpell = akTarget.GetEquippedSpell(0)
		If EquippedSpell.HasKeyword(MagicRitualSpell) == false
			If ORD_Enc_MysticWarrior_FormList_Exclusion.Find(EquippedSpell) == -1
				ORD_Enc_MysticWarrior_FormList.Revert()
				ORD_Enc_MysticWarrior_FormList.AddForm(EquippedSpell)
				ORD_Alt_Cast_Imod.Apply()
				ORD_Enc_MysticWarrior_Marker_Power.Play(akTarget)
				ORD_Enc_MysticWarrior_Message.Show()
			Else
				MAGFail.Play(akTarget)	
				ORD_Enc_MysticWarrior_Message_Fail_Exclusion.Show()
			EndIf
		Else
			MAGFail.Play(akTarget)
			ORD_Enc_MysticWarrior_Message_Fail_Ritual.Show()
		EndIf
	Else
		ORD_Enc_MysticWarrior_Message_Fail_NoDualCast.Show()
	EndIf


EndEvent

; -----