;/ Decompiled by Champollion V1.0.1
Source   : WB_OcatosRecital2_Script.psc
Modified : 2015-04-25 18:27:25
Compiled : 2015-04-25 18:27:26
User     : Maximilian
Computer : MONETA
/;
scriptName WB_OcatosRecital2_Script extends ActiveMagicEffect

;-- Properties --------------------------------------
Int property WB_SpellMax auto
message property WB_AlterationMetamagic_OcatosRecital_Message_Double auto
imagespacemodifier property WB_AlterationMetamagic_Imod_Outro auto
message property WB_AlterationMetamagic_OcatosRecital_Message_TooMany auto
message property WB_AlterationMetamagic_OcatosRecital_Message auto
formlist property WB_AlterationMetamagic_OcatosRecital_FormList auto
message property WB_AlterationMetamagic_OcatosRecital_Message_Fail auto
formlist property WB_AlterationMetamagic_OcatosRecital_FormList_SpellsOut auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

	spell EquippedSpell = akTarget.GetEquippedSpell(0)
	if EquippedSpell as Bool && !WB_AlterationMetamagic_OcatosRecital_FormList_SpellsOut.HasForm(EquippedSpell as form) && !EquippedSpell.IsHostile()
		if WB_AlterationMetamagic_OcatosRecital_FormList.GetSize() < WB_SpellMax && EquippedSpell as Bool
			if WB_AlterationMetamagic_OcatosRecital_FormList.HasForm(EquippedSpell as form)
				WB_AlterationMetamagic_OcatosRecital_Message_Double.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			else
				WB_AlterationMetamagic_Imod_Outro.Apply(1.00000)
				WB_AlterationMetamagic_OcatosRecital_FormList.AddForm(EquippedSpell as form)
				WB_AlterationMetamagic_OcatosRecital_Message.Show(WB_AlterationMetamagic_OcatosRecital_FormList.GetSize() as Float, WB_SpellMax as Float, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			endIf
		else
			WB_AlterationMetamagic_OcatosRecital_Message_TooMany.Show(WB_AlterationMetamagic_OcatosRecital_FormList.GetSize() as Float, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	else
		WB_AlterationMetamagic_OcatosRecital_Message_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endIf
endFunction

; Skipped compiler generated GetState
