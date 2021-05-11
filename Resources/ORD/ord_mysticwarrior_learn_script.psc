Scriptname ORD_MysticWarrior_Learn_Script extends activemagiceffect  

; -----

FormList Property ORD_Enc_MysticWarrior_FormList Auto
Message Property ORD_Enc_MysticWarrior_Message Auto
ImagespaceModifier Property ORD_Alt_Cast_Imod Auto
Keyword Property MagicRitualSpell Auto
FormList Property ORD_Enc_MysticWarrior_FormList_Exclusion Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell EquippedSpell = akTarget.GetEquippedSpell(0)
	If EquippedSpell.HasKeyword(MagicRitualSpell) == false && ORD_Enc_MysticWarrior_FormList_Exclusion.Find(EquippedSpell) == -1
		ORD_Enc_MysticWarrior_FormList.Revert()
		ORD_Enc_MysticWarrior_FormList.AddForm(EquippedSpell)
		ORD_Alt_Cast_Imod.Apply()
		ORD_Enc_MysticWarrior_Message.Show()
	EndIf

EndEvent

; -----