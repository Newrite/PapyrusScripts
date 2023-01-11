Scriptname WB_OcatosRecital2_Script extends ActiveMagicEffect  

; -----

FormList Property WB_AlterationMetamagic_OcatosRecital_FormList Auto
FormList Property WB_AlterationMetamagic_OcatosRecital_FormList_SpellsOut Auto
Message Property WB_AlterationMetamagic_OcatosRecital_Message Auto
Message Property WB_AlterationMetamagic_OcatosRecital_Message_Fail Auto
Message Property WB_AlterationMetamagic_OcatosRecital_Message_TooMany Auto
ImagespaceModifier Property WB_AlterationMetamagic_Imod_Outro Auto
Message Property WB_AlterationMetamagic_OcatosRecital_Message_Double Auto

Int Property WB_SpellMax Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

;	WB_AlterationMetamagic_OcatosRecital_FormList.Revert()
	Spell EquippedSpell = akTarget.GetEquippedSpell(0) as Spell

	If EquippedSpell && !WB_AlterationMetamagic_OcatosRecital_FormList_SpellsOut.HasForm(EquippedSpell) && !EquippedSpell.IsHostile()
		If WB_AlterationMetamagic_OcatosRecital_FormList.GetSize() < WB_SpellMax && EquippedSpell
			If WB_AlterationMetamagic_OcatosRecital_FormList.HasForm(EquippedSpell)
				WB_AlterationMetamagic_OcatosRecital_Message_Double.Show()
			Else
				WB_AlterationMetamagic_Imod_Outro.Apply()
				WB_AlterationMetamagic_OcatosRecital_FormList.AddForm(EquippedSpell)
				WB_AlterationMetamagic_OcatosRecital_Message.Show(WB_AlterationMetamagic_OcatosRecital_FormList.GetSize(), WB_SpellMax)
			EndIf
		Else
			WB_AlterationMetamagic_OcatosRecital_Message_TooMany.Show(WB_AlterationMetamagic_OcatosRecital_FormList.GetSize())
		EndIf
	Else
		WB_AlterationMetamagic_OcatosRecital_Message_Fail.Show()
	EndIf

EndEvent

; -----