;/ Decompiled by Champollion V1.0.1
Source   : WB_OcatosRecital_Ab_Script.psc
Modified : 2015-04-25 18:22:35
Compiled : 2015-04-25 18:22:36
User     : Maximilian
Computer : MONETA
/;
scriptName WB_OcatosRecital_Ab_Script extends activemagiceffect

;-- Properties --------------------------------------
formlist property WB_AlterationMetamagic_OcatosRecital_FormList auto

;-- Variables ---------------------------------------
Int i
Spell TheSpell

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

	i = 0
	while i < WB_AlterationMetamagic_OcatosRecital_FormList.GetSize()
		TheSpell = WB_AlterationMetamagic_OcatosRecital_FormList.GetAt(i) as Spell
		TheSpell.Cast(akTarget as objectreference, none)
		i += 1
	endWhile
endFunction
